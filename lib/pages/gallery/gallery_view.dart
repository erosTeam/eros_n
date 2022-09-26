import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:eros_n/component/widget/blur_image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/scrolling_fab.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gallery_provider.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({
    super.key,
    this.gid,
  });

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.read(galleryProvider(gid));
    logger.d('build gallery $gid ${gallery.title}');

    late ScrollController scrollController;
    useEffect(() {
      scrollController = ScrollController();
      return scrollController.dispose;
    });

    Widget backGround() {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Theme.of(context).canvasColor,
                // Colors.black,
                Colors.transparent,
                Theme.of(context).canvasColor,
                // Colors.white,
              ]).createShader(
            Rect.fromLTRB(0, 0, bounds.width, bounds.height - 0),
          );
        },
        blendMode: BlendMode.dstOut,
        child: ClipRect(
          child: BlurImage(
            sigma: context.isTablet ? 4 : 2,
            color: Theme.of(context).canvasColor.withOpacity(0.4),
            child: ErosCachedNetworkImage(
              imageUrl: gallery.thumbUrl ?? '',
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
              // color:
              //     Theme.of(context).colorScheme.background.withOpacity(0.5),
              // colorBlendMode: BlendMode.lighten,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.scrolledUnder)) {
            return Theme.of(context).colorScheme.surface;
          }
          return Colors.transparent;
        }),
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: ScrollingFab(
        onPressed: () {
          // ref.read(galleryProvider(gid).notifier).setInitialPage(index);
          context.router.push(ReadRoute(gid: gid));
        },
        scrollController: scrollController,
        label: Text('Read'),
        icon: const Icon(Icons.play_arrow),
      ),
      body: RefreshIndicator(
        onRefresh: ref.read(galleryProvider(gid).notifier).reloadData,
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            if (true)
              SliverToBoxAdapter(
                child: Container(
                  height: 340,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      backGround(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            height: 240,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 封面
                                Container(
                                  width: 140,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: gallery.thumbUrl ?? '',
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      clipBehavior: Clip.antiAlias,
                                      child: AspectRatio(
                                        aspectRatio:
                                            (gallery.thumbWidth ?? 300) /
                                                (gallery.thumbHeight ?? 400),
                                        child: ErosCachedNetworkImage(
                                          imageUrl: gallery.thumbUrl ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 主标题
                                        SelectableText(
                                          gallery.title ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(height: 1.3),
                                          maxLines: 5,
                                          minLines: 1,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        // 画廊id
                                        Text(
                                          '#${gallery.gid}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(height: 8),
                                        // 副标题
                                        Consumer(
                                            builder: (context, ref, child) {
                                          final secondTitle = ref
                                              .watch(galleryProvider(gid))
                                              .secondTitle;
                                          return SelectableText(
                                            secondTitle ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                            textAlign: TextAlign.start,
                                            minLines: 1,
                                            maxLines: 2,
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ThumbsView(gid: gid),
          ],
        ),
      ),
    );
  }
}

class ThumbsView extends HookConsumerWidget {
  const ThumbsView({
    Key? key,
    this.gid,
  }) : super(key: key);

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.v('build thumbs $gid');
    // final images = ref.watch(galleryProvider(gid).select((g) => g.images));

    final images = ref.read(galleryProvider(gid)).images;
    final pageStatus =
        ref.watch(pageStateProvider(gid).select((state) => state.pageStatus));

    if (pageStatus == PageStatus.loading || images.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final minRatio = images
        .map((image) => (image.imgWidth ?? 300) / (image.imgHeight ?? 400))
        .min;
    // logger.d('minRatio: $minRatio');
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final image = images[index];
              return GestureDetector(
                onTap: () {
                  ref.read(galleryProvider(gid).notifier).setInitialPage(index);

                  ///
                  context.router.push(ReadRoute(gid: gid));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: image.thumbWidth! / image.thumbHeight!,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Hero(
                              tag: '${gid}_$index',
                              child: ErosCachedNetworkImage(
                                imageUrl: image.thumbUrl ?? '',
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
            },
            childCount: images.length,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
            childAspectRatio: minRatio - 0.2,
          )),
    );
  }
}
