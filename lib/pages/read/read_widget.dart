import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/pages/setting/read_setting_page.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

const _kShowBarGradient = true;
const _kMaxSliderWidth = 400.0;
const _kMaxButtonBarWidth = 200.0;

class _BarAlignmentScope extends InheritedWidget {
  const _BarAlignmentScope({required this.alignment, required super.child});

  final Alignment alignment;

  static Alignment of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<_BarAlignmentScope>()
            ?.alignment ??
        Alignment.bottomCenter;
  }

  @override
  bool updateShouldNotify(_BarAlignmentScope oldWidget) =>
      alignment != oldWidget.alignment;
}

LiquidGlassSettings _glassSettings(bool isDark) => LiquidGlassSettings(
  blur: kGlassBlur,
  thickness: kGlassAppBarThickness,
  glassColor: isDark
      ? const Color.fromARGB(100, 60, 60, 60)
      : const Color.fromARGB(100, 255, 255, 255),
);

class ViewTopBar extends HookConsumerWidget {
  const ViewTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liquidGlass = ref.watch(
      settingsProvider.select((s) => s.liquidGlass),
    );

    final height = context.mediaQueryPadding.top + kTopBarHeight;
    final width = context.mediaQuery.size.width;

    if (liquidGlass) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            if (_kShowBarGradient)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDark
                          ? const [
                              Color.fromARGB(255, 0, 0, 0),
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(80, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ]
                          : const [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(200, 255, 255, 255),
                              Color.fromARGB(80, 255, 255, 255),
                              Color.fromARGB(0, 255, 255, 255),
                            ],
                      stops: const [0.0, 0.35, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: context.mediaQueryPadding.top,
                left: context.mediaQueryPadding.horizontal / 2 + 12,
                right: context.mediaQueryPadding.horizontal / 2 + 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlassContainer(
                    padding: EdgeInsets.zero,
                    shape: const LiquidOval(),
                    settings: _glassSettings(isDark),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () => context.router.pop(),
                    ),
                  ),
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, child) {
                      final gid = currentGalleryGid;
                      final currentItemIndex = ref.watch(
                        galleryProvider(
                          gid,
                        ).select((val) => val.currentPageIndex),
                      );
                      final totalItem = ref.watch(
                        galleryProvider(
                          gid,
                        ).select((val) => val.images.pages.length),
                      );
                      return GlassContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        settings: _glassSettings(isDark),
                        child: Text(
                          '${currentItemIndex + 1} / $totalItem',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: isDark ? Colors.white : Colors.black,
                              ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  if (context.isTablet)
                    GlassContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      shape: const LiquidRoundedSuperellipse(borderRadius: 999),
                      settings: _glassSettings(isDark),
                      child: _TabletButtonRow(ref: ref),
                    )
                  else
                    const SizedBox(width: 40),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: height,
      width: width,
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.mediaQueryPadding.horizontal / 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => context.router.pop(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    if (context.isTablet)
                      const ControllerButtonBar(mainAxisSize: MainAxisSize.min),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final gid = currentGalleryGid;
                    final currentItemIndex = ref.watch(
                      galleryProvider(
                        gid,
                      ).select((val) => val.currentPageIndex),
                    );
                    final totalItem = ref.watch(
                      galleryProvider(
                        gid,
                      ).select((val) => val.images.pages.length),
                    );
                    return Container(
                      alignment: Alignment.center,
                      height: kTopBarButtonHeight,
                      child: Text(
                        '${currentItemIndex + 1} / $totalItem',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ViewBottomBar extends HookConsumerWidget {
  const ViewBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liquidGlass = ref.watch(
      settingsProvider.select((s) => s.liquidGlass),
    );
    final bottomBarHeight = ref.watch(
      readProvider.select((val) => val.bottomBarHeight),
    );
    final showThumbList = ref.watch(
      readProvider.select((val) => val.showThumbList),
    );

    if (liquidGlass) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return SizedBox(
        height: bottomBarHeight,
        width: context.mediaQuery.size.width,
        child: Stack(
          children: [
            if (_kShowBarGradient)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: isDark
                          ? const [
                              Color.fromARGB(255, 0, 0, 0),
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(80, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ]
                          : const [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(200, 255, 255, 255),
                              Color.fromARGB(80, 255, 255, 255),
                              Color.fromARGB(0, 255, 255, 255),
                            ],
                      stops: const [0.0, 0.35, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
            Column(
              children: [
                AnimatedContainer(
                  height: showThumbList ? kThumbListViewHeight : 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: const ThumbnailListView(),
                ),
                const GlassBottomBarControl(),
              ],
            ),
          ],
        ),
      );
    }

    return AnimatedContainer(
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
      height: bottomBarHeight,
      width: context.mediaQuery.size.width,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: Column(
        children: [
          AnimatedContainer(
            height: showThumbList ? kThumbListViewHeight : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: const ThumbnailListView(),
          ),
          const BottomBarControlWidget(),
        ],
      ),
    );
  }
}

class GlassBottomBarControl extends HookConsumerWidget {
  const GlassBottomBarControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final gid = currentGalleryGid;
    final currentItemIndex = ref.watch(
      galleryProvider(gid).select((val) => val.currentPageIndex),
    );
    final totNum = ref.watch(
      galleryProvider(gid).select((val) => val.images.pages.length),
    );
    final readNotifier = ref.read(readProvider.notifier);

    final alignment = _BarAlignmentScope.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.mediaQueryPadding.horizontal / 2 + 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedAlign(
            alignment: alignment,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _kMaxSliderWidth),
              child: GlassContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                shape: const LiquidRoundedSuperellipse(borderRadius: 999),
                settings: _glassSettings(isDark),
                child: GlassViewPageSlider(
                  key: ValueKey('GlassViewPageSlider_$currentItemIndex'),
                  max: math.max(0, totNum - 1.0),
                  initValue: math.max(
                    0,
                    math.min(currentItemIndex.roundToDouble(), totNum - 1.0),
                  ),
                  onChangedEnd: (val) {
                    readNotifier.jumpToPage(val.round());
                  },
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (!context.isTablet)
            AnimatedAlign(
              alignment: alignment,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: _kMaxButtonBarWidth,
                ),
                child: GlassContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  shape: const LiquidRoundedSuperellipse(borderRadius: 999),
                  settings: _glassSettings(isDark),
                  child: const GlassControllerButtonBar(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TabletButtonRow extends StatelessWidget {
  const _TabletButtonRow({required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;
    return IconTheme(
      data: IconThemeData(size: 22, color: iconColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ReadModelButton(),
          const AutoReadButton(),
          IconButton(
            onPressed: () async {
              final nowAutoRead = ref.read(
                readProvider.select((s) => s.autoRead),
              );
              if (nowAutoRead) {
                ref.read(readProvider.notifier).stopAutoRead();
              }
              await showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  content: ReadSettings(),
                ),
              );
              if (nowAutoRead) {
                ref.read(readProvider.notifier).startAutoRead();
              }
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}

class GlassControllerButtonBar extends HookConsumerWidget {
  const GlassControllerButtonBar({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  });

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;
    return IconTheme(
      data: IconThemeData(color: iconColor),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [
          const ReadModelButton(),
          const AutoReadButton(),
          IconButton(
            onPressed: () async {
              final nowAutoRead = ref.read(
                readProvider.select((s) => s.autoRead),
              );
              if (nowAutoRead) {
                ref.read(readProvider.notifier).stopAutoRead();
              }
              await showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  content: ReadSettings(),
                ),
              );
              if (nowAutoRead) {
                ref.read(readProvider.notifier).startAutoRead();
              }
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}

class BottomBarControlWidget extends HookConsumerWidget {
  const BottomBarControlWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gid = currentGalleryGid;
    final currentItemIndex = ref.watch(
      galleryProvider(gid).select((val) => val.currentPageIndex),
    );
    final totNum = ref.watch(
      galleryProvider(gid).select((val) => val.images.pages.length),
    );
    final readNotifier = ref.read(readProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.mediaQueryPadding.horizontal / 2 + 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 滑动控件
          Container(
            height: kSliderBarHeight,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ViewPageSlider(
              key: ValueKey('ViewPageSlider_$currentItemIndex'),
              max: math.max(0, totNum - 1.0),
              initValue: math.max(
                0,
                math.min(currentItemIndex.roundToDouble(), totNum - 1.0),
              ),
              onChangedEnd: (val) {
                logger.d('onChangedEnd ${val + 1}');
                readNotifier.jumpToPage(val.round());
              },
              onChanged: (_) {},
            ),
          ),
          // 按钮栏
          if (!context.isTablet)
            const ControllerButtonBar(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
            ),
        ],
      ),
    );
  }
}

/// 页面滑条
class ViewPageSlider extends StatefulWidget {
  const ViewPageSlider({
    super.key,
    required this.max,
    required this.initValue,
    required this.onChangedEnd,
    required this.onChanged,
    this.reverse = false,
  });

  final double max;
  final double initValue;
  final ValueChanged<double> onChangedEnd;
  final ValueChanged<double> onChanged;
  final bool reverse;

  @override
  State<ViewPageSlider> createState() => _ViewPageSliderState();
}

class _ViewPageSliderState extends State<ViewPageSlider> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    final minText = Text(
      '${widget.initValue.round() + 1}',
      style: Theme.of(context).textTheme.titleMedium,
    );

    final maxText = Text(
      '${widget.max.round() + 1}',
      style: Theme.of(context).textTheme.titleMedium,
    );

    return Row(
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(minWidth: 30),
          alignment: Alignment.center,
          child: widget.reverse ? maxText : minText,
        ),
        Expanded(
          child: Transform.rotate(
            angle: widget.reverse ? math.pi : 0.0,
            child: Slider(
              min: 0,
              max: widget.max,
              value: _value,
              label: '${_value.round() + 1}',
              divisions: widget.max > 0 ? widget.max.round() : null,
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue;
                });
                widget.onChanged(newValue);
              },
              onChangeEnd: (double newValue) {
                widget.onChangedEnd(newValue);
              },
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minWidth: 30),
          alignment: Alignment.center,
          child: widget.reverse ? minText : maxText,
        ),
      ],
    );
  }
}

class GlassViewPageSlider extends StatefulWidget {
  const GlassViewPageSlider({
    super.key,
    required this.max,
    required this.initValue,
    required this.onChangedEnd,
    required this.onChanged,
  });

  final double max;
  final double initValue;
  final ValueChanged<double> onChangedEnd;
  final ValueChanged<double> onChanged;

  @override
  State<GlassViewPageSlider> createState() => _GlassViewPageSliderState();
}

class _GlassViewPageSliderState extends State<GlassViewPageSlider> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      color: textColor,
      shadows: const [Shadow(blurRadius: 4, color: Colors.black54)],
    );

    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 36),
          alignment: Alignment.center,
          child: Text('${widget.initValue.round() + 1}', style: textStyle),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: isDark ? Colors.white70 : Colors.black54,
              inactiveTrackColor: isDark ? Colors.white24 : Colors.black12,
              thumbColor: isDark ? Colors.white : Colors.black87,
              overlayColor: (isDark ? Colors.white : Colors.black).withValues(
                alpha: 0.1,
              ),
            ),
            child: Slider(
              min: 0,
              max: widget.max,
              value: _value,
              label: '${_value.round() + 1}',
              divisions: widget.max > 0 ? widget.max.round() : null,
              onChanged: (double newValue) {
                setState(() => _value = newValue);
                widget.onChanged(newValue);
              },
              onChangeEnd: (double newValue) {
                widget.onChangedEnd(newValue);
              },
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minWidth: 36),
          alignment: Alignment.center,
          child: Text('${widget.max.round() + 1}', style: textStyle),
        ),
      ],
    );
  }
}

// 阅读控制按钮栏
class ControllerButtonBar extends HookConsumerWidget {
  const ControllerButtonBar({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.showLabel = true,
  });

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool showLabel;

  static const buttonWidth = 44.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: [
        const ReadModelButton(),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.share_outlined),
        // ),
        const AutoReadButton(),
        IconButton(
          onPressed: () async {
            // showModalBottomSheet
            // showMaterialModalBottomSheet(
            //   context: context,
            //   enableDrag: true,
            //   builder: (context) => ReadSettings(),
            // );

            // now auto read
            final nowAutoRead = ref.read(
              readProvider.select((s) => s.autoRead),
            );

            // stop auto read
            if (nowAutoRead) {
              ref.read(readProvider.notifier).stopAutoRead();
            }

            await showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                // title: const Text('Read Setting'),
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                content: ReadSettings(),
              ),
            );
            // showBottomSheet(
            //   context: context,
            //   builder: (context) => BottomSheet(
            //     onClosing: () {},
            //     enableDrag: false,
            //     builder: (BuildContext context) {
            //       return const ReadSettings();
            //     },
            //   ),
            // );

            // restart auto read
            if (nowAutoRead) {
              ref.read(readProvider.notifier).startAutoRead();
            }
          },
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}

class AutoReadButton extends HookConsumerWidget {
  const AutoReadButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoRead = ref.watch(readProvider.select((r) => r.autoRead));
    return IconButton(
      onPressed: () {
        ref.read(readProvider.notifier).toggleAutoRead();
      },
      icon: autoRead
          ? const Icon(Icons.timer_off_outlined)
          : const Icon(Icons.timer_outlined),
    );
  }
}

// 阅读模式按钮
class ReadModelButton extends HookConsumerWidget {
  const ReadModelButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemMap = {
      ReadModel.leftToRight: Text(L10n.of(context).left_to_right),
      ReadModel.rightToLeft: Text(L10n.of(context).right_to_left),
      ReadModel.webtoon: Text(L10n.of(context).webtoon),
      ReadModel.curlVertical: Text(L10n.of(context).curl_vertical),
      ReadModel.vertical: Text(L10n.of(context).vertical),
    };

    final readModelIconMap = <ReadModel, Widget>{
      ReadModel.leftToRight: const Icon(Icons.send_to_mobile_outlined),
      ReadModel.rightToLeft: Transform.rotate(
        angle: math.pi,
        child: const Icon(Icons.send_to_mobile_outlined),
      ),
      ReadModel.webtoon: const Icon(Icons.system_update_outlined),
      ReadModel.vertical: Transform.rotate(
        angle: math.pi / 2,
        child: const Icon(Icons.send_to_mobile_outlined),
      ),
      ReadModel.curlVertical: const Icon(Icons.system_security_update_outlined),
    };

    final items = itemMap.entries.map((e) {
      return PopupMenuItem<ReadModel>(value: e.key, child: e.value);
    }).toList();

    return PopupMenuButton<ReadModel>(
      icon: Consumer(
        builder: (context, ref, child) {
          final readModel = ref.watch(
            settingsProvider.select((setting) => setting.readModel),
          );
          return readModelIconMap[readModel]!;
        },
      ),
      color: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 2,
      onSelected: (val) {
        ref.read(settingsProvider.notifier).setReadModel(val);
      },
      // 28 or 80
      offset: context.isTablet
          ? const Offset(0, kToolbarHeight - 6)
          : Offset(0, -(48.0 * itemMap.length) - 28),
      itemBuilder: (context) => items,
    );
  }
}

// 阅读设置
class ReadSettings extends StatefulHookConsumerWidget {
  const ReadSettings({super.key});

  @override
  ConsumerState<ReadSettings> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends ConsumerState<ReadSettings>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const SizedBox(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FullScreenListTile(onReadView: true),
          // switch volumeKeyTurnPage
          VolumeKeyTurnPageListTile(onReadView: true),
          // autoReadInterval slider
          AutoReadIntervalListTile(),
          PreloadPagesCountListTile(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ThumbnailListView extends HookConsumerWidget {
  const ThumbnailListView({super.key});

  static const kBorderWidth = 2.0;
  static const kRadius = 4.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(height: kThumbListViewHeight, child: SizedBox());
  }
}

class ReadScaffold extends ConsumerStatefulWidget {
  const ReadScaffold({
    super.key,
    required this.child,
    required this.topBar,
    required this.bottomBar,
  });

  final Widget child;
  final Widget topBar;
  final Widget bottomBar;

  @override
  ConsumerState<ReadScaffold> createState() => _ReadScaffoldState();
}

class _ReadScaffoldState extends ConsumerState<ReadScaffold> {
  Alignment _barAlignment = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(readProvider.notifier).resetBottomBarHeight(context);
    });
    return LiquidGlassScope(
      child: Stack(
        children: [
          GlassRefractionSource(
            child: Listener(
              onPointerMove: (event) {
                final w = MediaQuery.of(context).size.width;
                final dx = event.position.dx;
                if (dx < w / 3) {
                  if (_barAlignment != Alignment.bottomLeft) {
                    setState(() => _barAlignment = Alignment.bottomLeft);
                  }
                } else if (dx > w * 2 / 3) {
                  if (_barAlignment != Alignment.bottomRight) {
                    setState(() => _barAlignment = Alignment.bottomRight);
                  }
                }
              },
              child: widget.child,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final topBarOffset = ref.watch(
                readProvider.select((state) => state.topBarOffset),
              );
              final bottomBarOffset = ref.watch(
                readProvider.select((state) => state.bottomBarOffset),
              );
              logger.t(
                'topBarOffset: $topBarOffset bottomBarOffset: $bottomBarOffset',
              );

              return Stack(
                children: [
                  AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 300),
                    top: topBarOffset,
                    child: widget.topBar,
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 300),
                    bottom: bottomBarOffset,
                    child: _BarAlignmentScope(
                      alignment: _barAlignment,
                      child: widget.bottomBar,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// 控制触摸手势事件
class ImageGestureDetector extends HookConsumerWidget {
  const ImageGestureDetector({super.key, required this.child});
  final Widget child;

  static const lrRatio = 1 / 3;
  static const tbRatio = 1 / 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readNoti = ref.read(readProvider.notifier);
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTapUp: (details) {
        // logger.d('${details.globalPosition} ${details.localPosition}');

        final globalPosition = details.globalPosition;
        if (globalPosition.dx < context.width * (1 - lrRatio) &&
            globalPosition.dx > context.width * lrRatio) {
          if (globalPosition.dy < context.height * tbRatio) {
            readNoti.toPrev();
          } else if (globalPosition.dy > context.height * (1 - tbRatio)) {
            readNoti.toNext();
          } else {
            readNoti.handOnTapCenter(context);
          }
        }

        if (globalPosition.dx < context.width * lrRatio) {
          readNoti.tapLeft();
        }

        if (globalPosition.dx > context.width * (1 - lrRatio)) {
          readNoti.tapRight();
        }
      },
      child: child,
    );
  }
}
