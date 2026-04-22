import 'dart:async';
import 'dart:convert';

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

    final args = <String, dynamic>{
      'url': url,
      'method': method.toUpperCase(),
      'headers': safeHeaders,
      'body': bodyString,
      'hasBody': hasBody,
    };

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
      throw StateError('WebViewProxy: unexpected JS result type ${value.runtimeType}');
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

    return ProxyHttpResponse(
      status: (value['status'] as num).toInt(),
      statusText: (value['statusText'] as String?) ?? '',
      url: (value['url'] as String?) ?? url,
      headers: headersMap,
      body: (value['body'] as String?) ?? '',
    );
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
                  logger.w('[WebViewProxy] onReceivedError $error url=${request.url}');
                },
                onConsoleMessage: (controller, msg) {
                  logger.t('[WebViewProxy console] ${msg.messageLevel}: ${msg.message}');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
