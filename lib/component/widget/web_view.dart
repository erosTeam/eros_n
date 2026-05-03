import 'dart:async';
import 'dart:io';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/webview/webview.dart' show inAppWebViewSettings;
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:webview_windows/webview_windows.dart';

class WebViewCookieInfo {
  const WebViewCookieInfo({
    required this.url,
    required this.cookies,
    required this.userAgent,
    this.currentUrl,
    this.manualRequired = false,
    this.message,
  });

  @override
  String toString() {
    return 'WebViewCookieInfo<MR:$manualRequired, $message, $userAgent, '
        'currentUrl=$currentUrl, $cookies>';
  }

  /// Origin/base URL the cookies belong to (typically [NHConst.baseUrl]).
  final String url;

  /// The URL the WebView is currently displaying. Useful for callers that
  /// want to detect navigation events such as a successful login redirect.
  final String? currentUrl;

  final List<Cookie> cookies;
  final String userAgent;
  final bool manualRequired;
  final String? message;
}

typedef WebViewCallback = Function(WebViewCookieInfo);

/// Host part of [NHConst.baseUrl] without scheme, used for cookie domain matching.
final String _hostFromBase = WebUri(NHConst.baseUrl).host;

/// Build the URL we should land on first inside the cookie-fetching WebView.
/// Callers may pass either [NHConst.baseUrl] (no path) or [NHConst.loginUrl]
/// (already `/login/`) — both should end up loading the login page exactly
/// once instead of `/login/login/`.
String _resolveLoginEntryUrl(String input) {
  final uri = Uri.parse(input);
  final path = uri.path;
  if (path.contains('/login')) {
    return uri.toString();
  }
  final base = path.endsWith('/')
      ? input.substring(0, input.length - 1)
      : input;
  return '$base/login/';
}

/// Parse browser `document.cookie` string into a list of Cookies.
List<Cookie> _parseDocumentCookie(String raw) {
  final result = <Cookie>[];
  for (final part in raw.split(';')) {
    final eq = part.indexOf('=');
    if (eq <= 0) {
      continue;
    }
    final name = part.substring(0, eq).trim();
    final value = part.substring(eq + 1).trim();
    if (name.isEmpty) {
      continue;
    }
    result.add(Cookie(name, value));
  }
  return result;
}

class MobileWebView extends StatefulWidget {
  const MobileWebView({
    super.key,
    required this.url,
    this.callback,
    this.deletedCookie = false,
  });

  final WebViewCallback? callback;
  final String url;
  final bool deletedCookie;

  @override
  State<MobileWebView> createState() => _MobileWebViewState();
}

class _MobileWebViewState extends State<MobileWebView> {
  late CookieManager cookieManager;
  bool initOk = false;

  Timer? anomalyTimer;

  @override
  void initState() {
    initWebView();
    super.initState();
    if (widget.callback != null) {
      anomalyTimer = Timer.periodic(const Duration(seconds: 1), anomalyMonitor);
    }
  }

  Future<void> anomalyMonitor(Timer timer) async {
    if (mounted && initOk && _controller != null) {
      callbackChallengeInfo();
    }
  }

  Future<void> initWebView() async {
    cookieManager = CookieManager.instance();
    if (widget.deletedCookie) {
      await cookieManager.deleteAllCookies();
    }
    if (!mounted) {
      return;
    }
    setState(() {
      initOk = true;
    });
  }

  Future callbackChallengeInfo() async {
    if (_controller == null) {
      return;
    }
    // First-pass: ask CookieManager for the target host's cookies.
    // The url parameter actually filters by exact host/path match, so
    // pass the trailing slash variant too just in case.
    final List<dynamic> rawCookies = await cookieManager.getCookies(
      url: WebUri('${NHConst.baseUrl}/'),
      webViewController: _controller,
    );

    // Fallback: if zero, also enumerate every cookie the WebView knows
    // and filter by the target host (handles cases where the cookie
    // is stored with a leading-dot domain that the host filter misses).
    List<dynamic> filtered = rawCookies.toList();
    String allCookieDump = '';
    try {
      final allDyn = await (cookieManager as dynamic).getAllCookies();
      if (allDyn is List) {
        allCookieDump = allDyn
            .map((c) {
              try {
                return '${(c as dynamic).domain}|${(c as dynamic).name}';
              } catch (_) {
                return '?';
              }
            })
            .join(',');
        if (filtered.isEmpty) {
          for (final c in allDyn) {
            try {
              final dom = (c as dynamic).domain as String?;
              if (dom != null &&
                  (dom.endsWith(_hostFromBase) ||
                      _hostFromBase.endsWith(
                        dom.startsWith('.') ? dom.substring(1) : dom,
                      ))) {
                filtered.add(c);
              }
            } catch (_) {}
          }
        }
      }
    } catch (_) {}
    logger.d('allCookies=[$allCookieDump]');

    var ioCookies = filtered
        .map((e) => Cookie(e.name as String, '${(e as dynamic).value}'))
        .toList();

    // Always read `document.cookie` so we can merge any non-HttpOnly
    // cookies the WebView received (some servers also set csrftoken via
    // a JS Set-Cookie header that CookieManager fails to enumerate).
    String jsCookie = '';
    final raw = await _controller!.evaluateJavascript(
      source: 'document.cookie',
    );
    if (raw is String) {
      jsCookie = raw;
      if (raw.isNotEmpty) {
        final existing = ioCookies.map((e) => e.name).toSet();
        for (final c in _parseDocumentCookie(raw)) {
          if (!existing.contains(c.name)) {
            ioCookies.add(c);
          }
        }
      }
    }
    final currentUrl = await _controller!.getUrl();
    final pageInfo = await _controller!.evaluateJavascript(
      source:
          '(function(){return JSON.stringify({title:document.title,bodyLen:(document.body&&document.body.innerText||"").length,readyState:document.readyState,hasCookie:document.cookie.length>0,docCookie:document.cookie});})()',
    );
    logger.d(
      'callbackChallengeInfo url=$currentUrl, '
      'nativeCount=${rawCookies.length}, '
      'filteredCount=${filtered.length}, '
      'finalCount=${ioCookies.length}, '
      'jsCookieLen=${jsCookie.length}, '
      'cookieNames=[${ioCookies.map((e) => e.name).join(",")}], '
      'page=$pageInfo',
    );
    final ua = await _controller!.evaluateJavascript(
      source: 'navigator.userAgent',
    );
    final userAgent = ua is String ? ua : '';
    widget.callback?.call(
      WebViewCookieInfo(
        url: NHConst.baseUrl,
        currentUrl: currentUrl?.toString(),
        cookies: ioCookies,
        userAgent: userAgent,
        // Only show the WebView UI when interaction is actually required
        // (DOM has visible challenge widgets), or when JS challenge has been
        // running for too long without resolving.
        manualRequired:
            (anomalyTimer?.tick ?? 0) >= 30 || await getManualRequired(),
        message: await getChallengeMessage(),
      ),
    );
  }

  Future<bool> getManualRequired() async {
    if (_controller != null) {
      // Only return true when we're actually on a Cloudflare challenge page.
      // Detect by document.title ("Just a moment..."), URL path
      // (/cdn-cgi/challenge-platform/), or known challenge containers.
      final manualRequiredText = await _controller!.evaluateJavascript(
        source: '''
          (function() {
            var onChallengePage = document.title.indexOf('Just a moment') !== -1
              || document.title.indexOf('Please Wait') !== -1
              || document.querySelector('#challenge-form') != null
              || document.querySelector('#challenge-stage') != null
              || document.querySelector('#cf-challenge-running') != null;
            if (!onChallengePage) return null;
            // On challenge page, check whether interactive elements are
            // present (managed challenge / Turnstile checkbox / captcha).
            var needsClick = document.querySelector('#challenge-stage input[type=checkbox]') != null
              || document.querySelector('.pow-button') != null
              || document.querySelector('.captcha-prompt') != null
              || document.querySelector('iframe[src*="challenges.cloudflare.com"]') != null;
            return needsClick ? 'true' : null;
          })()
        ''',
      );
      return manualRequiredText == 'true';
    }
    return false;
  }

  Future<String?> getChallengeMessage() async {
    if (_controller != null) {
      final String msg =
          await _controller!.evaluateJavascript(
                source:
                    '(document.querySelector("#challenge-body-text") != null) ? document.querySelector("#challenge-body-text").textContent : ""',
              )
              as String;
      return msg.trim();
    }
    return null;
  }

  InAppWebViewController? _controller;

  Future reload() async {
    await _controller?.reload();
  }

  @override
  Widget build(BuildContext context) {
    if (initOk) {
      return InAppWebView(
        // Use the login path: it's outside the SvelteKit Service-Worker
        // precache, so the request always hits the origin and Cloudflare
        // can issue a fresh cf_clearance cookie.
        initialUrlRequest: URLRequest(
          url: WebUri(_resolveLoginEntryUrl(widget.url)),
        ),
        initialSettings: inAppWebViewSettings,
        onWebViewCreated: (controller) async {
          _controller = controller;
          try {
            await InAppWebViewController.clearAllCache();
          } catch (_) {}
          if (Platform.isAndroid) {
            try {
              await ServiceWorkerController.instance().setServiceWorkerClient(
                null,
              );
            } catch (_) {}
          }
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          return NavigationActionPolicy.ALLOW;
        },
        onTitleChanged: (controller, title) async {
          _controller = controller;
          callbackChallengeInfo();
        },
        onLoadStop: (controller, uri) async {
          _controller = controller;
          // Aggressively kill any Service Worker that may be intercepting
          // requests so subsequent reloads always hit the network.
          try {
            await controller.evaluateJavascript(
              source: '''
                (async function() {
                  try {
                    if (navigator.serviceWorker) {
                      const rs = await navigator.serviceWorker.getRegistrations();
                      for (const r of rs) { await r.unregister(); }
                    }
                    if (window.caches) {
                      const ks = await caches.keys();
                      for (const k of ks) { await caches.delete(k); }
                    }
                  } catch(e) {}
                })();
              ''',
            );
          } catch (_) {}
          // Probe whether the WebView actually has a working cf_clearance
          // by hitting a real API that requires it. If status is non-403/503
          // the cookie is alive even if document.cookie can't see it.
          try {
            final probe = await controller.callAsyncJavaScript(
              functionBody: '''
                try {
                  const r = await fetch('/api/galleries/all?page=1', {credentials:'include'});
                  return JSON.stringify({status:r.status});
                } catch(e) { return 'err:'+e.toString(); }
              ''',
            );
            logger.d('cfProbe=${probe?.value}, err=${probe?.error}');
          } catch (e) {
            logger.e('cfProbe threw: $e');
          }
          // Try to fish out cf_clearance via a few URL/path variants.
          for (final u in [
            'https://nhentai.net/',
            'https://nhentai.net',
            'http://nhentai.net/',
            'https://.nhentai.net/',
            'https://www.nhentai.net/',
          ]) {
            try {
              final c = await CookieManager.instance().getCookie(
                url: WebUri(u),
                name: 'cf_clearance',
                webViewController: controller,
              );
              logger.d(
                'cfClearance@$u => ${c?.value != null ? "FOUND len=${c!.value.toString().length}" : "null"}',
              );
              if (c != null) {
                break;
              }
            } catch (e) {
              logger.d('cfClearance@$u failed: $e');
            }
          }
          // Force a sync from native CookieManager → make sure newly-issued
          // Set-Cookie headers from the page load are visible.
          try {
            await CookieManager.instance().getCookies(
              url: WebUri('${NHConst.baseUrl}/'),
              webViewController: controller,
            );
          } catch (_) {}
          callbackChallengeInfo();
        },
        // onLoadStop: (InAppWebViewController controller, Uri? uri) async {
        //   if (uri == null) {
        //     return;
        //   }
        //   final cookies = await cookieManager.getCookies(url: uri);
        //   final ioCookies =
        //       cookies.map((e) => Cookie(e.name, '${e.value}')).toList();
        //   final ua = await controller.evaluateJavascript(
        //       source: 'navigator.userAgent');
        //   if (widget.callback != null) {
        //     widget.callback!(WebViewCookieInfo(
        //         url: uri.toString(),
        //         cookies: ioCookies,
        //         userAgent: ua as String,
        //         completed: true));
        //   }
        // },
      );
    }
    return Container();
  }
}

class WindowsWebView extends StatefulWidget {
  const WindowsWebView({super.key, required this.url, this.callback});

  final WebViewCallback? callback;
  final String url;

  @override
  State<WindowsWebView> createState() => _WindowsWebViewState();
}

class _WindowsWebViewState extends State<WindowsWebView> {
  final _controller = WebviewController();
  final List<StreamSubscription> _subscriptions = [];

  Timer? anomalyTimer;

  Future reload() {
    return _controller.reload();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    if (widget.callback != null) {
      anomalyTimer = Timer.periodic(const Duration(seconds: 1), anomalyMonitor);
    }
  }

  Future<void> anomalyMonitor(Timer timer) async {
    if (!mounted || !_controller.value.isInitialized) {
      return;
    }
    callbackChallengeInfo();
  }

  Future<bool> getManualRequired() async {
    if (_controller.value.isInitialized) {
      final manualRequiredText = await _controller.executeScript('''
        (function() {
          var onChallengePage = document.title.indexOf('Just a moment') !== -1
            || document.title.indexOf('Please Wait') !== -1
            || document.querySelector('#challenge-form') != null
            || document.querySelector('#challenge-stage') != null
            || document.querySelector('#cf-challenge-running') != null;
          if (!onChallengePage) return null;
          var needsClick = document.querySelector('#challenge-stage input[type=checkbox]') != null
            || document.querySelector('.pow-button') != null
            || document.querySelector('.captcha-prompt') != null
            || document.querySelector('iframe[src*="challenges.cloudflare.com"]') != null;
          return needsClick ? 'true' : null;
        })()
      ''');
      return manualRequiredText == 'true';
    }
    return false;
  }

  Future<String?> getChallengeMessage() async {
    if (_controller.value.isInitialized) {
      final String msg =
          await _controller.executeScript(
                '(document.querySelector("#challenge-body-text") != null) ? document.querySelector("#challenge-body-text").textContent : ""',
              )
              as String;
      return msg.trim();
    }
    return null;
  }

  Future<String> getUserAgent() async {
    if (_controller.value.isInitialized) {
      final value = await _controller.executeScript('navigator.userAgent');
      return value is String ? value : '';
    }
    return '';
  }

  Future<List<Cookie>> getCookies() async {
    if (_controller.value.isInitialized) {
      return await _controller.getCookies([Uri.parse(widget.url)]) ?? [];
    }
    return [];
  }

  @override
  void dispose() {
    for (final s in _subscriptions) {
      s.cancel();
    }
    anomalyTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String url = '';

  Future callbackChallengeInfo() async {
    if (_controller.value.isInitialized) {
      widget.callback?.call(
        WebViewCookieInfo(
          url: NHConst.baseUrl,
          cookies: await getCookies(),
          userAgent: await getUserAgent(),
          manualRequired:
              (anomalyTimer?.tick ?? 0) >= 30 || await getManualRequired(),
          message: await getChallengeMessage(),
        ),
      );
    }
  }

  Future<void> initPlatformState() async {
    url = widget.url;
    await _controller.initialize();
    _subscriptions.add(
      _controller.url.listen((url) {
        this.url = url;
      }),
    );
    _subscriptions.add(
      _controller.loadingState.listen((state) async {
        if (state == LoadingState.navigationCompleted ||
            state == LoadingState.loading) {
          if (widget.callback != null) {
            callbackChallengeInfo();
          }
        }
      }),
    );

    await _controller.clearCookies();
    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
    await _controller.loadUrl(url);

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
    String url,
    WebviewPermissionKind kind,
    bool isUserInitiated,
  ) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(L10n.of(context).webview_permission_title),
        content: Text(L10n.of(context).webview_permission_content(kind.toString())),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: Text(L10n.of(context).deny),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: Text(L10n.of(context).allow),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Text(
        L10n.of(context).not_initialized,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
      );
    } else {
      return Webview(_controller, permissionRequested: _onPermissionRequested);
    }
  }
}

class GetCookieWebView extends StatefulWidget {
  const GetCookieWebView({
    required this.url,
    this.callback,
    this.deletedCookie = true,
    super.key,
  });

  final String url;
  final WebViewCallback? callback;
  final bool deletedCookie;

  @override
  State<GetCookieWebView> createState() => GetCookieWebViewState();
}

class GetCookieWebViewState extends State<GetCookieWebView> {
  // ignore: library_private_types_in_public_api
  GlobalKey<_MobileWebViewState> mobileState = GlobalKey();
  // ignore: library_private_types_in_public_api
  GlobalKey<_WindowsWebViewState> windowsState = GlobalKey();

  Future reload() async {
    await mobileState.currentState?.reload();
    await windowsState.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) {
    switch (Platform.operatingSystem) {
      case 'ios':
      case 'android':
      case 'ohos':
        return MobileWebView(
          key: mobileState,
          url: widget.url,
          callback: widget.callback,
          deletedCookie: widget.deletedCookie,
        );
      case 'windows':
        return WindowsWebView(
          key: windowsState,
          url: widget.url,
          callback: widget.callback,
        );
      default:
        throw UnimplementedError();
    }
  }
}
