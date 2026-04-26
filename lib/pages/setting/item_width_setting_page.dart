import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/list_view/item/item_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

const double _kMinExtent = 80.0;
const double _kMaxExtent = 300.0;
const int _kPreviewItemCount = 12;

@RoutePage()
class ItemWidthSettingPage extends ConsumerStatefulWidget {
  const ItemWidthSettingPage({super.key});

  @override
  ConsumerState<ItemWidthSettingPage> createState() =>
      _ItemWidthSettingPageState();
}

class _ItemWidthSettingPageState extends ConsumerState<ItemWidthSettingPage> {
  late double _currentExtent;
  late ListModel _listModel;
  late List<double> _randomAspectRatios;

  @override
  void initState() {
    super.initState();
    final settings = ref.read(settingsProvider);
    _listModel = settings.listModel;
    _currentExtent = _listModel == ListModel.grid
        ? settings.gridMaxCrossAxisExtent
        : settings.waterfallMaxCrossAxisExtent;

    final rng = Random(42);
    _randomAspectRatios = List.generate(
      _kPreviewItemCount,
      (_) => 0.6 + rng.nextDouble() * 0.6,
    );
  }

  void _onChanged(double value) {
    setState(() => _currentExtent = value);
  }

  void _onChangeEnd(double value) {
    if (_listModel == ListModel.grid) {
      ref.read(settingsProvider.notifier).setGridMaxCrossAxisExtent(value);
    } else {
      ref.read(settingsProvider.notifier).setWaterfallMaxCrossAxisExtent(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final isGrid = _listModel == ListModel.grid;
    final title = isGrid
        ? '${l10n.grid} - ${l10n.custom_layout_width}'
        : '${l10n.waterfall} - ${l10n.custom_layout_width}';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(child: _buildPreview(context)),
          _buildSlider(context),
        ],
      ),
    );
  }

  Widget _buildPreview(BuildContext context) {
    final isGrid = _listModel == ListModel.grid;

    if (isGrid) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: gridCrossAxisSpacing,
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: _currentExtent,
            crossAxisSpacing: gridCrossAxisSpacing,
            mainAxisSpacing: gridMainAxisSpacing,
            childAspectRatio: gridChildAspectRatio,
          ),
          itemCount: _kPreviewItemCount,
          itemBuilder: (context, index) => _PreviewCard(
            aspectRatio: gridChildAspectRatio,
            index: index,
            cardMargin: null,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NHConst.waterfallFlowLargeCrossAxisSpacing,
        vertical: NHConst.waterfallFlowLargeMainAxisSpacing,
      ),
      child: WaterfallFlow.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _currentExtent,
          crossAxisSpacing: NHConst.waterfallFlowLargeCrossAxisSpacing,
          mainAxisSpacing: NHConst.waterfallFlowLargeMainAxisSpacing,
        ),
        itemCount: _kPreviewItemCount,
        itemBuilder: (context, index) => _PreviewCard(
          aspectRatio: _randomAspectRatios[index],
          index: index,
          cardMargin: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: _currentExtent,
              min: _kMinExtent,
              max: _kMaxExtent,
              divisions: ((_kMaxExtent - _kMinExtent) / 10).round(),
              label: '${_currentExtent.round()}',
              onChanged: _onChanged,
              onChangeEnd: _onChangeEnd,
            ),
            Text(
              '${_currentExtent.round()} px',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({
    required this.aspectRatio,
    required this.index,
    this.cardMargin,
  });
  final double aspectRatio;
  final int index;
  final EdgeInsetsGeometry? cardMargin;

  static const _colors = [
    Color(0xFFE0E0E0),
    Color(0xFFBDBDBD),
    Color(0xFFD0D0D0),
    Color(0xFFC8C8C8),
    Color(0xFFDDDDDD),
    Color(0xFFCCCCCC),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: cardMargin,
        child: Container(
          color: _colors[index % _colors.length],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 8,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
