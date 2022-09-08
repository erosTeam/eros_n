import 'package:hive_flutter/hive_flutter.dart';

const String configBox = 'config_box';

const String userAgentKey = 'user_agent';

class HiveHelper {
  HiveHelper();
  static final _configBox = Hive.box<String>(configBox);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(configBox);
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
}
