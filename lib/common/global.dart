import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:eros_n/network/app_dio/app_dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as iaw;
import 'package:webview_flutter/webview_flutter.dart';

import 'const/const.dart';

DioHttpConfig globalDioConfig = nhDioConfig;

final DioHttpConfig nhDioConfig = DioHttpConfig(
  baseUrl: NHConst.baseUrl,
  connectTimeout: 10000,
  sendTimeout: 8000,
  receiveTimeout: 20000,
  maxConnectionsPerHost: null,
);

class Global {
  static String appSupportPath = '';
  static String appDocPath = '';
  static String tempPath = '';
  static late String extStorePath;
  static String dbPath = '';

  static late PersistCookieJar cookieJar;

  static String? userAgent;

  static Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));

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
  }
}
