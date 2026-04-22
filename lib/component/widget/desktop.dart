import 'package:eros_n/component/widget/sys_title.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const double kDesktopTitleBarHeight = 32.0;

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
              padding: mq.padding.copyWith(top: kDesktopTitleBarHeight),
            ),
            child: Positioned.fill(child: child),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: kDesktopTitleBarHeight,
            child: StreamBuilder<DesktopTitle>(
              stream: SysTitle.currentStream,
              builder: (context, snapshot) {
                final data = snapshot.data ?? SysTitle.current;
                final titleVisible = data?.titleVisible ?? true;
                final buttonVisible = data?.buttonVisible ?? true;
                final title = data?.title ?? '';

                if (title != '') {
                  windowManager.setTitle('$title · Eros-N');
                }

                final titleWidget = titleVisible
                    ? Text(title, style: const TextStyle(fontSize: 12))
                    : null;

                return Row(
                  children: [
                    Expanded(
                      child: DragToMoveArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: titleWidget,
                          ),
                        ),
                      ),
                    ),
                    if (buttonVisible) const WindowButtons(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> with WindowListener {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _updateMaximized();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Future<void> _updateMaximized() async {
    final isMaximized = await windowManager.isMaximized();
    if (mounted) {
      setState(() => _isMaximized = isMaximized);
    }
  }

  @override
  void onWindowMaximize() => setState(() => _isMaximized = true);

  @override
  void onWindowUnmaximize() => setState(() => _isMaximized = false);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark
        ? const Color(0xFFF2F2F2)
        : const Color(0xFF171717);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TitleBarButton(
          icon: FluentIcons.line_horizontal_1_20_regular,
          iconColor: iconColor,
          hoverColor: isDark
              ? const Color(0x2DFFFFFF)
              : const Color(0x16000000),
          onPressed: () => windowManager.minimize(),
        ),
        _TitleBarButton(
          icon: _isMaximized
              ? FluentIcons.square_multiple_16_regular
              : FluentIcons.maximize_16_regular,
          iconColor: iconColor,
          hoverColor: isDark
              ? const Color(0x2DFFFFFF)
              : const Color(0x16000000),
          onPressed: () async {
            if (await windowManager.isMaximized()) {
              await windowManager.unmaximize();
            } else {
              await windowManager.maximize();
            }
          },
        ),
        _TitleBarButton(
          icon: FluentIcons.dismiss_16_regular,
          iconColor: iconColor,
          hoverColor: const Color(0xFFC42B1C),
          hoverIconColor: Colors.white,
          onPressed: () => windowManager.close(),
        ),
      ],
    );
  }
}

class _TitleBarButton extends StatefulWidget {
  const _TitleBarButton({
    required this.icon,
    required this.iconColor,
    required this.hoverColor,
    this.hoverIconColor,
    required this.onPressed,
  });

  final IconData icon;
  final Color iconColor;
  final Color hoverColor;
  final Color? hoverIconColor;
  final VoidCallback onPressed;

  @override
  State<_TitleBarButton> createState() => _TitleBarButtonState();
}

class _TitleBarButtonState extends State<_TitleBarButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = _hovering ? widget.hoverColor : Colors.transparent;
    final fgColor = _hovering
        ? (widget.hoverIconColor ?? widget.iconColor)
        : widget.iconColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 46,
          height: kDesktopTitleBarHeight,
          color: bgColor,
          child: Icon(widget.icon, size: 16, color: fgColor),
        ),
      ),
    );
  }
}
