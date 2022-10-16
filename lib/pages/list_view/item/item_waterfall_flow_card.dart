import 'package:eros_n/common/extension.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class ItemWaterfallFlowCard extends HookConsumerWidget {
  const ItemWaterfallFlowCard({
    Key? key,
    required this.gallery,
    this.index,
    this.page,
    this.tabTag,
  }) : super(key: key);

  final Gallery gallery;
  final int? index;
  final int? page;
  final String? tabTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget item = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: '${tabTag ?? ''}_${gallery.thumbUrl}',
          child: AspectRatio(
            aspectRatio: (gallery.images.thumbnail.imgWidth ?? 300) /
                (gallery.images.thumbnail.imgHeight ?? 400),
            child: Card(
              margin: const EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              child: Container(
                foregroundDecoration: (gallery.languageCode == 'ja' ||
                        gallery.languageCode == null)
                    ? null
                    : RotatedCornerDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.8),
                        geometry: const BadgeGeometry(width: 38, height: 28),
                        textSpan: TextSpan(
                          text: gallery.languageCode?.toUpperCase() ?? '',
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                child: CoverImg(
                  imgUrl: gallery.thumbUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        buildTitle(),
        SimpleTagsView(simpleTags: gallery.simpleTags),
      ],
    );

    item = Card(
      // clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: item,
      ),
    );

    return GestureDetector(
      onTap: () async {
        // items
        await RouteUtil.goGallery(ref, gallery, heroTag: tabTag);
      },
      child: item,
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (gallery.title.englishTitle ?? '').prettyTitle,
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                // fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
