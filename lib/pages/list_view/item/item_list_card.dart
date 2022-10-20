import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

const kItemHeight = 200.0;
const kCoverWidth = 120.0;

class ItemListCard extends HookConsumerWidget {
  const ItemListCard({
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
    final showTags = ref.watch(settingsProvider.select((s) => s.showTags));

    final aspectRatio = (gallery.images.thumbnail.imgWidth ?? 300) /
        (gallery.images.thumbnail.imgHeight ?? 400);

    final isBoxFitCover = aspectRatio < 1.2 && aspectRatio > 1 / 2;
    // logger.d('aspectRatio: $aspectRatio, isBoxFitCover: $isBoxFitCover');

    return GestureDetector(
      onTap: () async {
        await RouteUtil.goGallery(ref, gallery, heroTag: tabTag);
      },
      child: SizedBox(
        height: kItemHeight,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Container(
            foregroundDecoration: (gallery.languageCode == 'ja' ||
                    gallery.languageCode == null)
                ? null
                : RotatedCornerDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    geometry: const BadgeGeometry(
                      width: 38,
                      height: 28,
                      alignment: BadgeAlignment.topLeft,
                    ),
                    textSpan: TextSpan(
                      text: gallery.languageCode?.toUpperCase() ?? '',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
            child: Row(
              children: [
                SizedBox(
                  width: kCoverWidth,
                  child: Hero(
                    tag: '${tabTag ?? ''}_${gallery.thumbUrl}',
                    child: ErosCachedNetworkImage(
                      imageUrl: gallery.thumbUrl ?? '',
                      height: gallery.images.thumbnail.imgHeight?.toDouble(),
                      width: gallery.images.thumbnail.imgWidth?.toDouble(),
                      fit: isBoxFitCover ? BoxFit.cover : BoxFit.contain,
                      // fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          showTags && context.isPhone
                              ? (gallery.title.englishTitle ?? '').prettyTitle
                              : gallery.title.englishTitle ?? '',
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          // style: TextStyle(fontSize: 20),
                        ),
                        // Spacer(),
                        SimpleTagsView(
                          simpleTags: gallery.simpleTags,
                          padding: const EdgeInsets.only(top: 8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
