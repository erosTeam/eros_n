import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/enum.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'read_view.dart';

class ViewTopBar extends HookConsumerWidget {
  const ViewTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.mediaQueryPadding.top + kTopBarHeight,
      width: context.mediaQuery.size.width,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.9),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.mediaQueryPadding.horizontal / 2),
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
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    if (context.isTablet)
                      const ControllerButtonBar(
                        mainAxisSize: MainAxisSize.min,
                      ),
                  ],
                ),
                Consumer(builder: (context, ref, child) {
                  final gid = currentGalleryGid;
                  final currentItemIndex = ref.watch(galleryProvider(gid)
                      .select((val) => val.currentPageIndex));
                  final totalItem = ref.watch(galleryProvider(gid)
                      .select((val) => val.images.pages.length));
                  return Container(
                    alignment: Alignment.center,
                    height: kTopBarButtonHeight,
                    child: Text(
                      '${currentItemIndex + 1} / $totalItem',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ViewBottomBar extends HookConsumerWidget {
  const ViewBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarHeight =
        ref.watch(readProvider.select((val) => val.bottomBarHeight));
    final showThumbList =
        ref.watch(readProvider.select((val) => val.showThumbList));

    return AnimatedContainer(
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.9),
      height: bottomBarHeight,
      width: context.mediaQuery.size.width,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: Column(
        children: [
          // 缩略图栏
          AnimatedContainer(
            height: showThumbList ? kThumbListViewHeight : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: const ThumbnailListView(),
          ),
          // 控制栏
          const BottomBarControlWidget(),
        ],
      ),
    );
  }
}

class BottomBarControlWidget extends HookConsumerWidget {
  const BottomBarControlWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gid = currentGalleryGid;
    final currentItemIndex =
        ref.watch(galleryProvider(gid).select((val) => val.currentPageIndex));
    final totNum = ref
        .watch(galleryProvider(gid).select((val) => val.images.pages.length));
    final readNotifier = ref.watch(readProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.mediaQueryPadding.horizontal / 2 + 10),
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
                  0, math.min(currentItemIndex.roundToDouble(), totNum - 1.0)),
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
    Key? key,
    required this.max,
    required this.initValue,
    required this.onChangedEnd,
    required this.onChanged,
    this.reverse = false,
  }) : super(key: key);

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

class ControllerButtonBar extends StatelessWidget {
  const ControllerButtonBar({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.showLabel = true,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool showLabel;

  static const buttonWidth = 44.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: [
        const ReadModelButton(),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.share_outlined),
        // ),
        IconButton(
          onPressed: () {
            // showModalBottomSheet
            // showMaterialModalBottomSheet(
            //   context: context,
            //   enableDrag: true,
            //   builder: (context) => ReadSettings(),
            // );
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                // title: const Text('Read Setting'),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
          },
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}

class ReadModelButton extends HookConsumerWidget {
  const ReadModelButton({
    Key? key,
  }) : super(key: key);

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
          angle: math.pi, child: const Icon(Icons.send_to_mobile_outlined)),
      ReadModel.webtoon: const Icon(Icons.system_update_outlined),
      ReadModel.vertical: Transform.rotate(
          angle: math.pi / 2, child: const Icon(Icons.send_to_mobile_outlined)),
      ReadModel.curlVertical: const Icon(Icons.system_security_update_outlined),
    };

    final items = itemMap.entries.map((e) {
      return PopupMenuItem<ReadModel>(
        value: e.key,
        child: e.value,
      );
    }).toList();

    return PopupMenuButton<ReadModel>(
      icon: Consumer(builder: (context, ref, child) {
        final readModel =
            ref.watch(settingsProvider.select((setting) => setting.readModel));
        return readModelIconMap[readModel]!;
      }),
      color: Theme.of(context).colorScheme.surfaceVariant,
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

class ReadSettings extends StatefulHookConsumerWidget {
  const ReadSettings({
    Key? key,
  }) : super(key: key);

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
    return Container(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer(builder: (context, ref, child) {
            final fullScreenReader = ref.watch(settingsProvider
                .select((settings) => settings.fullScreenReader));
            return ListTile(
              title: Text(L10n.of(context).full_screen),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: fullScreenReader,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setFullScreenReader(value);
                  if (value) {
                    ref.read(readProvider.notifier).setFullscreen();
                  } else {
                    ref.read(readProvider.notifier).unFullscreen();
                  }
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class ThumbnailListView extends HookConsumerWidget {
  const ThumbnailListView({Key? key}) : super(key: key);

  static const kBorderWidth = 2.0;
  static const kRadius = 4.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: kThumbListViewHeight,
      child: SizedBox(),
    );
  }
}

class ReadScaffold extends HookConsumerWidget {
  const ReadScaffold({
    Key? key,
    required this.child,
    required this.topBar,
    required this.bottomBar,
  }) : super(key: key);

  final Widget child;
  final Widget topBar;
  final Widget bottomBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(readProvider.notifier).init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(readProvider.notifier).resetBottomBarHeight(context);
    });
    return Stack(
      children: [
        child,
        Consumer(builder: (context, ref, child) {
          final topBarOffset =
              ref.watch(readProvider.select((state) => state.topBarOffset));
          final bottomBarOffset =
              ref.watch(readProvider.select((state) => state.bottomBarOffset));
          logger.v(
              'topBarOffset: $topBarOffset bottomBarOffset: $bottomBarOffset');

          return Stack(
            children: [
              AnimatedPositioned(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 300),
                top: topBarOffset,
                child: topBar,
              ),
              AnimatedPositioned(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 300),
                bottom: bottomBarOffset,
                child: bottomBar,
              ),
            ],
          );
        }),
      ],
    );
  }
}

/// 控制触摸手势事件
class ImageGestureDetector extends HookConsumerWidget {
  const ImageGestureDetector({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  static const lrRatio = 1 / 3;
  static const tbRatio = 1 / 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readNoti = ref.watch(readProvider.notifier);
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
