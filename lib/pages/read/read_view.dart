import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/preload_photo_view_gallery.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'read_widget.dart';

// 底栏控制栏按钮高度
const double kBottomBarButtonHeight = 54.0;

// 底栏控制栏高度
const double kBottomBarHeight = 64.0;

// 底栏滑动栏高度
const double kSliderBarHeight = 64.0;

// 顶栏高度
const double kTopBarHeight = kToolbarHeight;

// 顶栏按钮高度
const double kTopBarButtonHeight = 44.0;

// 缩略图栏高度
const double kThumbListViewHeight = 140.0;
const double kThumbImageWidth = kThumbListViewHeight / 2 - 10;

PhotoViewScaleState customChildScaleStateCycle(PhotoViewScaleState actual) {
  PhotoViewScaleState desc = PhotoViewScaleState.initial;
  switch (actual) {
    case PhotoViewScaleState.initial:
      desc = PhotoViewScaleState.covering;
      break;
    case PhotoViewScaleState.covering:
      desc = PhotoViewScaleState.originalSize;
      break;
    case PhotoViewScaleState.originalSize:
      desc = PhotoViewScaleState.initial;
      break;
    case PhotoViewScaleState.zoomedIn:
    case PhotoViewScaleState.zoomedOut:
      desc = PhotoViewScaleState.initial;
      break;
    default:
      desc = PhotoViewScaleState.initial;
  }

  logger.d('actual $actual to $desc');
  return desc;
}

PhotoViewScaleState imageScaleStateCycle(PhotoViewScaleState actual) {
  PhotoViewScaleState desc = PhotoViewScaleState.initial;

  switch (actual) {
    case PhotoViewScaleState.initial:
      desc = PhotoViewScaleState.covering;
      break;
    case PhotoViewScaleState.covering:
      desc = PhotoViewScaleState.originalSize;
      break;
    case PhotoViewScaleState.originalSize:
      desc = PhotoViewScaleState.initial;
      break;
    case PhotoViewScaleState.zoomedIn:
    case PhotoViewScaleState.zoomedOut:
      desc = PhotoViewScaleState.initial;
      break;
    default:
      desc = PhotoViewScaleState.initial;
  }

  logger.v('actual $actual to $desc');
  return desc;
}

class ReadPage extends HookConsumerWidget {
  const ReadPage({
    Key? key,
    this.index,
    this.colorScheme,
  }) : super(key: key);
  final int? index;
  final ColorScheme? colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gid = currentGalleryGid;
    logger.v('ReadPage build $gid');
    final ReadNotifier readNotifier = ref.watch(readProvider.notifier);

    useEffect(() {
      if (!ref.read(readProvider).showAppBar) {
        readNotifier.setFullscreen();
      }
      readNotifier.addVolumeKeydownListen();

      // ref.listen<Gallery>(galleryProvider(gid), (previous, next) {
      //   if (next.currentPageIndex != previous?.currentPageIndex) {
      //     logger.d('ReadPage currentPageIndex change ${next.currentPageIndex}');
      //   }
      // });

      return () {
        logger.v('ReadPage dispose');
        // 恢复状态栏显示
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
        );

        readNotifier.closeVolumeKeydownListen();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          readNotifier.stopAutoRead();
        });
      };
    });

    final readModel = ref.watch(settingsProvider.select((s) => s.readModel));
    logger.v('readModel $readModel');

    late Widget readView;

    switch (readModel) {
      case ReadModel.rightToLeft:
        readView = const ReadPageView(reverse: true);
        break;
      case ReadModel.webtoon:
        readView = const ReadListView(separator: false);
        break;
      case ReadModel.vertical:
        readView = const ReadPageView(scrollDirection: Axis.vertical);
        break;
      case ReadModel.curlVertical:
        readView = const ReadListView();
        break;
      case ReadModel.leftToRight:
      default:
        readView = const ReadPageView();
        break;
    }

    // readView = const ReadPageView();

    readView = ImageGestureDetector(
      child: Container(color: Colors.black, child: readView),
    );

    readView = ReadScaffold(
      topBar: const ViewTopBar(),
      bottomBar: const ViewBottomBar(),
      child: readView,
    );

    // readView = Theme(
    //   data: ThemeConfig.darkTheme,
    //   child: readView,
    // );

    // readView = AnnotatedRegion<SystemUiOverlayStyle>(
    //   value: const SystemUiOverlayStyle(
    //     systemNavigationBarColor: Colors.transparent,
    //     systemNavigationBarDividerColor: Colors.transparent,
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarIconBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.light,
    //     statusBarBrightness: Brightness.dark,
    //   ),
    //   child: readView,
    // );

    readView = Theme(
      data: Theme.of(context).copyWith(colorScheme: colorScheme),
      child: Scaffold(
        body: readView,
      ),
    );

    return readView;
  }
}

class ReadListView extends StatefulHookConsumerWidget {
  const ReadListView({Key? key, this.separator = true}) : super(key: key);
  final bool separator;

  @override
  ConsumerState<ReadListView> createState() => _ReadListViewState();
}

const _kMaxScale = 1.0;
const _kMinCircularProgressIndicatorSize = 36.0;

class _ReadListViewState extends ConsumerState<ReadListView> {
  @override
  void initState() {
    super.initState();
    final gid = currentGalleryGid;
    final ReadNotifier readNotifier = ref.read(readProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      logger.d('ReadListView addPostFrameCallback');
      readNotifier.itemScrollController
          .jumpTo(index: ref.read(galleryProvider(gid)).currentPageIndex);
    });
    // list视图滚动监听
    readNotifier.itemPositionsListener.itemPositions.addListener(() {
      final positions = readNotifier.itemPositionsListener.itemPositions.value;
      // final tempPos = positions.first.itemLeadingEdge;
      readNotifier.handItemPositionsChange(
        positions,
        onChanged: (index) {
          // read currentPageIndex, 避免每次翻页都rebuild
          final currentPageIndex =
              ref.read(galleryProvider(gid).select((g) => g.currentPageIndex));
          if (currentPageIndex != index) {
            ref.read(galleryProvider(gid).notifier).onPageChanged(index);
          }
        },
      );
    });
  }

  Widget buildImage(String imageUrl, {int? index}) {
    return ErosCachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fitWidth,
      onLoadCompleted: () {
        if (index != null) {
          logger.d(
              'onLoadCompleted $imageUrl ${ref.read(readProvider).loadCompleteIndexSet}');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // ref.read(readProvider.notifier).addLoadCompleteIndexSet(index);
            ref.read(readProvider.notifier).getCompleter(index)?.complete();
          });
        }
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: SizedBox(
            width: _kMinCircularProgressIndicatorSize * _kMaxScale,
            height: _kMinCircularProgressIndicatorSize * _kMaxScale,
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              strokeWidth: 4 * _kMaxScale,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    logger.d('ReadListView build');
    final gid = currentGalleryGid;
    final ReadNotifier readNotifier = ref.read(readProvider.notifier);
    final pages = ref.watch(galleryProvider(gid).select((g) => g.images.pages));
    final mediaId = ref.watch(galleryProvider(gid).select((g) => g.mediaId));

    Widget listView = ScrollablePositionedList.separated(
      minCacheExtent: 0.0,
      // addAutomaticKeepAlives: false,
      padding: EdgeInsets.only(
        top: context.mediaQueryPadding.top,
        bottom: context.mediaQueryPadding.bottom,
      ),
      itemScrollController: readNotifier.itemScrollController,
      itemPositionsListener: readNotifier.itemPositionsListener,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final GalleryImage page = pages[index];
        final imageUrl = getGalleryImageUrl(
            mediaId ?? '', index, NHConst.extMap[page.type] ?? '');

        ref.read(readProvider.notifier).getCompleter(index);

        Widget image = buildImage(imageUrl, index: index);

        image = AspectRatio(
          aspectRatio: (page.imgWidth ?? 300) / (page.imgHeight ?? 400),
          child: image,
        );

        return image;
      },
      separatorBuilder: (BuildContext context, int index) {
        if (widget.separator) {
          return const SizedBox(height: 10);
        } else {
          return const SizedBox();
        }
      },
    );

    return GestureZoomBox(
      child: listView,
    );

    // return Container(
    //   child: Zoom(
    //     initScale: 1.0,
    //     maxZoomHeight: 1.0,
    //     maxZoomWidth: 1.0,
    //     child: listView,
    //   ),
    // );

    // listView =  PhotoViewGallery.builder(
    //   itemCount: 1,
    //   customSize: context.mediaQuerySize,
    //   builder: (BuildContext context, int index) {
    //     return PhotoViewGalleryPageOptions.customChild(
    //       child: listView,
    //       initialScale: PhotoViewComputedScale.contained,
    //       minScale: PhotoViewComputedScale.contained,
    //       maxScale: PhotoViewComputedScale.covered * 4,
    //       childSize: context.mediaQuerySize * _kMaxScale,
    //     );
    //   },
    // );

    return listView;
  }
}

/// 翻页模式
class ReadPageView extends HookConsumerWidget {
  const ReadPageView({
    Key? key,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);
  final bool reverse;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // logger.d('ReadPageView build');
    final gid = currentGalleryGid;
    final ReadNotifier readNotifier = ref.read(readProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        readNotifier.preloadPageController
            .jumpToPage(ref.read(galleryProvider(gid)).currentPageIndex);
      });
      return () {};
    });

    return Consumer(
      builder: (context, ref, child) {
        logger.v('ReadPageView Consumer build');
        void onPageChanged(int index) {
          ref.read(galleryProvider(gid).notifier).onPageChanged(index);
        }

        final pages =
            ref.watch(galleryProvider(gid).select((g) => g.images.pages));
        final mediaId =
            ref.watch(galleryProvider(gid).select((g) => g.mediaId));

        final preloadPagesCount =
            ref.watch(settingsProvider.select((s) => s.preloadPagesCount));

        // 用于控制hero动画
        final currentIndex = ref.watch(
            galleryProvider(gid).select((gallery) => gallery.currentPageIndex));

        final thumbHeroTagPrefix = ref.watch(thumbHeroTagPrefixProvider);

        return PreloadPhotoViewGallery.builder(
          scrollDirection: scrollDirection,
          wantKeepAlive: false,
          builder: (BuildContext context, int index) {
            final imageUrl = getGalleryImageUrl(
                mediaId ?? '', index, NHConst.extMap[pages[index].type] ?? '');

            final completer =
                ref.read(readProvider.notifier).getCompleter(index);

            final imageProvider = getErosImageProvider(imageUrl);

            imageProvider.resolve(const ImageConfiguration()).addListener(
              ImageStreamListener(
                (ImageInfo imageInfo, _) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // ref
                    //     .read(readProvider.notifier)
                    //     .addLoadCompleteIndexSet(index);
                    if (completer?.isCompleted == false) {
                      completer?.complete();
                    }
                  });
                },
              ),
            );

            return PhotoViewGalleryPageOptions(
              imageProvider: imageProvider,
              scaleStateCycle: imageScaleStateCycle,
              filterQuality: FilterQuality.medium,
              initialScale: PhotoViewComputedScale.contained * 0.99,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.contained * 2,
              heroAttributes: currentIndex == index
                  ? PhotoViewHeroAttributes(
                      tag: '$thumbHeroTagPrefix${gid}_$index')
                  : null,
            );
          },
          reverse: reverse,
          customSize: MediaQuery.of(context).size,
          preloadPagesCount: preloadPagesCount,
          itemCount: pages.length,
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(
              value: event == null
                  ? null
                  : event.cumulativeBytesLoaded /
                      (event.expectedTotalBytes ?? 1),
            ),
          ),
          pageController: readNotifier.preloadPageController,
          onPageChanged: onPageChanged,
        );
      },
    );
  }
}
