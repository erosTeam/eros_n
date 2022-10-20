import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

// Grid视图参数
const double gridCrossAxisSpacing = 0.0;
const double gridMainAxisSpacing = 0.0;
const double gridMaxCrossAxisExtent = 150.0;
const double gridChildAspectRatio = 1 / 1.68;

class ItemGridCard extends HookConsumerWidget {
  const ItemGridCard({
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
    // final showTags = ref.watch(settingsProvider.select((s) => s.showTags));

    final aspectRatio = (gallery.images.thumbnail.imgWidth ?? 300) /
        (gallery.images.thumbnail.imgHeight ?? 400);

    final isBoxFitCover = aspectRatio < 1.2 && aspectRatio > 1 / 2;

    return GestureDetector(
      onTap: () async {
        await RouteUtil.goGallery(ref, gallery, heroTag: tabTag);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        // margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Container(
          foregroundDecoration: (gallery.languageCode == 'ja' ||
                  gallery.languageCode == null)
              ? null
              : RotatedCornerDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  geometry: const BadgeGeometry(
                    width: 38,
                    height: 28,
                    alignment: BadgeAlignment.topRight,
                  ),
                  textSpan: TextSpan(
                    text: gallery.languageCode?.toUpperCase() ?? '',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
          child: Column(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Hero(
                    tag: '${tabTag ?? ''}_${gallery.thumbUrl}',
                    child: ErosCachedNetworkImage(
                      imageUrl: gallery.thumbUrl ?? '',
                      height: gallery.images.thumbnail.imgHeight?.toDouble(),
                      width: gallery.images.thumbnail.imgWidth?.toDouble(),
                      fit: isBoxFitCover ? BoxFit.cover : BoxFit.contain,
                      // fit: BoxFit.cover,
                      // placeholder: (context, url) => const Center(
                      //   child: CircularProgressIndicator(),
                      // ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        (gallery.title.englishTitle ?? '').prettyTitle,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
