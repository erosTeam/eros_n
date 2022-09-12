import 'dart:async';
import 'dart:io' as io;

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

// 使用请求nh主页，获取cookie更新到cookieJar
Future<void> showInAppWebViewDialog({
  int? statusCode,
  FutureOr Function()? onComplete,
}) async {
  final CookieManager cookieManager = CookieManager.instance();
  await cookieManager.deleteAllCookies();
  final cookies = await showDialog<List<io.Cookie>>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) {
        Widget iw() => InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(NHConst.baseUrl),
              ),
              onWebViewCreated: (controller) async {
                final option = await controller.getOptions();
                logger.d(
                    'onWebViewCreated UA = ${option?.crossPlatform.userAgent}');
                Global.userAgent = option?.crossPlatform.userAgent;

                globalDioConfig =
                    globalDioConfig.copyWith(userAgent: Global.userAgent);

                hiveHelper.setUserAgent(Global.userAgent!);
              },
              initialOptions: inAppWebViewOptions,
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final uri = navigationAction.request.url!;

                logger.d('to $uri');

                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (InAppWebViewController controller, Uri? uri) async {
                logger.d('Page Finished loading: $uri');
                if (uri == null) {
                  return;
                }

                final cookies = await cookieManager.getCookies(url: uri);
                logger.d(
                    'cookies:\n${cookies.map((e) => e.toString()).join('\n')}');
                if (cookies.length >= 2 &&
                    cookies.any((element) => element.name == 'csrftoken')) {
                  final ioCookies = cookies
                      .map((e) => io.Cookie(e.name, '${e.value}'))
                      .toList();

                  Get.back<List<io.Cookie>>(result: ioCookies);
                }
              },
            );

        return AlertDialog(
          // title: Text('获取数据中 $statusCode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text('获取数据中'),
              if (kReleaseMode) const CircularProgressIndicator(),
              SizedBox(
                height: kReleaseMode ? 0.1 : 300,
                child: iw(),
              ),
            ],
          ),
        );
      });

  if (cookies != null) {
    await Global.cookieJar
        .saveFromResponse(Uri.parse(NHConst.baseUrl), cookies);
    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    await onComplete?.call();
  }
}

final InAppWebViewGroupOptions inAppWebViewOptions = InAppWebViewGroupOptions(
  crossPlatform: InAppWebViewOptions(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    // userAgent: NHConst.userAgent,
  ),
  android: AndroidInAppWebViewOptions(
    useHybridComposition: true,
  ),
  ios: IOSInAppWebViewOptions(
    allowsInlineMediaPlayback: true,
  ),
);
