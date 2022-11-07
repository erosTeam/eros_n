import 'dart:io' as io;

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/widget/web_view.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/webview/webview.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WebLoginPage extends StatelessWidget {
  const WebLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).login),
      ),
      body: GetCookieWebView(
          url: NHConst.loginUrl,
          deletedCookie: false,
          callback: (info) async {
            final cookies = info.cookies;
            logger.d('cookies: $cookies');
            if (cookies.any((element) => element.name == 'sessionid')) {
              await Global.setUserAgent(info.userAgent);
              await Global.setCookies(NHConst.baseUrl, info.cookies);
              erosRouter.pop<List<io.Cookie>>(cookies);
            }
          }),
    );
  }
}

/*

class WebLoginPage extends HookConsumerWidget {
  const WebLoginPage({
    Key? key,
  }) : super(key: key);

  Future<List<io.Cookie>> getCookie() async {
    return await Global.cookieJar.loadForRequest(Uri.parse(NHConst.loginUrl));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final CookieManager cookieManager;
    late Future<void> Function() setCookies;

    setCookies = useMemoized(() {
      return () async {
        final cookies = await getCookie();
      };
    });

    useEffect(() {
      cookieManager = CookieManager.instance();
      // 不要清除 cookies
      // cookieManager.deleteAllCookies();
      cookieManager.deleteCookie(
          url: Uri.parse(NHConst.loginUrl), name: 'sessionid');
      return;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).login),
      ),
      body: FutureBuilder<void>(
          future: setCookies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(NHConst.loginUrl),
              ),
              initialOptions: inAppWebViewOptions,
              onTitleChanged: (controller, title) async {
                final cookies = await cookieManager.getCookies(
                    url: Uri.parse(NHConst.baseUrl));
                logger.d('onTitleChanged title: $title\ncookies: $cookies');

                if (cookies.length >= 3 &&
                    cookies.any((element) => element.name == 'sessionid') &&
                    cookies.any((element) => element.name == 'cf_clearance')) {
                  final ioCookies = cookies
                      .map((e) => io.Cookie(e.name, '${e.value}'))
                      .toList();

                  logger.d(
                      'cookies:\n${ioCookies.map((e) => e.toString()).join('\n')}');

                  erosRouter.pop<List<io.Cookie>>(ioCookies);
                  // erosRouter.pop();
                }
              },
              // onLoadStop: (InAppWebViewController controller, Uri? uri) async {
              //   logger.d('Page Finished loading: $uri');
              //
              //   if (uri == null) {
              //     return;
              //   }
              //
              //   if (uri.path == '/' && uri.queryParameters.isEmpty) {
              //     final cookies = await cookieManager.getCookies(url: uri);
              //     if (cookies.length >= 3 &&
              //         cookies.any((element) => element.name == 'sessionid') &&
              //         cookies
              //             .any((element) => element.name == 'cf_clearance')) {
              //       final ioCookies = cookies
              //           .map((e) => io.Cookie(e.name, '${e.value}'))
              //           .toList();
              //
              //       logger.d(
              //           'cookies:\n${ioCookies.map((e) => e.toString()).join('\n')}');
              //
              //       erosRouter.pop<List<io.Cookie>>(ioCookies);
              //       // erosRouter.pop();
              //     }
              //   }
              // },
            );
          }),
    );
  }
}*/
