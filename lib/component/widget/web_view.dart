import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Cookie;
import 'package:webview_windows/webview_windows.dart';
import '../../common/const/const.dart';
import '../../pages/webview/webview.dart';

class WebViewCookieInfo {
  WebViewCookieInfo({
    required this.url,
    required this.cookies,
    required this.userAgent,
    this.completed = false,
  });

  final String url;
  final List<Cookie> cookies;
  final String userAgent;
  final bool completed;
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

  @override
  void initState() {
    initWebView();
    super.initState();
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
          final cookies =
              await cookieManager.getCookies(url: Uri.parse(NHConst.baseUrl));

          final ioCookies =
              cookies.map((e) => Cookie(e.name, '${e.value}')).toList();
          final ua = await controller.evaluateJavascript(
              source: 'navigator.userAgent');

          widget.callback?.call(WebViewCookieInfo(
              // url: uri.toString(),
              url: NHConst.baseUrl,
              cookies: ioCookies,
              userAgent: ua as String,
              completed: true));
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
    url = widget.url;
    await _controller.initialize();
    _subscriptions.add(_controller.url.listen((url) {
      this.url = url;
    }));
    _subscriptions.add(_controller.loadingState.listen((state) async {
      if (state == LoadingState.navigationCompleted ||
          state == LoadingState.loading) {
        final cookies = await _controller.getCookies([Uri.parse(url)]);
        final ua = await _controller.executeScript('navigator.userAgent');
        if (widget.callback != null) {
          widget.callback!(WebViewCookieInfo(
              url: url,
              cookies: cookies ?? [],
              userAgent: ua as String,
              completed: state == LoadingState.navigationCompleted));
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

class GetCookieWebView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    switch (Platform.operatingSystem) {
      case 'ios':
      case 'android':
        return MobileWebView(
          url: url,
          callback: callback,
          deletedCookie: deletedCookie,
        );
      case 'windows':
        return WindowsWebView(url: url, callback: callback);
      default:
        throw UnimplementedError();
    }
  }
}
