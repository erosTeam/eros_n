import 'package:eros_n/common/enum.dart';
import 'package:eros_n/network/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    @Default(false) bool isCoverBlur,
    @Default(false) bool isTagTranslate,
    @Default(true) bool dynamicColor,
    @Default(SearchSort.recent) SearchSort searchSort,
    @Default(false) bool showTags,
    @Default(TagLayoutOnCard.wrap) TagLayoutOnCard tagLayoutOnCard,
  }) = _Settings;

  factory Settings.fromJson(Map<String, Object?> json) =>
      _$SettingsFromJson(json);
}
