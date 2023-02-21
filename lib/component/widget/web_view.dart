import 'dart:async';
import 'dart:io';

import 'package:eros_n/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:webview_windows/webview_windows.dart';
import '../../common/const/const.dart';
import '../../pages/webview/webview.dart';

class WebViewCookieInfo {
  const WebViewCookieInfo(
      {required this.url,
      required this.cookies,
      required this.userAgent,
      this.manualRequired = false,
      this.message});

  @override
  String toString() {
    return 'WebViewCookieInfo<MR:$manualRequired, $message, $userAgent, $cookies>';
  }

  final String url;
  final List<Cookie> cookies;
  final String userAgent;
  final bool manualRequired;
  final String? message;
}

typedef WebViewCallback = Function(WebViewCookieInfo);

class MobileWebView extends StatefulWidget {
  const MobileWebView(
      {super.key,
      required this.url,
      this.callback,
      this.deletedCookie = false});

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
    if(widget.callback != null) {
      anomalyTimer = Timer.periodic(const Duration(seconds: 1), anomalyMonitor);
    }
  }

  Future<void> anomalyMonitor(Timer timer) async {
    if(mounted && initOk && _controller != null) {
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
    if(_controller == null) {
      return;
    }
    final cookies =
    await cookieManager.getCookies(url: Uri.parse(NHConst.baseUrl));
    final ioCookies =
    cookies.map((e) => Cookie(e.name, '${e.value}')).toList();
    final ua = await _controller!.evaluateJavascript(
        source: 'navigator.userAgent');
    final userAgent = ua is String ? ua : '';
    widget.callback?.call(WebViewCookieInfo(
        url: NHConst.baseUrl,
        cookies: ioCookies,
        userAgent: userAgent,
        manualRequired: (anomalyTimer?.tick ?? 0) >= 10 || await getManualRequired(),
        message: await getChallengeMessage()
    ));
  }

  Future<bool> getManualRequired() async {
    if(_controller != null) {
      final manualRequiredText = await _controller!.evaluateJavascript(
          source:'(document.querySelector(".pow-button") != null  || document.querySelector(".captcha-prompt")) ? "true" : null');
      return manualRequiredText == 'true';
    }
    return false;
  }

  Future<String?> getChallengeMessage() async {
    if(_controller != null) {
      final String msg = await _controller!.evaluateJavascript(source: '(document.querySelector("#challenge-body-text") != null) ? document.querySelector("#challenge-body-text").textContent : ""') as String;
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
        initialUrlRequest: URLRequest(
          url: Uri.parse(widget.url),
        ),
        initialOptions: inAppWebViewOptions,
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          return NavigationActionPolicy.ALLOW;
        },
        onTitleChanged: (controller, title) async {
          _controller = controller;
          logger.d('onTitleChanged: $title');
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
    if(widget.callback != null) {
      anomalyTimer = Timer.periodic(const Duration(seconds: 1), anomalyMonitor);
    }
  }

  Future<void> anomalyMonitor(Timer timer) async {

    if ( !mounted || !_controller.value.isInitialized ) {
      return;
    }
    callbackChallengeInfo();
  }

  Future<bool> getManualRequired() async {
    if(_controller.value.isInitialized) {
      final manualRequiredText = await _controller.executeScript(
          '(document.querySelector(".pow-button") != null  || document.querySelector(".captcha-prompt")) ? "true" : null');
      return manualRequiredText == 'true';
    }
    return false;
  }

  Future<String?> getChallengeMessage() async {
    if(_controller.value.isInitialized) {
      final String msg = await _controller.executeScript(
          '(document.querySelector("#challenge-body-text") != null) ? document.querySelector("#challenge-body-text").textContent : ""') as String;;
      return msg.trim();
    }
    return null;
  }

  Future<String> getUserAgent() async {
    if(_controller.value.isInitialized) {
      final value = await _controller.executeScript('navigator.userAgent');
      return value is String ? value : '';
    }
    return '';
  }

  Future<List<Cookie>> getCookies() async {
    if(_controller.value.isInitialized) {
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

    if(_controller.value.isInitialized) {
      widget.callback?.call(WebViewCookieInfo(
          url: NHConst.baseUrl,
          cookies: await getCookies(),
          userAgent: await getUserAgent(),
          manualRequired: (anomalyTimer?.tick ?? 0) >= 10 || await getManualRequired(),
          message: await getChallengeMessage()
      ));
    }
  }

  Future<void> initPlatformState() async {
    url = widget.url;
    await _controller.initialize();
    _subscriptions.add(_controller.url.listen((url) {
      this.url = url;
    }));
    _subscriptions.add(_controller.loadingState.listen((state) async {
      if (state == LoadingState.navigationCompleted ||
          state == LoadingState.loading) {
        if (widget.callback != null) {
          callbackChallengeInfo();
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


  GlobalKey<_MobileWebViewState> mobileState = GlobalKey();
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
        return MobileWebView(
          key: mobileState,
          url: widget.url,
          callback: widget.callback,
          deletedCookie: widget.deletedCookie,
        );
      case 'windows':
        return WindowsWebView(key: windowsState, url: widget.url, callback: widget.callback);
      default:
        throw UnimplementedError();
    }
  }
}
