import 'dart:io' as io;

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/pages/webview/webview.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    useEffect(() {
      setCookies = () async {
        final cookies = await getCookie();
        // for (final cookie in cookies) {
        //   await cookieManager.setCookie(
        //     name: cookie.name,
        //     value: cookie.value,
        //     url: Uri.parse(NHConst.baseUrl),
        //   );
        // }
      };

      cookieManager = CookieManager.instance();
      // cookieManager.deleteAllCookies();
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
              onLoadStop: (InAppWebViewController controller, Uri? uri) async {
                logger.d('Page Finished loading: $uri');

                if (uri == null) {
                  return;
                }

                if (uri.path == '/' && uri.queryParameters.isEmpty) {
                  final cookies = await cookieManager.getCookies(url: uri);
                  if (cookies.length >= 3 &&
                      cookies.any((element) => element.name == 'sessionid') &&
                      cookies
                          .any((element) => element.name == 'cf_clearance')) {
                    final ioCookies = cookies
                        .map((e) => io.Cookie(e.name, '${e.value}'))
                        .toList();

                    logger.d(
                        'cookies:\n${ioCookies.map((e) => e.toString()).join('\n')}');

                    erosRouter.pop<List<io.Cookie>>(ioCookies);
                  }
                }
              },
            );
          }),
    );
  }
}
