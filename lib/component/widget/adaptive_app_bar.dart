import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

LiquidGlassSettings _defaultGlassSettings(bool isDark) => LiquidGlassSettings(
  blur: 10,
  thickness: 30,
  lightIntensity: 0.05,
  glassColor: isDark
      ? const Color.fromARGB(60, 60, 60, 60)
      : const Color.fromARGB(60, 255, 255, 255),
);

bool isLiquidGlass(WidgetRef ref) =>
    ref.watch(settingsProvider.select((s) => s.liquidGlass));

const double _kGlassAppBarHeight = 56.0;

EdgeInsets glassBodyPadding(BuildContext context) => EdgeInsets.only(
  top: MediaQuery.of(context).padding.top + _kGlassAppBarHeight,
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
    final iconColor = isDark ? Colors.white : Colors.black;
    final route = ModalRoute.of(context);
    final canPop = route?.canPop ?? false;

    Widget? effectiveLeading = leading;
    if (effectiveLeading == null && automaticallyImplyLeading && canPop) {
      effectiveLeading = GlassIconButton(
        icon: Icon(Icons.arrow_back, color: iconColor),
        onPressed: () => Navigator.maybePop(context),
        size: 36,
        settings: LiquidGlassSettings(
          blur: 8,
          thickness: 30,
          lightIntensity: 0.02,
          glassColor: isDark
              ? const Color.fromARGB(40, 60, 60, 60)
              : const Color.fromARGB(40, 255, 255, 255),
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
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
                child: title,
              )
            : null,
        leading: effectiveLeading,
        actions: actions,
        centerTitle: false,
        useOwnLayer: true,
        preferredSize: const Size.fromHeight(56),
        settings: _defaultGlassSettings(isDark),
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
