import 'package:eros_n/common/enum.dart';
import 'package:flutter/material.dart';

const double bilingualTextScaleFactor = 0.94;
const double bilingualTranslatedFontSizeRatio = 0.95;

const double bilingualDividerHeight = 10;
const double bilingualDividerThickness = 0.5;
const double bilingualCompactSpacing = 4;

TextStyle bilingualOriginalStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!;
}

TextStyle bilingualTranslatedStyle(BuildContext context, BilingualStyle style) {
  final baseSize = Theme.of(context).textTheme.bodyMedium!.fontSize ?? 14;
  final base = Theme.of(context).textTheme.bodyMedium!.copyWith(
    fontSize: baseSize * bilingualTranslatedFontSizeRatio,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );
  if (style == BilingualStyle.subtle) {
    return base.copyWith(fontStyle: FontStyle.italic);
  }
  return base;
}

Widget bilingualSeparator(BuildContext context, BilingualStyle style) {
  if (style == BilingualStyle.divider) {
    return Divider(
      height: bilingualDividerHeight,
      thickness: bilingualDividerThickness,
      color: Theme.of(context).colorScheme.outlineVariant,
    );
  }
  return const SizedBox(height: bilingualCompactSpacing);
}
