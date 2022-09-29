import 'dart:convert';

import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String configBox = 'config_box';

const String userAgentKey = 'user_agent';
const String settingsKey = 'settings';
const String userKey = 'user';
const String tagTranslateInfoKey = 'tag_translate_info';

class HiveHelper {
  HiveHelper();

  static final _configBox = Hive.box<String>(configBox);
  static final _userBox = Hive.box<String>(userKey);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(configBox);
    await Hive.openBox<String>(userKey);
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
    final settings = _configBox.get(settingsKey, defaultValue: '{}') ?? '{}';
    if (settings.isNotEmpty) {
      return Settings.fromJson(jsonDecode(settings) as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> setSettings(Settings settings) async {
    await _configBox.put(settingsKey, jsonEncode(settings.toJson()));
  }

  User getUser() {
    final user = _userBox.get(userKey, defaultValue: '{}') ?? '{}';
    if (user.isNotEmpty) {
      return User.fromJson(jsonDecode(user) as Map<String, dynamic>);
    }
    return const User();
  }

  Future<void> setUser(User user) async {
    logger.d('setUser $user');
    await _userBox.put(userKey, jsonEncode(user.toJson()));
  }

  TagTranslateInfo getTagTranslateInfo() {
    final tagTranslateInfo =
        _configBox.get(tagTranslateInfoKey, defaultValue: '{}') ?? '{}';
    if (tagTranslateInfo.isNotEmpty) {
      return TagTranslateInfo.fromJson(
          jsonDecode(tagTranslateInfo) as Map<String, dynamic>);
    }
    return const TagTranslateInfo();
  }

  Future<void> setTagTranslateInfo(TagTranslateInfo tagTranslateInfo) async {
    await _configBox.put(
        tagTranslateInfoKey, jsonEncode(tagTranslateInfo.toJson()));
  }
}
