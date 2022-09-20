import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollingFab extends StatefulWidget {
  const ScrollingFab({
    Key? key,
    this.duration,
    this.curve,
    this.scrollController,
    required this.label,
    required this.icon,
    this.extendedIconLabelSpacing,
    this.onPressed,
  }) : super(key: key);

  final Duration? duration;
  final Curve? curve;
  final ScrollController? scrollController;
  final double? extendedIconLabelSpacing;
  final Widget label;
  final Widget icon;
  final VoidCallback? onPressed;

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
      logger.v('ScrollingFab: ScrollDirection.reverse');
      setState(() {
        _isExtended = false;
      });
    }
    if (widget.scrollController!.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!mounted || _isExtended) {
        return;
      }
      logger.v('ScrollingFab: _scrollListener: forward');
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
  Widget build(BuildContext context) {
    final lableSizeAnimation = AnimatedSize(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      curve: widget.curve ?? Curves.easeInOut,
      child: SizedBox(
        width: _isExtended ? null : 0,
        child: _isExtended ? widget.label : const SizedBox(),
      ),
    );

    return AnimatedSize(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      curve: widget.curve ?? Curves.easeInOut,
      child: FloatingActionButton.extended(
        onPressed: widget.onPressed,
        label: lableSizeAnimation,
        icon: widget.icon,
        isExtended: true,
        extendedIconLabelSpacing:
            _isExtended ? widget.extendedIconLabelSpacing : 0,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
