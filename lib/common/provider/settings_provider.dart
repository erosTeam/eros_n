import 'dart:ui';

import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/enum.dart';
import 'package:flutter/material.dart';
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

  void setTagLayoutOnItem(TagLayoutOnItem value) {
    state = state.copyWith(tagLayoutOnItem: value);
    hiveHelper.setSettings(state);
  }

  void setThemeMode(ThemeMode value) {
    state = state.copyWith(themeMode: value);
    hiveHelper.setSettings(state);
  }

  void setFullScreenReader(bool value) {
    state = state.copyWith(fullScreenReader: value);
    hiveHelper.setSettings(state);
  }

  void setReadModel(ReadModel value) {
    state = state.copyWith(readModel: value);
    hiveHelper.setSettings(state);
  }

  void setListModel(ListModel value) {
    state = state.copyWith(listModel: value);
    hiveHelper.setSettings(state);
  }

  void setLocaleCode(String value) {
    state = state.copyWith(localeCode: value);
    hiveHelper.setSettings(state);
  }

  void setThemeColorLabel(String value) {
    state = state.copyWith(themeColorLabel: value);
    hiveHelper.setSettings(state);
  }

  void setSupportDynamicColors(bool value) {
    state = state.copyWith(supportDynamicColors: value);
    hiveHelper.setSettings(state);
  }

  void setHideBottomNavigationOnScroll(bool value) {
    state = state.copyWith(hideBottomNavigationOnScroll: value);
    hiveHelper.setSettings(state);
  }

  void setUseGalleryTint(bool value) {
    state = state.copyWith(useGalleryTint: value);
    hiveHelper.setSettings(state);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Settings>((ref) {
  return SettingsNotifier(hiveHelper.getSettings() ?? const Settings(), ref);
});
