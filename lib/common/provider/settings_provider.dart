import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier(super.state, this.ref);

  final Ref ref;

  void setCoverBlur(bool value) {
    state = state.copyWith(isCoverBlur: value);
    hiveHelper.setSettings(state);
  }

  void setTagTranslate(bool value) {
    state = state.copyWith(isTagTranslate: value);
    if (value) {
      ref.read(tagTranslateProvider.notifier).updateDb();
    }
    hiveHelper.setSettings(state);
  }

  void setDynamicColor(bool value) {
    state = state.copyWith(dynamicColor: value);
    hiveHelper.setSettings(state);
  }

  void setSearchSort(SearchSort value) {
    state = state.copyWith(searchSort: value);
    hiveHelper.setSettings(state);
  }

  void setShowTags(bool value) {
    state = state.copyWith(showTags: value);
    if (value) {
      ref.read(tagTranslateProvider.notifier).updateNhTags();
    }
    hiveHelper.setSettings(state);
  }

  void setTagLayoutOnCard(TagLayoutOnCard value) {
    state = state.copyWith(tagLayoutOnCard: value);
    hiveHelper.setSettings(state);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  return SettingsNotifier(hiveHelper.getSettings() ?? const Settings(), ref);
});
