import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
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
    this.compact = false,
  }) : super(key: key);

  final Gallery gallery;
  final int? index;
  final int? page;
  final String? tabTag;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTags = ref.watch(settingsProvider.select((s) => s.showTags));
    Widget item = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCoverImage(context, compact, showTags),
        if (!compact) buildTitle(),
        if (!compact) SimpleTagsView(simpleTags: gallery.simpleTags),
      ],
    );

    if (!compact) {
      item = Card(
        // clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(0),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: item,
        ),
      );
    }

    return GestureDetector(
      onTap: () async {
        // items
        await RouteUtil.goGallery(ref, gallery, heroTag: tabTag);
      },
      child: item,
    );
  }

  Widget buildCoverImage(BuildContext context, bool compact, bool showTags) {
    Widget coverImage = Container(
      foregroundDecoration: (gallery.languageCode == 'ja' ||
              gallery.languageCode == null)
          ? null
          : RotatedCornerDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
              geometry: const BadgeGeometry(width: 38, height: 28),
              textSpan: TextSpan(
                text: gallery.languageCode?.toUpperCase() ?? '',
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
      child: CoverImg(
        imgUrl: gallery.thumbUrl ?? '',
        fit: BoxFit.contain,
      ),
    );

    if (compact) {
      coverImage = Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  // Colors.transparent,
                  if (showTags) Colors.black.withOpacity(0.5),
                  if (showTags)
                    Colors.black.withOpacity(0.7)
                  else
                    Colors.black.withOpacity(0.55),
                ],
              ).createShader(rect);
            },
            blendMode: BlendMode.darken,
            child: coverImage,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              SizedBox(
                height: 20,
                child: SimpleTagsView(
                  simpleTags: gallery.simpleTags,
                  tagLayoutOnItem: TagLayoutOnItem.singleLine,
                  color: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                alignment: Alignment.bottomCenter,
                child: Text(
                  (gallery.title.englishTitle ?? '').prettyTitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Hero(
      tag: '${tabTag ?? ''}_${gallery.thumbUrl}',
      child: AspectRatio(
        aspectRatio: (gallery.images.thumbnail.imgWidth ?? 300) /
            (gallery.images.thumbnail.imgHeight ?? 400),
        child: Card(
          margin: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          child: coverImage,
        ),
      ),
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
