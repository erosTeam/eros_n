import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

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
        HookConsumer(builder: (context, ref, child) {
          bool showTags = ref.watch(settingsProvider).showTags;
          if (!showTags || gallery.simpleTags.isEmpty) {
            return const SizedBox();
          }

          final tags = gallery.simpleTags.take(10).toList();
          // final tags = gallery.simpleTags;

          return Container(
            height: 26,
            margin: const EdgeInsets.only(top: 8),
            child: FrameSeparateWidget(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HookConsumer(builder: (context, ref, child) {
                    final isTagTranslate = ref.watch(
                        settingsProvider.select((value) => value.isTagTranslate));

                    final tag = tags[index];

                    if (tag.name == null) {
                      return const SizedBox();
                    }

                    // 圆角边框
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey[600]!),
                        ),
                        margin: const EdgeInsets.only(right: 4),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                        child: Text(
                          isTagTranslate
                              ? tag.translatedName ?? ''
                              : tag.name ?? '',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  });
                },
                itemCount: tags.length,
              ),
            ),
          );
        }),
        Container(
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
        ),
      ],
    );

    item = Card(
      // clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(0),
      child: item,
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
}
