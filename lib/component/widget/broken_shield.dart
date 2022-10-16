import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:webview_windows/webview_windows.dart';
import '../../common/const/const.dart';
import '../../common/global.dart';

import '../../network/app_dio/dio_http_cli.dart';
import '../../pages/webview/webview.dart';
import '../../utils/logger.dart';

class BrokenShield extends StatefulWidget {
  const BrokenShield({super.key, required this.child});

  final Widget? child;

  @override
  State<BrokenShield> createState() => _BrokenShieldState();

  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder == null) {
        return BrokenShield(child: child);
      } else {
        return builder(context, BrokenShield(child: child));
      }
    };
  }
}

class _BrokenShieldState extends State<BrokenShield> {
  OverlayEntry? entry;
  Completer<bool>? completer;

  GlobalKey<OverlayState> overlay = GlobalKey();

  bool get isRunning => !(completer?.isCompleted ?? true);

  Future<bool> throughHandler(DioError error) {
    if (overlay.currentState == null) {
      return Future.value(false);
    }
    print('throughHandler: $error');

    if (completer != null && !completer!.isCompleted) {
      return completer!.future;
    }

    completer = Completer();
    entry = OverlayEntry(builder: (BuildContext context) {
      const showWebview = kDebugMode;
      if (showWebview) {
        return webView();
      } else {
        return Center(
          child: Container(
            // shadow
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Stack(
                  // mainAxisSize: MainAxisSize.min,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: webView(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.surface,
                      child: const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });

    overlay.currentState!.insert(entry!);

    return completer!.future;
  }

  @override
  void initState() {
    DioHttpClient(dioConfig: globalDioConfig)
        .initThroughInterceptor(throughHandler);
    super.initState();
  }

  Future<void> injectionCookieAndUA(
      List<Cookie> cookies, String userAgent) async {
    logger.d('cookies: \n${cookies.join('\n')}\nuserAgent: \n$userAgent');
    await Global.setUserAgent(userAgent);
    await Global.setCookies(NHConst.baseUrl, cookies);
    completer?.complete(true);
    entry?.remove();
  }

  Widget webView() {
    switch (Platform.operatingSystem) {
      case 'ios':
      case 'android':
        return BrokenShieldMobileWebView(callback: injectionCookieAndUA);
      case 'windows':
        return BrokenShieldWindowsWebView(callback: injectionCookieAndUA);
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Overlay(
          key: overlay,
          initialEntries: [
            OverlayEntry(
              builder: (BuildContext context) => widget.child ?? Container(),
            ),
            // OverlayEntry(
            //   opaque: true,
            //   maintainState: true,
            //   builder: (BuildContext context) => isRunning ? webView() : Container(color: Colors.red,),
            // ),
          ],
        ));
  }
}

class BrokenShieldMobileWebView extends StatefulWidget {
  const BrokenShieldMobileWebView({super.key, required this.callback});

  final Function(List<Cookie>, String) callback;

  @override
  State<BrokenShieldMobileWebView> createState() =>
      _BrokenShieldMobileWebViewState();
}

class _BrokenShieldMobileWebViewState extends State<BrokenShieldMobileWebView> {
  late CookieManager cookieManager;
  bool initOk = false;

  @override
  void initState() {
    initWebView();
    super.initState();
  }

  void initWebView() async {
    cookieManager = CookieManager.instance();
    await cookieManager.deleteAllCookies();
    if (!mounted) return;
    setState(() {
      initOk = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (initOk) {
      return InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(NHConst.baseUrl),
        ),
        initialOptions: inAppWebViewOptions,
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          return NavigationActionPolicy.ALLOW;
        },
        onLoadStop: (InAppWebViewController controller, Uri? uri) async {
          if (uri == null) {
            return;
          }
          final cookies = await cookieManager.getCookies(url: uri);
          if (cookies.length >= 2 &&
              cookies.any((element) => element.name == 'csrftoken')) {
            final ioCookies =
                cookies.map((e) => Cookie(e.name, '${e.value}')).toList();
            final ua = await controller.evaluateJavascript(
                source: 'navigator.userAgent');
            widget.callback(ioCookies, ua as String);
          }
        },
      );
    }
    return Container();
  }
}

class BrokenShieldWindowsWebView extends StatefulWidget {
  const BrokenShieldWindowsWebView({super.key, required this.callback});
  final Function(List<Cookie>, String) callback;
  @override
  State<BrokenShieldWindowsWebView> createState() =>
      _BrokenShieldWindowsWebViewState();
}

class _BrokenShieldWindowsWebViewState
    extends State<BrokenShieldWindowsWebView> {
  final _controller = WebviewController();
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    for (final s in _subscriptions) {
      s.cancel();
    }
    _controller.dispose();
    super.dispose();
  }

  String url = '';

  Future<void> initPlatformState() async {
    url = NHConst.baseUrl;
    await _controller.initialize();
    _subscriptions.add(_controller.url.listen((url) {
      this.url = url;
    }));
    _subscriptions.add(_controller.loadingState.listen((state) async {
      if (state == LoadingState.navigationCompleted ||
          state == LoadingState.loading) {
        final cookies = await _controller.getCookies([Uri.parse(url)]);
        if (cookies != null &&
            cookies.length >= 2 &&
            cookies.any((element) => element.name == 'csrftoken')) {
          final ua = await _controller.executeScript('navigator.userAgent');
          widget.callback(cookies, ua as String);
        }
      }
    }));

    await _controller.clearCookies();
    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
    await _controller.loadUrl(url);

    if (!mounted) return;
    setState(() {});
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Webview(
        _controller,
        permissionRequested: _onPermissionRequested,
      );
    }
  }
}
