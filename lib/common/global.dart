import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class Global {
  static String appSupportPath = '';
  static String appDocPath = '';
  static String tempPath = '';
  static late String extStorePath;
  static String dbPath = '';

  static Future<void> init() async {
    //statusBar设置为透明，去除半透明遮罩
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

    initLogger();
    if (!kDebugMode) {
      Logger.level = Level.info;
      initLogger();
    }
  }
}
