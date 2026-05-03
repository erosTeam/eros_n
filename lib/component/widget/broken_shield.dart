import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/widget/desktop.dart';
import 'package:eros_n/component/widget/web_view.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/app_dio/dio_http_cli.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';

class BrokenShield extends StatefulWidget {
  const BrokenShield({super.key, required this.child});

  final Widget? child;

  @override
  State<BrokenShield> createState() => _BrokenShieldState();

  static TransitionBuilder init({TransitionBuilder? builder}) {
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

  Future<bool> throughHandler(DioException error) {
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
            final message =
                snapshot.data?.message ?? L10n.of(context).security_challenge;
            final showWebView = manualRequired;
            double opacity = 0;
            if (showWebView) {
              opacity = 1;
            }
            return Padding(
              padding: EdgeInsets.only(
                top: (Platform.isWindows && showWebView)
                    ? kDesktopTitleBarHeight
                    : 0,
              ),
              child: Container(
                color: Colors.black54,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 230),
                        opacity: opacity,
                        child: webView(),
                      ),
                    ),
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
                                  Text(
                                    message,
                                    style: const TextStyle(fontSize: 9),
                                    textAlign: TextAlign.center,
                                  ),
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
          },
        );
      },
    );

    overlay.currentState!.insert(entry!);

    return completer!.future;
  }

  @override
  void initState() {
    DioHttpClient(
      dioConfig: globalDioConfig,
    ).initThroughInterceptor(throughHandler);
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
    // Cloudflare challenge is considered passed when `cf_clearance` cookie
    // is issued. `csrftoken` alone is not enough — that one exists even
    // before passing the challenge.
    final hasClearance = info.cookies.any((e) => e.name == 'cf_clearance');
    final hasCsrf = info.cookies.any((e) => e.name == 'csrftoken');
    logger.d(
      'injectionCookieAndUA cookies=[${info.cookies.map((e) => e.name).join(",")}], '
      'hasClearance=$hasClearance, hasCsrf=$hasCsrf',
    );
    if (hasClearance && hasCsrf) {
      await Global.setUserAgent(info.userAgent);
      await Global.setCookies(NHConst.baseUrl, info.cookies);
      pendingConnections.clear();
      pendingConnectionsChangeCtrl.sink.add(null);
      entry?.remove();
      entry = null;
      if (completer != null && completer!.isCompleted == false) {
        completer?.complete(true);
      }
    }
  }

  GlobalKey<GetCookieWebViewState> webViewState = GlobalKey();

  Widget webView() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            pendingConnections.clear();
            pendingConnectionsChangeCtrl.sink.add(null);
            entry?.remove();
            entry = null;
            if (completer != null && completer!.isCompleted == false) {
              completer?.completeError(Exception('用户终止了挑战'));
            }
          },
        ),
        title: Text(L10n.of(context).security_challenge),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              webViewState.currentState?.reload();
            },
          ),
        ],
      ),
      body: GetCookieWebView(
        key: webViewState,
        callback: injectionCookieAndUA,
        url: NHConst.baseUrl,
        // Don't wipe existing cookies — they may already contain a valid
        // cf_clearance from a previous session, and wiping makes Cloudflare
        // re-issue a challenge unnecessarily.
        deletedCookie: false,
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
      ),
    );
  }
}
