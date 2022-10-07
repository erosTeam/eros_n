import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class SimpleTag extends HookConsumerWidget {
  const SimpleTag({
    Key? key,
    required this.tag,
  }) : super(key: key);
  final Tag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTagTranslate =
        ref.watch(settingsProvider.select((value) => value.isTagTranslate));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey[600]!),
      ),
      child: Text(
        isTagTranslate ? tag.translatedName ?? '' : tag.name ?? '',
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

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
    Widget item = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: gallery.thumbUrl,
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
        buildTags(),
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
      onTap: () {
        ref
            .read(galleryProvider(gallery.gid).notifier)
            .initFromGallery(gallery);
        // context.router.pushNamed(NHRoutes.gallery);
        context.router.push(GalleryRoute(gid: gallery.gid));
      },
      child: item,
    );
  }

  Widget buildTags() {
    return Consumer(builder: (context, ref, child) {
      final showTags = ref.watch(settingsProvider).showTags;
      final tagLayoutOnCard = ref.watch(settingsProvider).tagLayoutOnCard;

      if (!showTags || gallery.simpleTags.isEmpty) {
        return const SizedBox();
      }

      final tags = gallery.simpleTags.take(10).toList();
      // final tags = gallery.simpleTags;

      switch (tagLayoutOnCard) {
        case TagLayoutOnCard.row:
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  ...tags
                      .where((tag) => tag.name != null)
                      .map((e) => SimpleTag(tag: e).paddingOnly(right: 4)),
                ],
              ),
            ),
          );

        case TagLayoutOnCard.horizontal:
          return SizedBox(
            height: 26,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final tag = tags[index];

                if (tag.name == null) {
                  return const SizedBox();
                }

                // 圆角边框
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 4),
                  child: SimpleTag(tag: tag),
                );
              },
              itemCount: tags.length,
            ),
          );
        case TagLayoutOnCard.wrap:
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: tags
                  .where((tag) => tag.name != null)
                  .map((tag) => SimpleTag(tag: tag))
                  .toList(),
            ),
          );
      }
    });
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
