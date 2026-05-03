import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// A response returned by [HiddenWebViewProxy.request], roughly mirroring a
/// `Fetch` response so it can be lifted into a Dio [Response] downstream.
class ProxyHttpResponse {
  ProxyHttpResponse({
    required this.status,
    required this.statusText,
    required this.url,
    required this.headers,
    required this.body,
  });

  final int status;
  final String statusText;
  final String url;
  final Map<String, String> headers;
  final String body;

  @override
  String toString() =>
      'ProxyHttpResponse(status=$status, url=$url, bodyLen=${body.length})';
}

/// Same shape as [ProxyHttpResponse] but the body is raw bytes, used for
/// binary downloads that would be corrupted if shoved through `text()`.
class ProxyBinaryResponse {
  ProxyBinaryResponse({
    required this.status,
    required this.statusText,
    required this.url,
    required this.headers,
    required this.bytes,
  });

  final int status;
  final String statusText;
  final String url;
  final Map<String, String> headers;
  final Uint8List bytes;

  @override
  String toString() =>
      'ProxyBinaryResponse(status=$status, url=$url, bodyLen=${bytes.length})';
}

/// Singleton that owns a hidden, persistent WebView used as a transport for
/// requests against Cloudflare-protected origins. Browser-grade TLS/HTTP2
/// fingerprints make Cloudflare treat traffic from the WebView as legitimate
/// without ever surfacing a challenge to the user.
class HiddenWebViewProxy {
  HiddenWebViewProxy._();

  static final HiddenWebViewProxy instance = HiddenWebViewProxy._();

  InAppWebViewController? _controller;
  Completer<void> _ready = Completer<void>();

  /// Future that completes once the proxy webview has loaded its bootstrap
  /// page (so that subsequent fetches share its origin/cookies).
  Future<void> get ready => _ready.future;

  bool get isReady => _ready.isCompleted;

  /// Called by [HiddenWebViewProxyHost] when the underlying [InAppWebView]
  /// is created.
  void attachController(InAppWebViewController controller) {
    _controller = controller;
    logger.d('[WebViewProxy] controller attached');
  }

  /// Called when the bootstrap page finishes loading.
  void markReady() {
    if (!_ready.isCompleted) {
      logger.i('[WebViewProxy] ready');
      _ready.complete();
    }
  }

  /// Reset readiness, e.g. when the underlying webview is recreated.
  void reset() {
    if (_ready.isCompleted) {
      _ready = Completer<void>();
    }
    _controller = null;
  }

  Completer<void>? _refreshCompleter;

  /// Reload the WebView's bootstrap page to pick up rotated cookies.
  ///
  /// Multiple callers hitting this concurrently share the same reload cycle.
  /// Returns once the page has finished loading or [timeout] is exceeded.
  Future<void> refreshSession({
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }
    final controller = _controller;
    if (controller == null) {
      return;
    }

    _refreshCompleter = Completer<void>();

    try {
      _ready = Completer<void>();
      await controller.loadUrl(
        urlRequest: URLRequest(url: WebUri('${NHConst.baseUrl}/')),
      );
      await ready.timeout(
        timeout,
        onTimeout: () {
          logger.w('[WebViewProxy] refreshSession timed out after $timeout');
        },
      );
    } catch (e) {
      logger.e('[WebViewProxy] refreshSession error: $e');
    } finally {
      if (!_refreshCompleter!.isCompleted) {
        _refreshCompleter!.complete();
      }
      _refreshCompleter = null;
    }
  }

  /// Read the freshest `access_token` from the WebView's `document.cookie`.
  /// Returns `null` if the WebView isn't ready or no token is found.
  Future<String?> getAccessToken() async {
    if (!isReady) {
      return null;
    }
    final controller = _controller;
    if (controller == null) {
      return null;
    }
    try {
      final cookie = await controller.evaluateJavascript(
        source: 'document.cookie',
      );
      if (cookie is String) {
        final match = RegExp(
          r'(?:^|; )access_token=([^;]+)',
        ).firstMatch(cookie);
        return match?.group(1);
      }
    } catch (_) {}
    return null;
  }

  /// Perform an HTTP request through the hidden WebView.
  ///
  /// [headers] should not include hop-by-hop entries that the browser refuses
  /// to set (e.g. `Cookie`, `Host`, `Content-Length`, `User-Agent` on Chromium).
  /// Those are silently ignored if present.
  Future<ProxyHttpResponse> request({
    required String url,
    String method = 'GET',
    Map<String, String>? headers,
    Object? body,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    await ready;
    final controller = _controller;
    if (controller == null) {
      throw StateError('HiddenWebViewProxy: controller not attached');
    }

    // Strip headers the browser refuses to set on a Fetch request.
    const forbidden = {
      'host',
      'cookie',
      'content-length',
      'user-agent',
      'accept-encoding',
      'connection',
      'origin',
      'referer',
    };
    final safeHeaders = <String, String>{};
    headers?.forEach((k, v) {
      if (!forbidden.contains(k.toLowerCase())) {
        safeHeaders[k] = v;
      }
    });

    final hasBody = body != null && method.toUpperCase() != 'GET';
    final bodyString = body == null
        ? null
        : (body is String ? body : jsonEncode(body));

    // Convert same-origin absolute URLs to a relative path. Chromium's
    // fetch() treats absolute URLs as cross-origin even when the host
    // matches `location.host`; the upshot is that custom headers like
    // `Authorization` get silently dropped by the spec-mandated CORS
    // sanitization. Same-origin fetches use a *relative* URL and behave
    // like normal browser navigation, with all our headers intact.
    String fetchUrl = url;
    try {
      final uri = Uri.parse(url);
      if (uri.host == 'nhentai.net' && uri.scheme == 'https') {
        fetchUrl = uri.path + (uri.hasQuery ? '?${uri.query}' : '');
      }
    } catch (_) {}

    final args = <String, dynamic>{
      'url': fetchUrl,
      'method': method.toUpperCase(),
      'headers': safeHeaders,
      'body': bodyString,
      'hasBody': hasBody,
    };

    // On HarmonyOS, callAsyncJavaScript never returns results (the JS→Dart
    // callback bridge is not implemented). Use evaluateJavascript + polling
    // as a workaround.
    if (Platform.operatingSystem == 'ohos') {
      return _requestViaPolling(
        controller: controller,
        url: url,
        fetchUrl: fetchUrl,
        method: method.toUpperCase(),
        headers: safeHeaders,
        bodyString: bodyString,
        hasBody: hasBody,
        timeout: timeout,
      );
    }

    const script = r'''
// nhentai's /api/v2/* requires `Authorization: User <access_token>`.
// Read the freshest access_token straight out of the browser's cookie
// jar so we always send the live value (the Dart-side CookieJar can lag
// behind nhentai's silent token rotation).
let finalHeaders = Object.assign({}, headers || {});
const isApiV2 = typeof url === 'string' && url.indexOf('/api/v2/') >= 0;
const hasAuthAlready = Object.keys(finalHeaders).some(k => k.toLowerCase() === 'authorization');
if (isApiV2 && !hasAuthAlready) {
  const m = /(?:^|; )access_token=([^;]+)/.exec(document.cookie);
  if (m && m[1]) {
    finalHeaders['Authorization'] = 'User ' + m[1];
  }
}
const init = {
  method: method,
  headers: finalHeaders,
  credentials: 'include',
  redirect: 'follow',
  cache: 'no-store',
};
if (hasBody) { init.body = body; }
try {
  const resp = await fetch(url, init);
  const text = await resp.text();
  const headersOut = {};
  resp.headers.forEach((value, key) => { headersOut[key] = value; });
  return {
    ok: true,
    status: resp.status,
    statusText: resp.statusText,
    url: resp.url,
    headers: headersOut,
    body: text,
  };
} catch (e) {
  return { ok: false, error: String(e) };
}
''';

    final result = await controller
        .callAsyncJavaScript(functionBody: script, arguments: args)
        .timeout(timeout);

    if (result == null) {
      throw StateError('WebViewProxy: callAsyncJavaScript returned null');
    }
    if (result.error != null) {
      throw StateError('WebViewProxy JS error: ${result.error}');
    }

    final value = result.value;
    if (value is! Map) {
      throw StateError(
        'WebViewProxy: unexpected JS result type ${value.runtimeType}',
      );
    }

    final ok = value['ok'] == true;
    if (!ok) {
      throw StateError('WebViewProxy fetch failed: ${value['error']}');
    }

    final headersMap = <String, String>{};
    final headersAny = value['headers'];
    if (headersAny is Map) {
      headersAny.forEach((k, v) {
        headersMap[k.toString()] = v?.toString() ?? '';
      });
    }

    final status = (value['status'] as num).toInt();
    return ProxyHttpResponse(
      status: status,
      statusText: (value['statusText'] as String?) ?? '',
      url: (value['url'] as String?) ?? url,
      headers: headersMap,
      body: (value['body'] as String?) ?? '',
    );
  }

  /// Polling-based alternative to [request] for platforms where
  /// callAsyncJavaScript doesn't return results (e.g. HarmonyOS).
  Future<ProxyHttpResponse> _requestViaPolling({
    required InAppWebViewController controller,
    required String url,
    required String fetchUrl,
    required String method,
    required Map<String, String> headers,
    required String? bodyString,
    required bool hasBody,
    required Duration timeout,
  }) async {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    final headersJson = jsonEncode(headers);
    final bodyJs = bodyString != null ? jsonEncode(bodyString) : 'null';

    final startScript =
        '''
(function() {
  var hdr = $headersJson;
  var isApiV2 = '$fetchUrl'.indexOf('/api/v2/') >= 0;
  var hasAuth = Object.keys(hdr).some(function(k) { return k.toLowerCase() === 'authorization'; });
  if (isApiV2 && !hasAuth) {
    var m = /(?:^|; )access_token=([^;]+)/.exec(document.cookie);
    if (m && m[1]) { hdr['Authorization'] = 'User ' + m[1]; }
  }
  var init = { method: '$method', headers: hdr, credentials: 'include', redirect: 'follow', cache: 'no-store' };
  ${hasBody ? "init.body = $bodyJs;" : ""}
  window['__proxy_$id'] = { done: false };
  fetch('$fetchUrl', init).then(function(resp) {
    return resp.text().then(function(text) {
      var ho = {};
      resp.headers.forEach(function(v, k) { ho[k] = v; });
      window['__proxy_$id'] = { done: true, ok: true, status: resp.status, statusText: resp.statusText, url: resp.url, headers: ho, body: text };
    });
  }).catch(function(e) {
    window['__proxy_$id'] = { done: true, ok: false, error: String(e) };
  });
})();
''';

    await controller.evaluateJavascript(source: startScript);

    final stopwatch = Stopwatch()..start();
    while (stopwatch.elapsed < timeout) {
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final poll = await controller.evaluateJavascript(
        source: "JSON.stringify(window['__proxy_$id'] || {})",
      );

      if (poll == null || poll == '{}' || poll == 'null') {
        continue;
      }

      Map<String, dynamic> result;
      try {
        final decoded = poll is String ? jsonDecode(poll) : poll;
        result = (decoded is Map<String, dynamic>) ? decoded : {};
      } catch (_) {
        continue;
      }

      if (result['done'] != true) {
        continue;
      }

      // Clean up
      await controller.evaluateJavascript(
        source: "delete window['__proxy_$id'];",
      );

      if (result['ok'] != true) {
        throw StateError('WebViewProxy fetch failed: ${result['error']}');
      }

      final headersMap = <String, String>{};
      final headersAny = result['headers'];
      if (headersAny is Map) {
        headersAny.forEach((k, v) {
          headersMap[k.toString()] = v?.toString() ?? '';
        });
      }

      return ProxyHttpResponse(
        status: (result['status'] as num).toInt(),
        statusText: (result['statusText'] as String?) ?? '',
        url: (result['url'] as String?) ?? url,
        headers: headersMap,
        body: (result['body'] as String?) ?? '',
      );
    }

    throw TimeoutException('WebViewProxy polling timed out', timeout);
  }

  /// Download a binary resource through the hidden WebView and return it as
  /// raw bytes. Useful for endpoints that sit behind Cloudflare and stream
  /// non-text payloads (e.g. nhentai's `/g/{id}/download` torrent file).
  ///
  /// The whole body is buffered in memory both inside the WebView (via
  /// `arrayBuffer()`) and on the Dart side, so this is intended for small
  /// files only. nhentai torrents are typically a few KB to tens of KB.
  Future<ProxyBinaryResponse> requestBinary({
    required String url,
    String method = 'GET',
    Map<String, String>? headers,
    Object? body,
    Duration timeout = const Duration(seconds: 60),
  }) async {
    await ready;
    final controller = _controller;
    if (controller == null) {
      throw StateError('HiddenWebViewProxy: controller not attached');
    }

    const forbidden = {
      'host',
      'cookie',
      'content-length',
      'user-agent',
      'accept-encoding',
      'connection',
      'origin',
      'referer',
    };
    final safeHeaders = <String, String>{};
    headers?.forEach((k, v) {
      if (!forbidden.contains(k.toLowerCase())) {
        safeHeaders[k] = v;
      }
    });

    final hasBody = body != null && method.toUpperCase() != 'GET';
    final bodyString = body == null
        ? null
        : (body is String ? body : jsonEncode(body));

    final args = <String, dynamic>{
      'url': url,
      'method': method.toUpperCase(),
      'headers': safeHeaders,
      'body': bodyString,
      'hasBody': hasBody,
    };

    // Encode the response body to base64 chunk-by-chunk so we don't blow the
    // call stack via String.fromCharCode(...veryLongArray).
    const script = r'''
const init = {
  method: method,
  headers: headers,
  credentials: 'include',
  redirect: 'follow',
  mode: 'cors',
  cache: 'no-store',
};
if (hasBody) { init.body = body; }
try {
  const resp = await fetch(url, init);
  const buf = await resp.arrayBuffer();
  const bytes = new Uint8Array(buf);
  let bin = '';
  const chunk = 0x8000;
  for (let i = 0; i < bytes.length; i += chunk) {
    bin += String.fromCharCode.apply(null, bytes.subarray(i, i + chunk));
  }
  const b64 = btoa(bin);
  const headersOut = {};
  resp.headers.forEach((value, key) => { headersOut[key] = value; });
  return {
    ok: true,
    status: resp.status,
    statusText: resp.statusText,
    url: resp.url,
    headers: headersOut,
    bodyB64: b64,
    byteLength: bytes.length,
  };
} catch (e) {
  return { ok: false, error: String(e) };
}
''';

    final result = await controller
        .callAsyncJavaScript(functionBody: script, arguments: args)
        .timeout(timeout);

    if (result == null) {
      throw StateError('WebViewProxy: callAsyncJavaScript returned null');
    }
    if (result.error != null) {
      throw StateError('WebViewProxy JS error: ${result.error}');
    }
    final value = result.value;
    if (value is! Map) {
      throw StateError(
        'WebViewProxy: unexpected JS result type ${value.runtimeType}',
      );
    }
    if (value['ok'] != true) {
      throw StateError('WebViewProxy fetch failed: ${value['error']}');
    }

    final headersMap = <String, String>{};
    final headersAny = value['headers'];
    if (headersAny is Map) {
      headersAny.forEach((k, v) {
        headersMap[k.toString()] = v?.toString() ?? '';
      });
    }
    final b64 = (value['bodyB64'] as String?) ?? '';
    final bytes = b64.isEmpty ? Uint8List(0) : base64Decode(b64);

    return ProxyBinaryResponse(
      status: (value['status'] as num).toInt(),
      statusText: (value['statusText'] as String?) ?? '',
      url: (value['url'] as String?) ?? url,
      headers: headersMap,
      bytes: bytes,
    );
  }

  /// Submit a login to nhentai entirely from inside the WebView. We
  /// navigate the hidden WebView to `/login/`, let SvelteKit hydrate,
  /// fill the form with the supplied credentials and synthesise a real
  /// click on the submit button so the framework's `use:enhance` handler
  /// (or the native form post) fires the correct request. Returns `true`
  /// once the WebView leaves `/login` for a regular page (i.e. the
  /// session cookie has been issued).
  Future<bool> loginNhentai({
    required String username,
    required String password,
    Duration timeout = const Duration(seconds: 60),
  }) async {
    await ready;
    final controller = _controller;
    if (controller == null) {
      throw StateError('HiddenWebViewProxy: controller not attached');
    }

    Future<String> currentPath() async {
      final uri = await controller.getUrl();
      return uri?.path ?? '';
    }

    final originalUri = await controller.getUrl();
    final returnUrl = originalUri?.toString() ?? '${NHConst.baseUrl}/';

    try {
      await controller.loadUrl(
        urlRequest: URLRequest(url: WebUri('${NHConst.baseUrl}/login/')),
      );

      // Wait for the SvelteKit page to *hydrate*, not just render. The
      // SSR HTML already has the inputs but the framework needs an extra
      // beat to attach its `use:enhance` submit handler. We poll for the
      // SvelteKit hydration marker (`__sveltekit_*` global) and require
      // the form inputs to be in place.
      var hydrated = false;
      for (var i = 0; i < 60 && !hydrated; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
        final probe = await controller.evaluateJavascript(
          source: '''
            (function () {
              var hasForm = document.querySelector('input[name="username_or_email"]') != null
                  && document.querySelector('input[name="password"]') != null;
              var hasSk = false;
              for (var k in window) { if (k.indexOf('__sveltekit') === 0) { hasSk = true; break; } }
              // SvelteKit may also expose `window.__sveltekit_invalidated` or
              // similar; if any present plus hydrate finished, we're good.
              return hasForm && hasSk ? 'ready' : (hasForm ? 'form-only' : 'no-form');
            })()
          ''',
        );
        if (probe == 'ready') {
          hydrated = true;
        } else if (probe == 'form-only' && i >= 20) {
          // Give up waiting for SvelteKit globals after 5s; we'll still
          // try the click path even if hydration never reported in.
          hydrated = true;
        }
      }
      if (!hydrated) {
        throw StateError('login form did not appear');
      }
      // Tiny extra delay so any pending mount effects bind their handlers.
      await Future<void>.delayed(const Duration(milliseconds: 300));

      // Trigger the actual submit and let SvelteKit handle it. We track
      // outgoing fetch + XHR + form-submit traffic so debug logs show
      // exactly what endpoint the page contacted (or didn't).
      final result = await controller
          .callAsyncJavaScript(
            functionBody: r'''
              try {
                if (!window.__erosFetchHook) {
                  const orig = window.fetch;
                  window.__erosLoginFetches = [];
                  window.fetch = function(input, init) {
                    try {
                      const u = (typeof input === 'string')
                        ? input
                        : (input && input.url) || String(input);
                      window.__erosLoginFetches.push({
                        kind: 'fetch',
                        url: u,
                        method: (init && init.method) || (input && input.method) || 'GET',
                      });
                    } catch (_) {}
                    return orig.apply(this, arguments);
                  };
                  // Hook XHR too in case the page uses it.
                  const xo = window.XMLHttpRequest.prototype.open;
                  window.XMLHttpRequest.prototype.open = function(m, u) {
                    try {
                      window.__erosLoginFetches.push({
                        kind: 'xhr', url: u, method: m,
                      });
                    } catch (_) {}
                    return xo.apply(this, arguments);
                  };
                  // Hook native form.submit() so we see synchronous POSTs.
                  const fs = window.HTMLFormElement.prototype.submit;
                  window.HTMLFormElement.prototype.submit = function() {
                    try {
                      window.__erosLoginFetches.push({
                        kind: 'form-submit',
                        url: this.action,
                        method: this.method,
                      });
                    } catch (_) {}
                    return fs.apply(this, arguments);
                  };
                  window.__erosFetchHook = true;
                }
                const userInput = document.querySelector('input[name="username_or_email"]');
                const passInput = document.querySelector('input[name="password"]');
                const form = userInput && userInput.closest('form');
                const button = form && form.querySelector('button[type="submit"], input[type="submit"]');
                if (!userInput || !passInput || !form) {
                  return { ok: false, reason: 'form-missing' };
                }
                const setNative = (el, val) => {
                  const desc = Object.getOwnPropertyDescriptor(
                    window.HTMLInputElement.prototype, 'value');
                  desc.set.call(el, val);
                  // Svelte 5 listens for these in different combinations
                  // depending on bind:value vs on:input — fire all of them.
                  el.dispatchEvent(new Event('beforeinput', { bubbles: true }));
                  el.dispatchEvent(new InputEvent('input', { bubbles: true, data: val }));
                  el.dispatchEvent(new Event('change', { bubbles: true }));
                  el.dispatchEvent(new Event('blur', { bubbles: true }));
                };
                userInput.focus();
                setNative(userInput, username);
                passInput.focus();
                setNative(passInput, password);
                // Force-enable the submit button — Svelte's reactive state
                // sometimes needs a tick to pick up the new values, but
                // the form is still valid so this is safe.
                if (button) {
                  try { button.disabled = false; } catch (_) {}
                  try { button.removeAttribute('disabled'); } catch (_) {}
                }
                // Snapshot the form so we can debug from logs.
                const formInfo = {
                  action: form.action,
                  method: form.method,
                  hasButton: !!button,
                  buttonDisabled: button ? button.disabled : null,
                  buttonText: button ? (button.textContent || '').trim().slice(0, 60) : null,
                  inputs: Array.prototype.map.call(form.querySelectorAll('input,textarea,select'),
                    function(el){ return (el.name || el.type || el.tagName) + '=' + (el.value ? '['+el.value.length+']' : ''); }),
                  hasTurnstile: document.querySelector('[name="cf-turnstile-response"], .cf-turnstile, iframe[src*="challenges.cloudflare.com"]') != null,
                  outerStart: form.outerHTML.slice(0, 400),
                };
                // Strategy: now that the button is enabled, click it for
                // real and let SvelteKit's own use:enhance handler issue
                // the proper request. Our fetch/XHR hooks will record
                // exactly which URL it talked to. We DO NOT attempt the
                // native form.submit() since the form posts to /login
                // which is 405 (the route only handles named actions).
                let triggered = 'none';
                if (button) {
                  try { button.click(); triggered = 'click'; } catch (_) {}
                }
                if (triggered === 'none' && typeof form.requestSubmit === 'function') {
                  try { form.requestSubmit(button || undefined); triggered = 'requestSubmit'; }
                  catch (_) {}
                }
                if (triggered === 'none') {
                  try {
                    form.dispatchEvent(new SubmitEvent('submit', { cancelable: true, bubbles: true }));
                    triggered = 'dispatch';
                  } catch (_) {}
                }
                return { ok: true, triggered: triggered, formInfo: formInfo };
              } catch (e) {
                return { ok: false, reason: String(e) };
              }
            ''',
            arguments: <String, dynamic>{
              'username': username,
              'password': password,
            },
          )
          .timeout(timeout);

      final value = result?.value;
      if (value is! Map || value['ok'] != true) {
        throw StateError(
          'login submit prepare failed: ${value is Map ? value['reason'] : value}',
        );
      }
      logger.d(
        '[WebViewProxy] login submit triggered=${value['triggered']} '
        'formInfo=${value['formInfo']}',
      );

      // Wait for the page to leave /login (success redirects to "/" or
      // back to the original referer; failures stay on /login and re-render
      // an error message in the form).
      final stopwatch = Stopwatch()..start();
      while (stopwatch.elapsed < timeout) {
        await Future<void>.delayed(const Duration(milliseconds: 400));
        final path = await currentPath();
        if (!path.contains('/login')) {
          // Snapshot what fetches the page made for diagnostics. The
          // WebView has already navigated to the post-login page (usually
          // "/"), so we DON'T re-navigate — issuing another loadUrl here
          // would abort the in-flight requests that the caller (e.g.
          // `loginGetMore`) is about to make through the proxy.
          final fetches = await controller.evaluateJavascript(
            source:
                'JSON.stringify(window.__erosLoginFetches || []).slice(0, 1500)',
          );
          logger.d('[WebViewProxy] login fetches=$fetches');
          // Give the WebView a tiny grace window to flush any final
          // post-login navigations before the caller starts proxying.
          await Future<void>.delayed(const Duration(milliseconds: 800));
          return true;
        }
      }

      // Stayed on /login → grab as much diagnostic info as possible. The
      // SSR HTML is more reliable than a `document.querySelector` because
      // SvelteKit may have replaced the DOM with a hydrated version and
      // any error message could live in arbitrary class names.
      final diag = await controller.evaluateJavascript(
        source: r'''
          (function () {
            const text = (document.body && document.body.innerText) || '';
            const fetches = window.__erosLoginFetches || [];
            return JSON.stringify({
              title: document.title,
              url: location.href,
              bodyLen: text.length,
              bodyPreview: text.slice(0, 600),
              cookieNames: document.cookie.split(';').map(function(s){return s.split('=')[0].trim();}).filter(Boolean),
              fetches: fetches,
            });
          })()
        ''',
      );
      logger.w('[WebViewProxy] login stayed on /login, diag=$diag');
      await controller.loadUrl(urlRequest: URLRequest(url: WebUri(returnUrl)));
      return false;
    } catch (e, st) {
      logger.e('[WebViewProxy] login error', error: e, stackTrace: st);
      try {
        await controller.loadUrl(
          urlRequest: URLRequest(url: WebUri(returnUrl)),
        );
      } catch (_) {}
      rethrow;
    }
  }

  /// Older fetch-based login attempt kept for reference. Unused but useful
  /// when debugging different SvelteKit form-action endpoints.
  // ignore: unused_element
  Future<bool> _loginNhentaiViaFetch({
    required String username,
    required String password,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    await ready;
    final controller = _controller;
    if (controller == null) {
      throw StateError('HiddenWebViewProxy: controller not attached');
    }

    final args = <String, dynamic>{'username': username, 'password': password};

    const script = r'''
function readCookie(name) {
  const m = new RegExp('(?:^|; )' + name + '=([^;]*)').exec(document.cookie);
  return m ? decodeURIComponent(m[1]) : '';
}
async function attempt(url, body, headers, extraOpts) {
  try {
    const r = await fetch(url, Object.assign({
      method: 'POST',
      credentials: 'include',
      headers: headers,
      body: body,
      redirect: 'follow',
      cache: 'no-store',
    }, extraOpts || {}));
    const text = await r.text();
    return {
      url: url,
      status: r.status,
      finalUrl: r.url,
      redirected: r.redirected,
      bodyLen: text.length,
      bodyPreview: text.length > 1500 ? text.slice(0, 1500) : text,
    };
  } catch (e) {
    return { url: url, error: String(e) };
  }
}
try {
  await fetch('/login/', { credentials: 'include', cache: 'no-store' });
  let token = readCookie('csrftoken');
  if (!token) {
    await new Promise(r => setTimeout(r, 250));
    token = readCookie('csrftoken');
  }

  const fields = new URLSearchParams();
  if (token) fields.append('csrfmiddlewaretoken', token);
  fields.append('username_or_email', username);
  fields.append('password', password);
  const formBody = fields.toString();

  const baseHeaders = { 'Content-Type': 'application/x-www-form-urlencoded' };
  if (token) baseHeaders['X-CSRFToken'] = token;

  // Inspect the rendered login page so we can discover the actual form
  // action endpoint. SvelteKit named actions live under ?/<name>.
  const candidates = [
    '/login/?/default',
    '/login?/default',
    '/login/?/login',
    '/login?/login',
    '/login/',
    '/login',
  ];

  // Probe the SSR HTML so we can surface the real form action used by
  // the SvelteKit page. (Diagnostic, helps us pick the right URL
  // when the static candidate list above doesn't include the right one.)
  try {
    const probe = await fetch('/login/', { credentials: 'include', cache: 'no-store' });
    const html = await probe.text();
    const formMatch = /<form[^>]*method=["']post["'][^>]*>/i.exec(html) || /<form[^>]*>/i.exec(html);
    const actionMatch = formMatch && /action=["']([^"']*)["']/i.exec(formMatch[0]);
    const buttonActionMatch = /<button[^>]*formaction=["']([^"']*)["']/i.exec(html);
    console.log('LOGIN PROBE form=' + (formMatch ? formMatch[0] : 'none'));
    console.log('LOGIN PROBE action=' + (actionMatch ? actionMatch[1] : 'none'));
    console.log('LOGIN PROBE buttonFormaction=' + (buttonActionMatch ? buttonActionMatch[1] : 'none'));
    // Also dump the html length and a tail slice so we know whether
    // the form/button is even present.
    console.log('LOGIN PROBE htmlLen=' + html.length);
  } catch (e) {
    console.log('LOGIN PROBE error=' + e);
  }
  const sveltekitHeaders = Object.assign({}, baseHeaders, {
    'x-sveltekit-action': 'true',
  });

  const attempts = [];
  let success = null;
  for (const url of candidates) {
    const headers = url.includes('?/') ? sveltekitHeaders : baseHeaders;
    const result = await attempt(url, formBody, headers);
    attempts.push(result);
    if (result.error) continue;
    if (result.status === 405 || result.status === 404) continue;
    if (result.status >= 200 && result.status < 400) {
      success = result;
      break;
    }
    // 5xx → keep trying other candidates but remember this one as a
    // last-resort failure to surface.
  }

  return {
    ok: true,
    success: success,
    attempts: attempts,
  };
} catch (e) {
  return { ok: false, error: String(e) };
}
''';

    final result = await controller
        .callAsyncJavaScript(functionBody: script, arguments: args)
        .timeout(timeout);

    if (result == null || result.error != null) {
      throw StateError(
        'WebViewProxy login JS failed: ${result?.error ?? 'null result'}',
      );
    }
    final value = result.value;
    if (value is! Map || value['ok'] != true) {
      throw StateError(
        'WebViewProxy login fetch failed: ${value is Map ? value['error'] : value}',
      );
    }

    final attempts = (value['attempts'] as List?) ?? const [];
    for (final a in attempts) {
      if (a is Map) {
        logger.d(
          '[WebViewProxy] login attempt url=${a['url']} '
          'status=${a['status']} finalUrl=${a['finalUrl']} '
          'redirected=${a['redirected']} bodyLen=${a['bodyLen']} '
          'error=${a['error']}',
        );
      }
    }

    final success = value['success'];
    if (success is! Map) {
      // Inspect the last attempt body to decide whether this looks like
      // an invalid-credential response (the form re-renders) vs an auth
      // success that we just failed to recognise.
      return false;
    }

    final status = (success['status'] as num).toInt();
    final finalUrl = (success['finalUrl'] as String?) ?? '';
    final landedAwayFromLogin =
        finalUrl.isNotEmpty && !Uri.parse(finalUrl).path.contains('/login');
    return status == 302 ||
        (status >= 200 && status < 400 && landedAwayFromLogin);
  }
}

/// Mounts a 1x1 offstage [InAppWebView] used by [HiddenWebViewProxy].
///
/// Place this near the root of the widget tree (alongside or inside the
/// existing `BrokenShield`/`Overlay`) so the webview is created exactly once
/// and survives navigation.
class HiddenWebViewProxyHost extends StatefulWidget {
  const HiddenWebViewProxyHost({super.key, required this.child});

  final Widget child;

  @override
  State<HiddenWebViewProxyHost> createState() => _HiddenWebViewProxyHostState();
}

class _HiddenWebViewProxyHostState extends State<HiddenWebViewProxyHost> {
  static final InAppWebViewSettings _settings = InAppWebViewSettings(
    userAgent: NHConst.userAgent,
    javaScriptEnabled: true,
    javaScriptCanOpenWindowsAutomatically: false,
    thirdPartyCookiesEnabled: true,
    sharedCookiesEnabled: true,
    transparentBackground: true,
    isInspectable: true,
    cacheMode: CacheMode.LOAD_DEFAULT,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        // Keep the webview alive but invisible, tappable area zeroed out.
        Positioned(
          left: 0,
          top: 0,
          width: 1,
          height: 1,
          child: IgnorePointer(
            child: Opacity(
              opacity: 0,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri('${NHConst.baseUrl}/'),
                ),
                initialSettings: _settings,
                onWebViewCreated: (controller) {
                  HiddenWebViewProxy.instance.attachController(controller);
                },
                onLoadStop: (controller, uri) async {
                  logger.d('[WebViewProxy] onLoadStop $uri');
                  // Mark ready once we've made it past the initial Cloudflare
                  // handshake. We assume that if we landed on the origin host
                  // (not on a challenge subdomain) the page is usable.
                  final host = uri?.host;
                  if (host != null && host.endsWith('nhentai.net')) {
                    HiddenWebViewProxy.instance.markReady();
                  }
                },
                onReceivedError: (controller, request, error) {
                  logger.w(
                    '[WebViewProxy] onReceivedError $error url=${request.url}',
                  );
                },
                onConsoleMessage: (controller, msg) {
                  logger.t(
                    '[WebViewProxy console] ${msg.messageLevel}: ${msg.message}',
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
