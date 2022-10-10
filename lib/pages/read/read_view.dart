import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
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
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:path/path.dart' as path;

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
    required this.gid,
  }) : super(key: key);
  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.d('ReadPage build $gid');

    final ReadNotifier readNotifier = ref.watch(readProvider.notifier);

    final Gallery gallery = ref.watch(galleryProvider(gid));
    final currentPageIndex = gallery.currentPageIndex;
    final pages = gallery.images.pages;
    final mediaId = gallery.mediaId;

    void onPageChanged(int index) {
      ref.read(galleryProvider(gid).notifier).onPageChanged(index);
    }

    late Widget readView;

    readView = PreloadPhotoViewGallery.builder(
      scrollPhysics: const CustomScrollPhysics(),
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

    return readView;
  }
}
