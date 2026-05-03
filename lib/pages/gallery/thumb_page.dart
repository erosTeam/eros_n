import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/models/image.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/scrolling_fab.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ThumbPage extends HookConsumerWidget {
  const ThumbPage({super.key, required this.gid, this.colorScheme});
  final int gid;
  final ColorScheme? colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();

    return Theme(
      data: Theme.of(context).copyWith(colorScheme: colorScheme),
      child: Builder(
        builder: (context) {
          final glass = isLiquidGlass(ref);
          return Scaffold(
            extendBodyBehindAppBar: glass,
            appBar: adaptiveAppBar(
              context: context,
              ref: ref,
              title: Text(L10n.of(context).thumbs),
            ),
            floatingActionButton: ScrollingFab(
              onPressed: () {
                RouteUtil.goRead(context, ref);
              },
              scrollController: scrollController,
              liquidGlass: glass,
              label: Consumer(
                builder: (context, ref, child) {
                  final currentPageIndex = ref.watch(
                    galleryProvider(gid).select((g) => g.currentPageIndex),
                  );
                  final label = currentPageIndex == 0
                      ? L10n.of(context).read
                      : '${L10n.of(context).resume} ${currentPageIndex + 1}';
                  return Text(label);
                },
              ),
              icon: const Icon(Icons.play_arrow),
            ),
            body: ThumbBody(scrollController: scrollController, gid: gid),
          );
        },
      ),
    );
  }
}

class ThumbBody extends StatelessWidget {
  const ThumbBody({
    super.key,
    required this.scrollController,
    required this.gid,
    this.backGround,
    this.topPadding = 0,
  });

  final ScrollController scrollController;
  final int gid;
  final Widget? backGround;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ?backGround,
        Scrollbar(
          controller: scrollController,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              if (topPadding > 0)
                SliverPadding(padding: EdgeInsets.only(top: topPadding)),
              ThumbsView(gid: gid),
            ],
          ),
        ),
      ],
    );
  }
}

// Fallback aspect ratio used when the computed or full-size ratio is abnormal
// (e.g. extreme webtoon pages with ratio ~0.05).
const kDefaultThumbAspect = 0.65;

// Reasonable bounds for aspect ratio. Values outside this range are considered
// abnormal and fall back to [kDefaultThumbAspect].
// Lower: 0.3 covers even very tall portrait content (1:3.3).
// Upper: 2.0 covers landscape including 16:9 (≈1.78) and slightly wider.
const kMinThumbAspect = 0.3;
const kMaxThumbAspect = 2.0;

double sanitizeThumbAspect(double? raw) {
  if (raw == null || !raw.isFinite || raw <= 0) {
    return kDefaultThumbAspect;
  }
  return (raw >= kMinThumbAspect && raw <= kMaxThumbAspect)
      ? raw
      : kDefaultThumbAspect;
}

class ThumbsView extends HookConsumerWidget {
  const ThumbsView({super.key, required this.gid, this.enableHero = false});

  final int gid;
  final bool enableHero;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.t('build thumbs $gid');

    const kHeroTagPrefix = 'thumb_';

    final List<GalleryImage> pages = ref.watch(
      galleryProvider(gid).select((g) => g.images.pages),
    );
    final mediaId = ref.watch(galleryProvider(gid).select((g) => g.mediaId));
    final pageStatus = ref.watch(
      pageStateProvider(gid).select((state) => state.pageStatus),
    );

    if (pageStatus == PageStatus.loading || pages.isEmpty) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final minRatio = pages
        .map((image) {
          final w = image.imgWidth ?? 300;
          final h = image.imgHeight ?? 400;
          return (h > 0) ? w / h : 3.0 / 4.0;
        })
        .where((r) => r.isFinite && r > 0)
        .fold<double>(3.0 / 4.0, (prev, r) => r < prev ? r : prev);

    final rawChildAspect = minRatio - 0.2;
    final childAspectRatio =
        (rawChildAspect >= kMinThumbAspect && rawChildAspect <= kMaxThumbAspect)
        ? rawChildAspect
        : kDefaultThumbAspect;

    logger.d(
      'ThumbsView gid=$gid minRatio=$minRatio '
      'rawChildAspect=$rawChildAspect childAspectRatio=$childAspectRatio',
    );

    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: 16 + context.mediaQueryPadding.bottom,
        left: 8,
        right: 8,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          final thumb = pages[index];
          final ext = NHConst.extMap[thumb.type] ?? 'webp';
          final imageUrl =
              thumb.imageUrl ??
              'https://t.nhentai.net/galleries/$mediaId/${index + 1}t.$ext';
          final fullSizeAspect =
              (thumb.imgWidth != null &&
                  thumb.imgHeight != null &&
                  thumb.imgHeight! > 0)
              ? thumb.imgWidth! / thumb.imgHeight!
              : null;
          final initialAspect = sanitizeThumbAspect(fullSizeAspect);
          return _ThumbCell(
            imageUrl: imageUrl,
            initialAspect: initialAspect,
            heroTag: '$kHeroTagPrefix${gid}_$index',
            index: index,
            onTap: () => RouteUtil.goRead(
              context,
              ref,
              index: index,
              heroTagPrefix: kHeroTagPrefix,
            ),
          );
        }, childCount: pages.length),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150.0,
          mainAxisSpacing: 8,
          crossAxisSpacing: 4,
          childAspectRatio: childAspectRatio,
        ),
      ),
    );
  }
}

/// Displays a cached thumbnail image whose [AspectRatio] container
/// dynamically updates to the actual decoded thumbnail dimensions after load,
/// smoothly animating the transition.  The [initialAspect] (a sanitized
/// full-size ratio) is used for the placeholder state.
class ThumbAspectImage extends HookWidget {
  const ThumbAspectImage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    required this.initialAspect,
    this.cardMargin = const EdgeInsets.all(4),
  });

  final String imageUrl;
  final String heroTag;
  final double initialAspect;
  final EdgeInsetsGeometry cardMargin;

  @override
  Widget build(BuildContext context) {
    final aspect = useState(initialAspect);

    useEffect(() {
      final provider = getErosImageProvider(imageUrl);
      final stream = provider.resolve(const ImageConfiguration());
      late final ImageStreamListener listener;
      listener = ImageStreamListener((info, _) {
        final w = info.image.width.toDouble();
        final h = info.image.height.toDouble();
        if (h > 0) {
          final actual = w / h;
          if (actual.isFinite && actual > 0) {
            aspect.value = actual;
          }
        }
        stream.removeListener(listener);
      });
      stream.addListener(listener);
      return () => stream.removeListener(listener);
    }, [imageUrl]);

    return TweenAnimationBuilder<double>(
      tween: Tween(end: aspect.value),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) =>
          AspectRatio(aspectRatio: value, child: child),
      child: Card(
        margin: cardMargin,
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: heroTag,
          child: ErosCachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

class _ThumbCell extends StatelessWidget {
  const _ThumbCell({
    required this.imageUrl,
    required this.initialAspect,
    required this.heroTag,
    required this.index,
    required this.onTap,
  });

  final String imageUrl;
  final double initialAspect;
  final String heroTag;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: ThumbAspectImage(
                imageUrl: imageUrl,
                heroTag: heroTag,
                initialAspect: initialAspect,
              ),
            ),
          ),
          Text('${index + 1}'),
        ],
      ),
    );
  }
}
