import 'dart:io' as io;

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart' as wf;

import 'state.dart';

class FrontLogic extends GetxController {
  final FrontState state = FrontState();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> testWeb() async {
    var headers = {
      'cookie':
          'cf_clearance=6dsrFOlTMeE8iDVcta_FDAUPs466BtRi2VTLoy4Wuz0-1662493545-0-150; csrftoken=tPal8XhvGycU22LwiOhLZ4KRqBndr519zLORNMpOTJpw8pEBbw7TEdkXZipHYDXZ',
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27'
    };
    var request = http.Request('GET', Uri.parse('https://nhentai.net/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      logger.d(await response.stream.bytesToString());
    } else {
      logger.d(response.reasonPhrase);
    }
  }

  Future<void> getGalleryData({bool refresh = false}) async {
    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    try {
      final r = await getGalleryList(refresh: refresh);
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');
        await showInAppWebViewDialog(statusCode: e.code);
      } else {
        rethrow;
      }
    }
  }

  Future<void> reloadData() async {
    await getGalleryData(refresh: true);
  }
}

Future<void> showInAppWebViewDialog({int? statusCode}) async {
  final CookieManager cookieManager = CookieManager.instance();
  await cookieManager.deleteAllCookies();
  final cookies = await showDialog(
      context: Get.context!,
      builder: (_) {
        Widget iw() => InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(NHConst.baseUrl),
              ),
              onWebViewCreated: (controller) async {
                final option = await controller.getOptions();
                logger.d(
                    'onWebViewCreated UA = ${option?.crossPlatform.userAgent}');
                Global.userAgent = option?.crossPlatform.userAgent ?? '';
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

        Widget wvf() => wf.WebView(
              initialUrl: NHConst.baseUrl,
              onPageFinished: (url) async {
                logger.d('onPageFinished $url');
                final cookies =
                    await cookieManager.getCookies(url: Uri.parse(url));
                logger.d(
                    'cookies:\n${cookies.map((e) => e.toString()).join('\n')}');
                if (cookies.any((element) => element.name == 'csrftoken')) {
                  final ioCookies = cookies
                      .map((e) => io.Cookie(e.name, '${e.value}'))
                      .toList();
                  Get.back<List<io.Cookie>>(result: ioCookies);
                }
              },
              javascriptMode: wf.JavascriptMode.unrestricted,
            );

        return AlertDialog(
          title: Text('获取数据中 $statusCode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text('获取数据中'),
              Container(
                height: 0.1,
                child: iw(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Hide'),
            )
          ],
        );
      });

  await Global.cookieJar.saveFromResponse(Uri.parse(NHConst.baseUrl), cookies);
  final rCookies =
      await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
  logger.d('rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');
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
