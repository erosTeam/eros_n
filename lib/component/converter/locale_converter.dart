import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

class CustomLocaleConverter implements JsonConverter<Locale, String> {
  const CustomLocaleConverter();

  @override
  Locale fromJson(String json) {
    final parts = json.split('_');
    return Locale(parts[0], parts[1]);
  }

  @override
  String toJson(Locale object) {
    return '${object.languageCode}_${object.countryCode}';
  }
}
