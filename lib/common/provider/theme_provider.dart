import 'package:eros_n/component/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/legacy.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(ThemeConfig.lightTheme);
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});
