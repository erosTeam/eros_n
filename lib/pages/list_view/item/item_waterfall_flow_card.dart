import 'package:auto_route/auto_route.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/gallery/gallery_view.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemWaterfallFlowCard extends HookConsumerWidget {
  const ItemWaterfallFlowCard({
    Key? key,
    required this.gallery,
    this.index,
    this.page,
  }) : super(key: key);

  final Gallery gallery;
  final int? index;
  final int? page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(galleryProvider(gallery.gid).notifier)
            .initFromGallery(gallery);
        // context.router.pushNamed(NHRoutes.gallery);
        context.router.push(GalleryRoute(gid: gallery.gid));
      },
      child: Card(
        // clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: gallery.thumbUrl ?? '',
              child: AspectRatio(
                aspectRatio:
                    (gallery.thumbWidth ?? 300) / (gallery.thumbHeight ?? 400),
                child: Card(
                  margin: const EdgeInsets.all(0),
                  clipBehavior: Clip.antiAlias,
                  child: CoverImg(
                    imgUrl: gallery.thumbUrl ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gallery.title.englishTitle ?? '',
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
