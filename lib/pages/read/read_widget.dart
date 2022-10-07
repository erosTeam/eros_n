import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (context.isTablet) SizedBox(),
                        // 菜单页面入口
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Consumer(builder: (context, ref, child) {
                  final gid = ref.read(readProvider).gid;
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
    // logic.vState.bottomBarHeight = context.mediaQueryPadding.bottom +
    //     (!context.isTablet ? kBottomBarHeight : 0) +
    //     kSliderBarHeight +
    //     (logic.vState.showThumbList ? kThumbListViewHeight : 0);
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
    final gid = ref.read(readProvider).gid;
    final currentItemIndex =
        ref.watch(galleryProvider(gid).select((val) => val.currentPageIndex));
    final totNum = ref
        .watch(galleryProvider(gid).select((val) => val.images.pages.length));

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
              max: totNum - 1.0,
              sliderValue:
                  math.min(currentItemIndex.roundToDouble(), totNum - 1.0),
              onChangedEnd: (_) {},
              onChanged: (_) {},
            ),
          ),
          // 按钮栏
          if (!context.isTablet)
            ControllerButtonBar(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              // showLable: false,
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
    required this.sliderValue,
    required this.onChangedEnd,
    required this.onChanged,
    this.reverse = false,
  }) : super(key: key);

  final double max;
  final double sliderValue;
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
    _value = widget.sliderValue;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _value = widget.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    final minText = Text(
      '${widget.sliderValue.round() + 1}',
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
              value: widget.sliderValue,
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
    this.showLable = true,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool showLable;

  static const buttonWidth = 44.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
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
    return Stack(
      children: [
        child,
        Consumer(builder: (context, ref, child) {
          final topBarOffset =
              ref.watch(readProvider.select((state) => state.topBarOffset));
          final bottomBarOffset =
              ref.watch(readProvider.select((state) => state.bottomBarOffset));
          // logger.d(
          //     'topBarOffset: $topBarOffset bottomBarOffset: $bottomBarOffset');

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
            readNoti.handOnTapCenter();
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
