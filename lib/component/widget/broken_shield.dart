import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:eros_n/component/widget/web_view.dart';
import 'package:flutter/cupertino.dart';
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
          const showWebview = kDebugMode;
          return Stack(
            children: [
              Positioned.fill(
                  child:
                      Opacity(opacity: showWebview ? 1 : 0, child: webView())),
              Positioned.fill(child: Container(color: Colors.black38)),
              if (!showWebview)
                Center(
                  child: SizedBox(
                    width: 150,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                            Text('Checking connection is secure',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (showWebview)
                Center(
                  child: SizedBox(
                    width: 400,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FutureBuilder<List<Cookie>>(
                                future: Global.cookieJar.loadForRequest(
                                    Uri.parse(NHConst.baseHost)),
                                builder: (context, snapshot) {
                                  final Cookie? csrfTokenCookie = snapshot.data
                                      ?.firstWhereOrNull(
                                          (e) => e.name == 'csrftoken');
                                  return Text(
                                    'csrftoken: ${csrfTokenCookie?.value ?? '-'}',
                                    style: const TextStyle(fontSize: 9),
                                  );
                                }),
                            Text(
                              Global.userAgent ?? NHConst.userAgent,
                              style: const TextStyle(fontSize: 9),
                            ),
                            StreamBuilder<void>(
                                stream: pendingConnectionsChangeCtrl.stream,
                                builder: (context, snapshot) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      for (final request in pendingConnections)
                                        Text(request.uri.toString())
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
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
    super.dispose();
  }

  Future<void> injectionCookieAndUA(WebViewCookieInfo info) async {
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
    return GetCookieWebView(
      callback: injectionCookieAndUA,
      url: NHConst.baseUrl,
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
