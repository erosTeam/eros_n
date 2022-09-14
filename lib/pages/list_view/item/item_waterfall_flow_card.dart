import 'package:auto_route/auto_route.dart';
import 'package:eros_n/models/index.dart';
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
    required this.width,
  }) : super(key: key);

  final Gallery gallery;
  final int? index;
  final int? page;
  final double width;

  // 获取图片高度
  double? _getHeigth(double constraintsMaxWidth) {
    // return (galleryProvider.imgHeight ?? 0) *
    //     constraintsMaxWidth /
    //     (galleryProvider.imgWidth ?? 0);

    if ((gallery.imgWidth ?? 0) >= constraintsMaxWidth) {
      return (gallery.imgHeight ?? 0) *
          constraintsMaxWidth /
          (gallery.imgWidth ?? 0);
    } else {
      return gallery.imgHeight?.roundToDouble();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(galleryProvider.notifier).initFromGallery(gallery);
        context.router.pushNamed(NHRoutes.gallery);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _getHeigth(width),
              child: CoverImg(
                imgUrl: gallery.thumbUrl ?? '',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gallery.title ?? '',
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
