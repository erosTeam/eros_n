import 'dart:async';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dio/dio.dart';
import 'package:eros_n/component/widget/web_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../common/const/const.dart';
import '../../common/global.dart';

import '../../network/app_dio/dio_http_cli.dart';

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

  List<RequestOptions> pendingConnections = [];

  StreamController<void> pendingConnectionsChangeCtrl =
      StreamController<void>.broadcast();

  StreamController<WebViewCookieInfo> webViewCookieInfoChangeCtrl =
      StreamController<WebViewCookieInfo>.broadcast();

  GlobalKey<OverlayState> overlay = GlobalKey();

  StateSetter? urlListSetState;

  bool get isRunning => !(completer?.isCompleted ?? true);

  Future<bool> throughHandler(DioError error) {
    pendingConnections.add(error.requestOptions);
    pendingConnectionsChangeCtrl.sink.add(null);

    if (overlay.currentState == null) {
      return Future.value(false);
    }

    if (completer != null && !completer!.isCompleted) {
      return completer!.future;
    }

    completer = Completer();
    entry = OverlayEntry(
        maintainState: true,
        builder: (BuildContext context) {
          return StreamBuilder<WebViewCookieInfo>(
              stream: webViewCookieInfoChangeCtrl.stream,
              builder: (context, snapshot) {
                final manualRequired = snapshot.data?.manualRequired ?? false;
                final message = snapshot.data?.message ?? '安全挑战';
                final showWebView = manualRequired;
                double opacity = 0;
                if (kDebugMode) {
                  opacity = 0.5;
                }
                if (showWebView) {
                  opacity = 1;
                }
                return Padding(
                  padding: EdgeInsets.only(top: Platform.isWindows ? appWindow.titleBarHeight : 0),
                  child: Container(
                    color: Colors.black,
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: AnimatedOpacity(
                                duration: Duration(milliseconds: 230),
                                opacity: opacity,
                                child: webView())),
                        if (!showWebView)
                          Center(
                            child: SizedBox(
                              width: 150,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                      Text(message,
                                          style: const TextStyle(
                                            fontSize: 9,
                                          ),
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              });
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

  @override
  void dispose() {
    pendingConnectionsChangeCtrl.close();
    webViewCookieInfoChangeCtrl.close();
    super.dispose();
  }

  Future<void> injectionCookieAndUA(WebViewCookieInfo info) async {
    webViewCookieInfoChangeCtrl.sink.add(info);
    if (info.cookies.any((e) => e.name == 'csrftoken')) {
      await Global.setUserAgent(info.userAgent);
      await Global.setCookies(NHConst.baseUrl, info.cookies);
      pendingConnections.clear();
      pendingConnectionsChangeCtrl.sink.add(null);
      completer?.complete(true);
      entry?.remove();
      entry = null;
    }
  }

  Widget webView() {
    return Scaffold(
      appBar: AppBar(title: Text("安全挑战")),
      body: GetCookieWebView(
        callback: injectionCookieAndUA,
        url: NHConst.baseUrl,
      ),
    );
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
          ],
        ));
  }
}
