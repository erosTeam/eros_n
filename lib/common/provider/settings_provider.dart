import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() => hiveHelper.getSettings() ?? const Settings();

  void _save(Settings next) {
    state = next;
    hiveHelper.setSettings(state);
  }

  void setCoverBlur(bool value) => _save(state.copyWith(isCoverBlur: value));

  void setTagTranslate(bool value) {
    _save(state.copyWith(isTagTranslate: value));
    if (value) {
      ref.read(tagTranslateProvider.notifier).updateDb();
    }
  }

  void setDynamicColor(bool value) =>
      _save(state.copyWith(dynamicColor: value));

  void setSearchSort(SearchSort value) =>
      _save(state.copyWith(searchSort: value));

  void setShowTags(bool value) => _save(state.copyWith(showTags: value));

  void setTagLayoutOnItem(TagLayoutOnItem value) =>
      _save(state.copyWith(tagLayoutOnItem: value));

  void setThemeMode(ThemeMode value) => _save(state.copyWith(themeMode: value));

  void setFullScreenReader(bool value) =>
      _save(state.copyWith(fullScreenReader: value));

  void setReadModel(ReadModel value) => _save(state.copyWith(readModel: value));

  void setListModel(ListModel value) => _save(state.copyWith(listModel: value));

  void setLocaleCode(String value) => _save(state.copyWith(localeCode: value));

  void setThemeColorLabel(String value) =>
      _save(state.copyWith(themeColorLabel: value));

  void setSupportDynamicColors(bool value) =>
      _save(state.copyWith(supportDynamicColors: value));

  void setHideBottomNavigationOnScroll(bool value) =>
      _save(state.copyWith(hideBottomNavigationOnScroll: value));

  void setUseGalleryTint(bool value) =>
      _save(state.copyWith(useGalleryTint: value));

  void setVolumeKeyTurnPage(bool value) =>
      _save(state.copyWith(volumeKeyTurnPage: value));

  void setAutoReadInterval(double value) =>
      _save(state.copyWith(autoReadInterval: value));

  void setPreloadPagesCount(int value) =>
      _save(state.copyWith(preloadPagesCount: value));

  void setSearchSortOnFrontPage(SearchSort value) =>
      _save(state.copyWith(searchSortOnFrontPage: value));

  void setFrontLanguagesFilter(LanguagesFilter value) =>
      _save(state.copyWith(frontLanguagesFilter: value));

  void setSearchLanguagesFilter(LanguagesFilter value) =>
      _save(state.copyWith(searchLanguagesFilter: value));

  void setClipboardDetection(bool value) =>
      _save(state.copyWith(clipboardDetection: value));

  void setGridMaxCrossAxisExtent(double value) =>
      _save(state.copyWith(gridMaxCrossAxisExtent: value.clamp(80.0, 300.0)));

  void setWaterfallMaxCrossAxisExtent(double value) => _save(
    state.copyWith(waterfallMaxCrossAxisExtent: value.clamp(80.0, 300.0)),
  );

  void setLiquidGlass(bool value) => _save(state.copyWith(liquidGlass: value));

  void setMaxConcurrentGalleries(int v) =>
      _save(state.copyWith(maxConcurrentGalleries: v));

  void setMaxConcurrentPages(int v) =>
      _save(state.copyWith(maxConcurrentPages: v));

  void setCustomDownloadPath(String v) =>
      _save(state.copyWith(customDownloadPath: v));

  void setDoubleBackToExit(bool value) =>
      _save(state.copyWith(doubleBackToExit: value));

  void setCommentTranslation(bool value) =>
      _save(state.copyWith(commentTranslation: value));

  void setTranslationProvider(TranslationProvider value) =>
      _save(state.copyWith(translationProvider: value));

  void setTranslationApiUrl(String value) =>
      _save(state.copyWith(translationApiUrl: value));

  void setTranslationApiKey(String value) =>
      _save(state.copyWith(translationApiKey: value));

  void setTranslationModel(String value) =>
      _save(state.copyWith(translationModel: value));

  void setAutoTranslateComments(bool value) =>
      _save(state.copyWith(autoTranslateComments: value));

  void setTranslationDisplayMode(TranslationDisplayMode value) =>
      _save(state.copyWith(translationDisplayMode: value));

  void setBilingualStyle(BilingualStyle value) =>
      _save(state.copyWith(bilingualStyle: value));

  void setUseGoogleTranslate(bool value) =>
      _save(state.copyWith(useGoogleTranslate: value));
}
