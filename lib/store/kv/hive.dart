import 'dart:convert';

import 'package:eros_n/component/models/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String configBox = 'config_box';

const String userAgentKey = 'user_agent';
const String settingsKey = 'settings';

class HiveHelper {
  HiveHelper();

  static final _configBox = Hive.box<String>(configBox);
  static final _settingsBox = Hive.box<String>(settingsKey);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(configBox);
    await Hive.openBox<String>(settingsKey);
  }

  String? getString(String key) {
    return _configBox.get(key, defaultValue: '');
  }

  Future<void> setString(String key, String value) async {
    await _configBox.put(key, value);
  }

  String? getUserAgent() {
    return _configBox.get(userAgentKey, defaultValue: '');
  }

  Future<void> setUserAgent(String? value) async {
    if (value != null) {
      await _configBox.put(userAgentKey, value);
    }
  }

  Settings? getSettings() {
    final settings = _settingsBox.get(settingsKey, defaultValue: '{}') ?? '{}';
    if (settings.isNotEmpty) {
      return Settings.fromJson(jsonDecode(settings) as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> setSettings(Settings settings) async {
    await _settingsBox.put(settingsKey, jsonEncode(settings.toJson()));
  }
}
