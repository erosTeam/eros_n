import 'package:async_builder/async_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/theme/theme.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/preload_photo_view_gallery.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:preload_page_view/preload_page_view.dart';

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

  logger.d('actual $actual to $desc');
  return desc;
}

class ReadPage extends HookConsumerWidget {
  const ReadPage({
    Key? key,
    this.gid,
  }) : super(key: key);
  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex =
        ref.watch(galleryProvider(gid).select((g) => g.currentPageIndex));
    final images = ref.watch(galleryProvider(gid).select((g) => g.images));
    final imageKey = ref.watch(galleryProvider(gid).select((g) => g.imageKey));

    void onPageChanged(int index) {
      ref.read(galleryProvider(gid).notifier).onPageChanged(index);
    }

    late Widget body;

    if (false) {
      body = PreloadPhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          final imageUrl = getGalleryImageUrl(imageKey ?? '', index);
          return PhotoViewGalleryPageOptions.customChild(
            child: ErosCachedNetworkImage(
              imageUrl,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            scaleStateCycle: customChildScaleStateCycle,
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.contained * 2,
            // maxScale: 3.0,
            childSize: MediaQuery.of(context).size * 2,
            heroAttributes: currentPageIndex == index
                ? PhotoViewHeroAttributes(tag: '${gid}_$index')
                : null,
          );
        },
        preloadPagesCount: 3,
        itemCount: images.length,
        // loadingBuilder: (context, event) => Center(
        //   child: CircularProgressIndicator(
        //     value: event == null
        //         ? null
        //         : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
        //   ),
        // ),
        // backgroundDecoration: widget.backgroundDecoration,
        pageController: PreloadPageController(initialPage: currentPageIndex),
        onPageChanged: onPageChanged,
      );
    }

    if (true) {
      body = PreloadPhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          final imageUrl = getGalleryImageUrl(imageKey ?? '', index);
          return PhotoViewGalleryPageOptions(
            imageProvider: getErorsImageProvider(
              imageUrl,
            ),
            scaleStateCycle: imageScaleStateCycle,
            filterQuality: FilterQuality.medium,
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.contained * 2,
            heroAttributes: currentPageIndex == index
                ? PhotoViewHeroAttributes(tag: '${gid}_$index')
                : null,
          );
        },
        preloadPagesCount: 3,
        itemCount: images.length,
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(
            value: event == null
                ? null
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        ),
        // backgroundDecoration: const BoxDecoration(
        //   color: Colors.black,
        // ),

        pageController: PreloadPageController(initialPage: currentPageIndex),
        onPageChanged: onPageChanged,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Theme(
        data: ThemeConfig.lightTheme,
        child: Container(color: Colors.black, child: body),
      ),
    );

    // return Scaffold(
    //   body: PageView.builder(
    //     controller: PageController(initialPage: initialPage),
    //     itemBuilder: (BuildContext context, int index) {
    //       final image = images[index];
    //       final AsyncValue<GalleryImage> asyncImage = ref.watch(
    //         galleryImageProvider(image.href),
    //       );
    //
    //       return asyncImage.when(
    //         data: (data) {
    //           return ErosCachedNetworkImage(
    //             data.imageUrl ?? '',
    //             fit: BoxFit.contain,
    //             placeholder: (context, url) => const Center(
    //               child: CircularProgressIndicator(),
    //             ),
    //           );
    //         },
    //         loading: () {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         },
    //         error: (error, stackTrace) {
    //           return const Center(
    //             child: Text('Error'),
    //           );
    //         },
    //       );
    //     },
    //     itemCount: images.length,
    //   ),
    // );
  }
}
