import 'dart:math';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/list_view/item/item_grid_card.dart';
import 'package:eros_n/utils/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double _kMinExtent = 80.0;
const double _kMaxExtent = 300.0;

class PinchGridZoom extends ConsumerStatefulWidget {
  const PinchGridZoom({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<PinchGridZoom> createState() => _PinchGridZoomState();
}

class _PinchGridZoomState extends ConsumerState<PinchGridZoom> {
  int? _startColumns;
  bool _committed = false;
  bool _gestureActive = false;

  bool _isGridOrWaterfall() {
    final listModel = ref.read(settingsProvider).listModel;
    return listModel != ListModel.list;
  }

  double _getExtent() {
    final settings = ref.read(settingsProvider);
    if (settings.listModel == ListModel.grid) {
      return settings.gridMaxCrossAxisExtent;
    }
    return settings.waterfallMaxCrossAxisExtent;
  }

  void _setExtent(double value) {
    final clamped = value.clamp(_kMinExtent, _kMaxExtent);
    final listModel = ref.read(settingsProvider).listModel;
    if (listModel == ListModel.grid) {
      ref.read(settingsProvider.notifier).setGridMaxCrossAxisExtent(clamped);
    } else {
      ref
          .read(settingsProvider.notifier)
          .setWaterfallMaxCrossAxisExtent(clamped);
    }
  }

  double _availableWidth() {
    final width = MediaQuery.of(context).size.width;
    final listModel = ref.read(settingsProvider).listModel;
    if (listModel == ListModel.grid) {
      return width - 2 * gridCrossAxisSpacing;
    }
    return width - 2 * NHConst.waterfallFlowLargeCrossAxisSpacing;
  }

  bool _isWaterfall() {
    final m = ref.read(settingsProvider).listModel;
    return m == ListModel.waterfall || m == ListModel.waterfallCompact;
  }

  int _currentColumns() {
    final avail = _availableWidth();
    final extent = _getExtent();
    if (_isWaterfall()) {
      const spacing = NHConst.waterfallFlowLargeCrossAxisSpacing;
      return max(1, (avail / (extent + spacing)).ceil());
    }
    return max(1, (avail / extent).ceil());
  }

  void _applyColumnChange(int delta) {
    final avail = _availableWidth();
    final cols = _currentColumns();
    final target = cols + delta;
    if (target < 1) return;
    double newExtent;
    if (_isWaterfall()) {
      const spacing = NHConst.waterfallFlowLargeCrossAxisSpacing;
      newExtent = avail / target - spacing;
    } else {
      newExtent = avail / target;
    }
    if (newExtent < _kMinExtent || newExtent > _kMaxExtent) return;
    _setExtent(newExtent);
    _showToast(delta < 0);
  }

  void _showToast(bool fewer) {
    final l10n = L10n.of(context);
    final message = fewer ? l10n.show_less : l10n.show_more;
    showSimpleToast(message);
  }

  void _onScaleStart(ScaleStartDetails details) {
    if (!_isGridOrWaterfall()) return;
    if (_gestureActive) return;
    _gestureActive = true;
    _startColumns = _currentColumns();
    _committed = false;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (_startColumns == null || _committed) return;

    if (details.scale > 1.15) {
      _applyColumnChange(-1);
      _committed = true;
    } else if (details.scale < 0.85) {
      _applyColumnChange(1);
      _committed = true;
    }
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _startColumns = null;
    _committed = false;
    _gestureActive = false;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isGridOrWaterfall()) {
      return widget.child;
    }

    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        _EagerScaleRecognizer:
            GestureRecognizerFactoryWithHandlers<_EagerScaleRecognizer>(
          () => _EagerScaleRecognizer(),
          (_EagerScaleRecognizer instance) {
            instance
              ..onStart = _onScaleStart
              ..onUpdate = _onScaleUpdate
              ..onEnd = _onScaleEnd;
          },
        ),
      },
      behavior: HitTestBehavior.translucent,
      child: widget.child,
    );
  }
}

class _EagerScaleRecognizer extends ScaleGestureRecognizer {
  int _pointerCount = 0;

  @override
  void addAllowedPointer(PointerDownEvent event) {
    super.addAllowedPointer(event);
    _pointerCount++;
  }

  @override
  void rejectGesture(int pointer) {
    if (_pointerCount >= 2) {
      acceptGesture(pointer);
    } else {
      super.rejectGesture(pointer);
    }
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _pointerCount = 0;
    super.didStopTrackingLastPointer(pointer);
  }
}
