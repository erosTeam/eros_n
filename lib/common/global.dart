import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/network/api.dart';
import 'package:eros_n/network/app_dio/app_dio.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/store/db/db_store.dart';
import 'package:eros_n/store/db/objectbox_helper.dart';
import 'package:eros_n/store/kv/hive.dart';
import 'package:eros_n/utils/clipboard_helper.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/translation_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as iaw;
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

DioHttpConfig globalDioConfig = nhDioConfig;

final HiveHelper hiveHelper = HiveHelper();
final DbStore objectBoxHelper = ObjectBoxHelper();
final ClipboardHelper clipboardHelper = ClipboardHelper();
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
  static String downloadsPath = '';

  static late PersistCookieJar cookieJar;

  static String? userAgent;

  static Future<void> setUserAgent(String ua) {
    userAgent = ua;
    hiveHelper.setUserAgent(ua);
    return Future.value();
  }

  static Future<void> setCookies(String url, List<Cookie> cookies) async {
    await Global.cookieJar.saveFromResponse(
      Uri.parse(NHConst.baseUrl),
      cookies,
    );
  }

  static late PackageInfo packageInfo;

  static Future<String> resolveDownloadsPath(String customPath) async {
    if (customPath.isNotEmpty) {
      return customPath;
    }
    if (Platform.isIOS) {
      return '$appDocPath/downloads';
    }
    if (Platform.isAndroid) {
      try {
        final ext = await getExternalStorageDirectory();
        if (ext != null) {
          return '${ext.path}/Eros-N';
        }
      } catch (_) {}
    }
    return '$appDocPath/downloads';
  }

  static Future<void> init() async {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.transparent,
    //   systemNavigationBarDividerColor: Colors.transparent,
    //   statusBarColor: Colors.transparent,
    //   systemNavigationBarContrastEnforced: false,
    // ));

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
    downloadsPath = await resolveDownloadsPath('');

    if (!kDebugMode) {
      Logger.level = Level.info;
    } else {
      Logger.level = Level.debug;
    }
    initLogger();

    if (Platform.isAndroid) {
      await iaw.InAppWebViewController.setWebContentsDebuggingEnabled(true);

      final swAvailable = await iaw.WebViewFeature.isFeatureSupported(
        iaw.WebViewFeature.SERVICE_WORKER_BASIC_USAGE,
      );
      final swInterceptAvailable = await iaw.WebViewFeature.isFeatureSupported(
        iaw.WebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST,
      );

      if (swAvailable && swInterceptAvailable) {
        iaw.ServiceWorkerController.instance();

        // await serviceWorkerController
        //     .setServiceWorkerClient(iaw.AndroidServiceWorkerClient(
        //   shouldInterceptRequest: (request) async {
        //     print(request);
        //     return null;
        //   },
        // ));
      }
    }

    packageInfo = await PackageInfo.fromPlatform();

    await HiveHelper.init();
    await TranslationCacheService.instance.init();
    await objectBoxHelper.init();
    await Api.initCacheStore(appSupportPath);

    userAgent = hiveHelper.getUserAgent();
    userAgent ??= NHConst.userAgent;
    globalDioConfig = nhDioConfig.copyWith(userAgent: userAgent);
  }
}
