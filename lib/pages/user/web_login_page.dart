import 'dart:io' as io;

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/component/widget/web_view.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class WebLoginPage extends ConsumerStatefulWidget {
  const WebLoginPage({super.key});

  @override
  ConsumerState<WebLoginPage> createState() => _WebLoginPageState();
}

class _WebLoginPageState extends ConsumerState<WebLoginPage> {
  // Latch so we only pop once even though the callback fires repeatedly.
  bool _popped = false;

  bool _looksLikeLoginPage(String? url) {
    if (url == null || url.isEmpty) {
      return true;
    }
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return true;
    }
    // Anything still on /login (form, error message) or on Cloudflare
    // challenge subdomains counts as "not logged in yet".
    if (uri.path.contains('/login')) {
      return true;
    }
    if (uri.host.contains('challenges.cloudflare.com')) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(L10n.of(context).login),
      ),
      body: GetCookieWebView(
        url: NHConst.loginUrl,
        deletedCookie: false,
        callback: (info) async {
          if (_popped) {
            return;
          }
          final cookies = info.cookies;
          logger.d(
            'web-login callback: currentUrl=${info.currentUrl}, '
            'cookies=${cookies.map((e) => e.name).toList()}',
          );

          // Primary signal: WebView has navigated away from the login page,
          // which only happens after a successful credential submit (or a
          // pre-existing logged-in session). Some auth cookies (legacy
          // sessionid) are HttpOnly and invisible to CookieManager on some
          // Android stacks, so we don't require any specific cookie name.
          final navigatedAway = !_looksLikeLoginPage(info.currentUrl);

          // Fallback: if a known auth cookie (access_token / refresh_token
          // / sessionid) is already visible we're logged in regardless of URL.
          const authNames = {'access_token', 'refresh_token', 'sessionid'};
          final hasAuthCookie = cookies.any((c) => authNames.contains(c.name));

          if (!navigatedAway && !hasAuthCookie) {
            return;
          }

          _popped = true;
          await Global.setUserAgent(info.userAgent);
          // Mirror any visible cookies into the dart-side jar; HttpOnly ones
          // stay in the WebView's cookie store and are reused via the proxy.
          if (cookies.isNotEmpty) {
            await Global.setCookies(NHConst.baseUrl, info.cookies);
          }
          erosRouter.pop<List<io.Cookie>>(cookies);
        },
      ),
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

    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
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
