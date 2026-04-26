import 'dart:ui';

import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

// ---------------------------------------------------------------------------
// Glass design tokens
// ---------------------------------------------------------------------------

const double kGlassBlur = 10.0;
const double kGlassLightIntensity = 0.05;
const double kGlassBackdropSigma = 10.0;

const double kGlassAppBarThickness = 30.0;
const double kGlassButtonThickness = 20.0;

const int kGlassAppBarAlpha = 60;
const int kGlassButtonAlpha = 80;

const double kGlassIconButtonSize = 36.0;
const double kGlassFabSize = 56.0;
const double kGlassFabRadius = 28.0;
const double kGlassCapsuleRadius = 999.0;

const double kGlassAppBarHeight = 56.0;
const double kGlassTitleFontSize = 22.0;

Color _glassColorForBrightness(bool isDark, int alpha) => isDark
    ? Color.fromARGB(alpha, 60, 60, 60)
    : Color.fromARGB(alpha, 255, 255, 255);

// ---------------------------------------------------------------------------
// Shared glass helpers
// ---------------------------------------------------------------------------

bool isLiquidGlass(WidgetRef ref) =>
    ref.watch(settingsProvider.select((s) => s.liquidGlass));

Color glassIconColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

LiquidGlassSettings glassAppBarSettings(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return LiquidGlassSettings(
    blur: kGlassBlur,
    thickness: kGlassAppBarThickness,
    lightIntensity: kGlassLightIntensity,
    glassColor: _glassColorForBrightness(isDark, kGlassAppBarAlpha),
  );
}

LiquidGlassSettings glassButtonSettings(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return LiquidGlassSettings(
    blur: kGlassBlur,
    thickness: kGlassButtonThickness,
    lightIntensity: kGlassLightIntensity,
    glassColor: _glassColorForBrightness(isDark, kGlassButtonAlpha),
  );
}

EdgeInsets glassBodyPadding(BuildContext context) => EdgeInsets.only(
  top: MediaQuery.of(context).padding.top + kGlassAppBarHeight,
);

PreferredSizeWidget adaptiveAppBar({
  required BuildContext context,
  required WidgetRef ref,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  bool centerTitle = true,
  double? elevation,
  Color? backgroundColor,
  bool automaticallyImplyLeading = true,
}) {
  final liquidGlass = ref.watch(settingsProvider.select((s) => s.liquidGlass));

  if (liquidGlass) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconClr = glassIconColor(context);
    final route = ModalRoute.of(context);
    final canPop = route?.canPop ?? false;

    Widget? effectiveLeading = leading;
    if (effectiveLeading == null && automaticallyImplyLeading && canPop) {
      effectiveLeading = GlassIconButton(
        icon: Icon(Icons.arrow_back, color: iconClr),
        onPressed: () => Navigator.maybePop(context),
        size: kGlassIconButtonSize,
        settings: LiquidGlassSettings(
          blur: 8,
          thickness: kGlassAppBarThickness,
          lightIntensity: 0.02,
          glassColor: _glassColorForBrightness(isDark, 40),
        ),
      );
    }

    final overlayStyle = isDark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return _AnnotatedGlassAppBar(
      overlayStyle: overlayStyle,
      child: GlassAppBar(
        title: title != null
            ? DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: kGlassTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: iconClr,
                ),
                child: title,
              )
            : null,
        leading: effectiveLeading,
        actions: actions,
        centerTitle: false,
        useOwnLayer: true,
        preferredSize: const Size.fromHeight(kGlassAppBarHeight),
        settings: glassAppBarSettings(context),
      ),
    );
  }

  return AppBar(
    title: title,
    leading: leading,
    actions: actions,
    centerTitle: centerTitle,
    elevation: elevation,
    backgroundColor: backgroundColor,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}

Color glassAppBarColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return _glassColorForBrightness(isDark, kGlassAppBarAlpha);
}

Widget glassFlexibleSpace(BuildContext context) {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: kGlassBackdropSigma, sigmaY: kGlassBackdropSigma),
      child: Container(color: glassAppBarColor(context)),
    ),
  );
}

TextStyle glassAppBarTitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: kGlassTitleFontSize,
    fontWeight: FontWeight.bold,
    color: glassIconColor(context),
  );
}

class _AnnotatedGlassAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AnnotatedGlassAppBar({
    required this.child,
    required this.overlayStyle,
  });

  final GlassAppBar child;
  final SystemUiOverlayStyle overlayStyle;

  @override
  Size get preferredSize => child.preferredSize;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: child,
    );
  }
}
