import 'package:async_builder/async_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ReadPage extends HookConsumerWidget {
  const ReadPage({
    Key? key,
    this.gid,
    this.initialPage = 0,
  }) : super(key: key);
  final int initialPage;
  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryProvider(gid));
    final images = gallery.images;
    final imageKey = gallery.imageKey;

    if (false)
      return PhotoViewGallery.builder(
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
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.5,
            // maxScale: PhotoViewComputedScale.contained * 3,
            maxScale: 3.0,
            heroAttributes: PhotoViewHeroAttributes(tag: '${gid}_$index'),
          );
        },
        itemCount: images.length,
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(
            value: event == null
                ? null
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        ),
        // backgroundDecoration: widget.backgroundDecoration,
        pageController: PageController(initialPage: initialPage),
        // onPageChanged: onPageChanged,
      );

    if (true)
      return PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          final imageUrl = getGalleryImageUrl(imageKey ?? '', index);
          return PhotoViewGalleryPageOptions(
            imageProvider: getErorsImageProvider(
              imageUrl,
            ),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.5,
            maxScale: PhotoViewComputedScale.contained * 3,
            heroAttributes: PhotoViewHeroAttributes(tag: '${gid}_$index'),
          );
        },
        itemCount: images.length,
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(
            value: event == null
                ? null
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        ),
        // backgroundDecoration: widget.backgroundDecoration,
        pageController: PageController(initialPage: initialPage),
        // onPageChanged: onPageChanged,
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
