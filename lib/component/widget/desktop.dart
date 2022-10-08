import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Material(
      child: Stack(
        children: [
          MediaQuery(
              data: mq.copyWith(
                  padding: mq.padding.copyWith(top: appWindow.titleBarHeight)),
              child: Positioned.fill(child: child)),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: appWindow.titleBarHeight,
              child: WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(child: MoveWindow()),
                    const WindowButtons()
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF171717),
    mouseOver: const Color(0x16000000),
    mouseDown: const Color(0x12000000),
    iconMouseOver: const Color(0xFF000000),
    iconMouseDown: const Color(0xFF5F5F5F));

final closeButtonColors = WindowButtonColors(
    iconNormal: const Color(0xFF171717),
    mouseOver: const Color(0xFFC42B1C),
    mouseDown: const Color(0xFFC83C31),
    iconMouseDown: const Color(0xFFEDBEBB),
    iconMouseOver: Colors.white);


final darkButtonColors = WindowButtonColors(
    iconNormal: const Color(0xFFF2F2F2),
    mouseOver: const Color(0x2DFFFFFF),
    mouseDown: const Color(0x29FFFFFF),
    iconMouseOver: const Color(0xFFFFFFFF),
    iconMouseDown: const Color(0xFFA7A7A7));

final darkCloseButtonColors = WindowButtonColors(
    iconNormal: const Color(0xFFF2F2F2),
    mouseOver: const Color(0xFFC42B1C),
    mouseDown: const Color(0xFFC83C31),
    iconMouseDown: const Color(0xFFEDBEBB),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;


    return Row(
      children: [
        WindowButton(
            colors: isDark ? darkButtonColors : buttonColors,
            padding: EdgeInsets.zero,
            iconBuilder: (buttonContext) {
              return Icon(FluentIcons.line_horizontal_1_20_regular, size: 16, color: buttonContext.iconColor);
            },
            onPressed: () => appWindow.minimize()),
        WindowButton(
            colors: isDark ? darkButtonColors : buttonColors,
            padding: EdgeInsets.zero,
            iconBuilder: (buttonContext) {
              final maximizeIcon = appWindow.isMaximized ? FluentIcons
                  .square_multiple_16_regular : FluentIcons.maximize_16_regular;
              return Icon(maximizeIcon, size: 16, color: buttonContext.iconColor);
            },
            onPressed: () => appWindow.maximizeOrRestore()),
        WindowButton(
            colors: isDark ? darkCloseButtonColors : closeButtonColors,
            padding: EdgeInsets.zero,
            iconBuilder: (buttonContext) =>
                Icon(FluentIcons.dismiss_16_regular, size: 16,
                    color: buttonContext.iconColor),
            onPressed: () => appWindow.close()),
      ],
    );
  }
}
