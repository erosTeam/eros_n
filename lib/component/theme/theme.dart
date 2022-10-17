import 'package:flutter/material.dart';

class ThemeConfig {
  static late ColorScheme lightColorScheme;
  static late ColorScheme darkColorScheme;

  static late ThemeData lightTheme;
  static late ThemeData darkTheme;

  static const defaultThemeColorLabel = 'blue';
  static const dynamicThemeColorLabel = 'dynamic';
  static const Map<String, Color?> colorMap = {
    'red': Colors.red,
    'pink': Colors.pink,
    'purple': Colors.purple,
    'deep_purple': Colors.deepPurple,
    'indigo': Colors.indigo,
    'blue': Colors.blue,
    'light_blue': Colors.lightBlue,
    'cyan': Colors.cyan,
    'teal': Colors.teal,
    'green': Colors.green,
    'light_green': Colors.lightGreen,
    'lime': Colors.lime,
    'yellow': Colors.yellow,
    'amber': Colors.amber,
    'orange': Colors.orange,
    'deep_orange': Colors.deepOrange,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'blue_grey': Colors.blueGrey,
  };
}
