import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class ScrollingFab extends StatefulWidget {
  const ScrollingFab({
    super.key,
    this.duration,
    this.curve,
    this.scrollController,
    required this.label,
    required this.icon,
    this.extendedIconLabelSpacing,
    this.onPressed,
    this.liquidGlass = false,
  });

  final Duration? duration;
  final Curve? curve;
  final ScrollController? scrollController;
  final double? extendedIconLabelSpacing;
  final Widget label;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool liquidGlass;

  @override
  State<ScrollingFab> createState() => _ScrollingFabState();
}

class _ScrollingFabState extends State<ScrollingFab> {
  late bool _isExtended;

  void _scrollListener() {
    if (widget.scrollController!.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!mounted || !_isExtended) {
        return;
      }
      logger.t('ScrollingFab: ScrollDirection.reverse');
      setState(() {
        _isExtended = false;
      });
    }
    if (widget.scrollController!.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!mounted || _isExtended) {
        return;
      }
      logger.t('ScrollingFab: _scrollListener: forward');
      setState(() {
        _isExtended = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isExtended = true;
    widget.scrollController?.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = widget.duration ?? const Duration(milliseconds: 300);
    final curve = widget.curve ?? Curves.easeInOut;

    if (widget.liquidGlass) {
      return _buildGlassFab(duration, curve);
    }
    return _buildMaterialFab(duration, curve);
  }

  Widget _buildMaterialFab(Duration duration, Curve curve) {
    final labelSizeAnimation = AnimatedSize(
      duration: duration,
      curve: curve,
      child: SizedBox(
        width: _isExtended ? null : 0,
        child: _isExtended ? widget.label : const SizedBox(),
      ),
    );

    return AnimatedSize(
      duration: duration,
      curve: curve,
      child: FloatingActionButton.extended(
        onPressed: widget.onPressed,
        label: labelSizeAnimation,
        icon: widget.icon,
        isExtended: true,
        extendedIconLabelSpacing: _isExtended
            ? widget.extendedIconLabelSpacing
            : 0,
        extendedPadding: _isExtended
            ? const EdgeInsetsDirectional.only(start: 16, end: 20)
            : const EdgeInsetsDirectional.only(start: 16, end: 16),
      ),
    );
  }

  Widget _buildGlassFab(Duration duration, Curve curve) {
    final iconClr = glassIconColor(context);
    final settings = glassButtonSettings(context);

    return AnimatedSize(
      duration: duration,
      curve: curve,
      child: GlassContainer(
        height: kGlassFabSize,
        shape: const LiquidRoundedSuperellipse(borderRadius: kGlassFabRadius),
        useOwnLayer: true,
        settings: settings,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(kGlassFabRadius),
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(color: iconClr, size: 24),
                    child: widget.icon,
                  ),
                  AnimatedSize(
                    duration: duration,
                    curve: curve,
                    child: SizedBox(
                      width: _isExtended ? null : 0,
                      child: _isExtended
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: DefaultTextStyle.merge(
                                style: TextStyle(color: iconClr),
                                child: widget.label,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
