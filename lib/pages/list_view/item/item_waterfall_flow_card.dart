import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

/// Cache of resolved cover aspect ratios keyed by thumbnail URL. Lets the
/// waterfall card re-use the real ratio across rebuilds and page revisits so
/// we don't snap from a placeholder ratio to the real one every time.
final Map<String, double> _coverAspectCache = <String, double>{};

/// Fallback aspect ratio used while we don't yet know the real cover size.
/// Most nhentai thumbnails are roughly portrait 3:4.
const double _fallbackCoverAspect = 3 / 4;

class ItemWaterfallFlowCard extends HookConsumerWidget {
  const ItemWaterfallFlowCard({
    super.key,
    required this.gallery,
    this.index,
    this.page,
    this.tabTag,
    this.compact = false,
  });

  final Gallery gallery;
  final int? index;
  final int? page;
  final String? tabTag;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTags = ref.watch(settingsProvider.select((s) => s.showTags));

    // Compute the best aspect ratio we currently know for this cover:
    //   1. cache from a previous decode
    //   2. width/height that came in the listing payload (legacy frontend)
    //   3. portrait fallback while loading
    final thumbUrl = gallery.thumbUrl ?? '';
    final imgWidth = gallery.images.thumbnail.imgWidth;
    final imgHeight = gallery.images.thumbnail.imgHeight;
    final initialAspect = _coverAspectCache[thumbUrl] ??
        ((imgWidth != null && imgHeight != null && imgHeight > 0)
            ? imgWidth / imgHeight
            : _fallbackCoverAspect);
    final aspectState = useState<double>(initialAspect);

    // Resolve the real intrinsic image size once and update the aspect ratio
    // so the waterfall card grows/shrinks to fit each cover.
    useEffect(() {
      if (thumbUrl.isEmpty) {
        return null;
      }
      final cached = _coverAspectCache[thumbUrl];
      if (cached != null) {
        if (aspectState.value != cached) {
          aspectState.value = cached;
        }
        return null;
      }
      final provider = getErosImageProvider(thumbUrl);
      final stream = provider.resolve(const ImageConfiguration());
      late ImageStreamListener listener;
      listener = ImageStreamListener(
        (ImageInfo info, bool _) {
          final w = info.image.width;
          final h = info.image.height;
          if (w > 0 && h > 0) {
            final ratio = w / h;
            _coverAspectCache[thumbUrl] = ratio;
            if (aspectState.value != ratio) {
              aspectState.value = ratio;
            }
          }
          stream.removeListener(listener);
        },
        onError: (_, __) => stream.removeListener(listener),
      );
      stream.addListener(listener);
      return () => stream.removeListener(listener);
    }, [thumbUrl]);

    Widget item = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCoverImage(context, compact, showTags, aspectState.value),
        if (!compact) buildTitle(),
        if (!compact) SimpleTagsView(simpleTags: gallery.simpleTags),
      ],
    );

    if (!compact) {
      item = Card(
        // clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(0),
        child: Container(margin: const EdgeInsets.only(bottom: 8), child: item),
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

  Widget buildCoverImage(
    BuildContext context,
    bool compact,
    bool showTags,
    double aspectRatio,
  ) {
    Widget coverImage = Container(
      foregroundDecoration:
          (gallery.languageCode == 'ja' || gallery.languageCode == null)
          ? null
          : RotatedCornerDecoration.withColor(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.8),
              badgeSize: const Size(38, 28),
              textSpan: TextSpan(
                text: gallery.languageCode?.toUpperCase() ?? '',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      child: CoverImg(imgUrl: gallery.thumbUrl ?? '', fit: BoxFit.contain),
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
                  if (showTags) Colors.black.withValues(alpha: 0.5),
                  if (showTags)
                    Colors.black.withValues(alpha: 0.7)
                  else
                    Colors.black.withValues(alpha: 0.55),
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
                        color: Colors.black.withValues(alpha: 0.8),
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
        aspectRatio: aspectRatio,
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
