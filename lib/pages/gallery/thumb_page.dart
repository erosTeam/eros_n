import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
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

class ThumbsView extends HookConsumerWidget {
  const ThumbsView({super.key, required this.gid, this.enableHero = false});

  final int gid;
  final bool enableHero;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.t('build thumbs $gid');
    // final pages = ref.watch(galleryProvider(gid).select((g) => g.pages));

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
        .map((image) => (image.imgWidth ?? 300) / (image.imgHeight ?? 400))
        .min;
    // logger.d('minRatio: $minRatio');
    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: 16 + context.mediaQueryPadding.bottom,
        left: 8,
        right: 8,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          final thumb = pages[index];
          // Prefer the URL parsed off the page (handles compound suffixes
          // like `2t.jpg.webp`); fall back to a synthesized URL when only
          // the legacy `type` is available.
          final ext = NHConst.extMap[thumb.type] ?? 'webp';
          final imageUrl =
              thumb.imageUrl ??
              'https://t.nhentai.net/galleries/$mediaId/${index + 1}t.$ext';
          final aspect =
              (thumb.imgWidth != null &&
                  thumb.imgHeight != null &&
                  thumb.imgHeight! > 0)
              ? thumb.imgWidth! / thumb.imgHeight!
              : 3 / 4;
          return GestureDetector(
            onTap: () {
              RouteUtil.goRead(
                context,
                ref,
                index: index,
                heroTagPrefix: kHeroTagPrefix,
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: aspect,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Hero(
                          tag: '$kHeroTagPrefix${gid}_$index',
                          child: ErosCachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('${index + 1}'),
              ],
            ),
          );
        }, childCount: pages.length),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150.0,
          mainAxisSpacing: 8,
          crossAxisSpacing: 4,
          childAspectRatio: minRatio - 0.2,
        ),
      ),
    );
  }
}
