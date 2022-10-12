import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:eros_n/network/app_dio/app_dio.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/store/db/isar_helper.dart';
import 'package:eros_n/store/kv/hive.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as iaw;
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'const/const.dart';

DioHttpConfig globalDioConfig = nhDioConfig;

final HiveHelper hiveHelper = HiveHelper();
final IsarHelper isarHelper = IsarHelper();
final erosRouter = AppRouter();

const DioHttpConfig nhDioConfig = DioHttpConfig(
  baseUrl: NHConst.baseUrl,
  connectTimeout: 10000,
  sendTimeout: 8000,
  receiveTimeout: 20000,
  maxConnectionsPerHost: null,
  userAgent: NHConst.userAgent,
);

class Global {
  static String appSupportPath = '';
  static String appDocPath = '';
  static String tempPath = '';
  static late String extStorePath;
  static String dbPath = '';

  static late PersistCookieJar cookieJar;

  static String? userAgent;
  static String? imageCookie;

  static Future<void> setUserAgent(String ua) {
    userAgent = ua;
    hiveHelper.setUserAgent(ua);
    return Future.value();
  }

  static Future<void> setCookies(String url, List<Cookie> cookies) async {
    await Global.cookieJar
        .saveFromResponse(Uri.parse(NHConst.baseUrl), cookies);
    final savedCookies =
        await cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    imageCookie = savedCookies
        .map((cookie) => '${cookie.name}=${cookie.value}')
        .join('; ');
  }

  static late PackageInfo packageInfo;

  static Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));

    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.edgeToEdge,
    // );

    appSupportPath = (await getApplicationSupportDirectory()).path;
    appDocPath = (await getApplicationDocumentsDirectory()).path;
    tempPath = (await getTemporaryDirectory()).path;
    extStorePath = Platform.isAndroid || Platform.isFuchsia
        ? (await getExternalStorageDirectory())?.path ?? ''
        : '';

    cookieJar = PersistCookieJar(storage: FileStorage(Global.appSupportPath));

    if (!kDebugMode) {
      Logger.level = Level.info;
    } else {
      Logger.level = Level.debug;
    }
    initLogger();

    if (Platform.isAndroid) {
      await iaw.AndroidInAppWebViewController.setWebContentsDebuggingEnabled(
          true);
      WebView.platform = AndroidWebView();
    }

    packageInfo = await PackageInfo.fromPlatform();

    await HiveHelper.init();
    await isarHelper.initIsar();

    userAgent = hiveHelper.getUserAgent();
    userAgent ??= NHConst.userAgent;
    globalDioConfig = nhDioConfig.copyWith(userAgent: userAgent);

    final savedCookies =
        await cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    imageCookie = savedCookies
        .map((cookie) => '${cookie.name}=${cookie.value}')
        .join('; ');
  }
}
