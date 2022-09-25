import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier(super.state);

  void setCoverBlur(bool value) {
    state = state.copyWith(coverBlur: value);
    hiveHelper.setSettings(state);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  return SettingsNotifier(hiveHelper.getSettings() ?? const Settings());
});
