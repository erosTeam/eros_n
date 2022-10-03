import 'dart:async';
import 'dart:io' as io;

import 'package:desktop_webview_window/desktop_webview_window.dart' as dww;
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/webview/webview.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:webview_cef/webview_cef.dart' as cef;

const kDialogTag = 'InAppWebViewDialog';
bool _canShowDialog = true;

// 使用请求nh主页，获取cookie更新到cookieJar
Future<void> showInAppWebViewDialog({
  int? statusCode,
  FutureOr Function()? onComplete,
}) async {
  // if (!_canShowDialog) {
  //   return;
  // }
  final isPlatformPhone =
      io.Platform.isAndroid || io.Platform.isIOS || io.Platform.isFuchsia;

  final CookieManager cookieManager = CookieManager.instance();
  if (isPlatformPhone) {
    await cookieManager.deleteAllCookies();
  }
  final showWebview = !kReleaseMode;
  // final showWebview = !kReleaseMode && io.Platform.isIOS;

  final cefController = cef.WebviewController();

  Widget dialogBuilder(BuildContext context) {
    Widget iw() {
      return InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(NHConst.baseUrl),
        ),
        initialOptions: inAppWebViewOptions,
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final uri = navigationAction.request.url!;

          logger.d('to $uri');

          return NavigationActionPolicy.ALLOW;
        },
        onLoadStop: (InAppWebViewController controller, Uri? uri) async {
          logger.d('Page onLoadStop: $uri');
          if (uri == null) {
            return;
          }

          // 使用javascript获取Webview的userAgent
          final resultJS = await controller.evaluateJavascript(
              source: 'navigator.userAgent;');
          logger.d('resultJS $resultJS');
          final userAgent = resultJS.toString();
          Global.userAgent = userAgent;
          globalDioConfig =
              globalDioConfig.copyWith(userAgent: Global.userAgent);
          hiveHelper.setUserAgent(Global.userAgent!);

          final cookies = await cookieManager.getCookies(url: uri);
          logger.d('cookies:\n${cookies.map((e) => e.toString()).join('\n')}');
          if (cookies.length >= 2 &&
              cookies.any((element) => element.name == 'csrftoken')) {
            final ioCookies =
                cookies.map((e) => io.Cookie(e.name, '${e.value}')).toList();

            SmartDialog.dismiss(
              result: ioCookies,
              // tag: kDialogTag,
            );
          }
        },
      );
    }

    Future<void> initCef() async {
      await cefController.initialize();
      await cefController.loadUrl(NHConst.baseUrl);
    }

    Widget cefWebView() {
      return FutureBuilder<void>(
          future: initCef(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return cef.Webview(cefController);
            } else {
              return const Center(child: Text('W'));
            }
          });
    }

    Future<void> initDw() async {
      final webview = await dww.WebviewWindow.create(
        configuration: dww.CreateConfiguration(
          windowHeight: 600,
          windowWidth: 800,
          title: L10n.of(context).app_title,
          titleBarTopPadding: io.Platform.isMacOS ? 20 : 0,
        ),
      );
      webview.launch(NHConst.baseUrl);
    }

    Widget dw() {
      return FutureBuilder<void>(
          future: initDw(),
          builder: (context, snapshot) {
            return SizedBox();
          });
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 100,
              child: isPlatformPhone
                  ? iw()
                  : io.Platform.isWindows
                      ? dw()
                      : cefWebView(),
            ),
            Container(
              alignment: Alignment.center,
              color: showWebview
                  ? Theme.of(context).colorScheme.surface.withOpacity(0.5)
                  : Theme.of(context).colorScheme.surface,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );

    // return AlertDialog(
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       if (!showWebview) const CircularProgressIndicator(),
    //       SizedBox(
    //         height: showWebview ? 200 : 0.1,
    //         child: iw(),
    //       ),
    //     ],
    //   ),
    // );
  }

  _canShowDialog = false;
  final cookies = await SmartDialog.show<List<io.Cookie>>(
    // tag: kDialogTag,
    builder: dialogBuilder,
    clickMaskDismiss: false,
    keepSingle: true,
  );

  // log cookies
  logger.d('****** cookies:\n${cookies?.map((e) => e.toString()).join('\n')}');

  if (cookies != null) {
    await Global.cookieJar
        .saveFromResponse(Uri.parse(NHConst.baseUrl), cookies);
    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    await onComplete?.call();
  }

  _canShowDialog = true;
}
