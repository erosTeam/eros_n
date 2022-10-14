import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/theme/theme.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/preload_photo_view_gallery.dart';
import 'package:eros_n/component/widget/scroll.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:path/path.dart' as path;
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
  }) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gid = currentGalleryGid;
    logger.d('ReadPage build $gid');
    useEffect(() {
      ref.read(readProvider.notifier).setFullscreen();
      return () {
        // 恢复状态栏显示
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
        );
      };
    });

    final ReadNotifier readNotifier = ref.watch(readProvider.notifier);

    final readModel = ref.watch(settingsProvider.select((s) => s.readModel));
    logger.d('readModel $readModel');

    late Widget readView;

    switch (readModel) {
      case ReadModel.rightToLeft:
        readView = const ReadPageView(reverse: true);
        break;
      case ReadModel.webtoon:
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

    readView = Scaffold(
      body: readView,
    );

    return readView;
  }
}

class ReadListView extends StatefulHookConsumerWidget {
  const ReadListView({Key? key}) : super(key: key);

  @override
  ConsumerState<ReadListView> createState() => _ReadListViewState();
}

const _kMaxScale = 2.0;
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

  @override
  Widget build(BuildContext context) {
    logger.d('ReadListView build');
    final gid = currentGalleryGid;
    final ReadNotifier readNotifier = ref.read(readProvider.notifier);
    final pages = ref.watch(galleryProvider(gid).select((g) => g.images.pages));
    final mediaId = ref.watch(galleryProvider(gid).select((g) => g.mediaId));

    Widget listView = ScrollablePositionedList.builder(
      minCacheExtent: 0.0,
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
        return AspectRatio(
          aspectRatio: (page.imgWidth ?? 300) / (page.imgHeight ?? 400),
          child: ErosCachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Center(
                child: SizedBox(
                  width: 36 * _kMaxScale,
                  height: 36 * _kMaxScale,
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    strokeWidth: 4 * _kMaxScale,
                  ),
                ),
              );
            },
          ),
        );
      },
    );

    return PhotoViewGallery.builder(
      itemCount: 1,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions.customChild(
          child: listView,
          initialScale: PhotoViewComputedScale.contained,
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * _kMaxScale,
          childSize: context.mediaQuerySize * _kMaxScale,
        );
      },
    );
  }
}

/// 翻页模式
class ReadPageView extends HookConsumerWidget {
  const ReadPageView({Key? key, this.reverse = false}) : super(key: key);
  final bool reverse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // logger.d('ReadPageView build');
    final gid = currentGalleryGid;
    final ReadNotifier readNotifier = ref.watch(readProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        readNotifier.preloadPageController
            .jumpToPage(ref.read(galleryProvider(gid)).currentPageIndex);
      });
      return () {};
    });

    return Consumer(builder: (context, ref, child) {
      logger.d('ReadPageView Consumer build');
      void onPageChanged(int index) {
        ref.read(galleryProvider(gid).notifier).onPageChanged(index);
      }

      final pages =
          ref.watch(galleryProvider(gid).select((g) => g.images.pages));
      final mediaId = ref.watch(galleryProvider(gid).select((g) => g.mediaId));
      // 使用read 避免每次翻页都重新build
      final currentPageIndex =
          ref.read(galleryProvider(gid).select((g) => g.currentPageIndex));

      return PreloadPhotoViewGallery.builder(
        // scrollPhysics: const CustomScrollPhysics(),
        builder: (BuildContext context, int index) {
          final imageUrl = getGalleryImageUrl(
              mediaId ?? '', index, NHConst.extMap[pages[index].type] ?? '');

          return PhotoViewGalleryPageOptions(
            imageProvider: getErorsImageProvider(
              imageUrl,
            ),
            scaleStateCycle: imageScaleStateCycle,
            filterQuality: FilterQuality.medium,
            initialScale: PhotoViewComputedScale.contained * 0.99,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.contained * 2,
            heroAttributes: currentPageIndex == index
                ? PhotoViewHeroAttributes(tag: '${gid}_$index')
                : null,
          );
        },
        reverse: reverse,
        customSize: MediaQuery.of(context).size,
        preloadPagesCount: 3,
        itemCount: pages.length,
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(
            value: event == null
                ? null
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        ),
        pageController: readNotifier.preloadPageController,
        onPageChanged: onPageChanged,
      );
    });
  }
}
