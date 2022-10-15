import 'package:flutter/material.dart';

class ThemeConfig {
  static late ColorScheme lightColorScheme;
  static late ColorScheme darkColorScheme;

  static late ThemeData lightTheme;
  static late ThemeData darkTheme;

  static const Map<String, Color?> colorMap = {
    'dynamic': null,
    'red': Color(0xFFE53935),
    'pink': Color(0xFFD81B60),
    'purple': Color(0xFF8E24AA),
    'deep_purple': Color(0xFF5E35B1),
    'indigo': Color(0xFF3949AB),
    'blue': Color(0xFF1E88E5),
    'light_blue': Color(0xFF039BE5),
    'cyan': Color(0xFF00ACC1),
    'teal': Color(0xFF00897B),
    'green': Color(0xFF43A047),
    'light_green': Color(0xFF7CB342),
    'lime': Color(0xFFC0CA33),
    'yellow': Color(0xFFFDD835),
    'amber': Color(0xFFFFB300),
    'orange': Color(0xFFF4511E),
    'deep_orange': Color(0xFFE64A19),
    'brown': Color(0xFF6D4C41),
    'grey': Color(0xFF757575),
    'blue_grey': Color(0xFF546E7A),
  };
}
