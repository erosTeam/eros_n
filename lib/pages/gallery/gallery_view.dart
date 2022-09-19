import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    final gallery = ref.watch(galleryProvider(gid));
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ref.read(galleryProvider(gid).notifier).reloadData,
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // title: Text(gallery.title ?? ''),
              floating: true,
              pinned: true,
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(0),
              //   child: SizedBox(height: 0),
              // ),
              expandedHeight: 260,
              flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                expandedTitleScale: 1.2,
                titlePadding: EdgeInsetsDirectional.only(
                  start: 60,
                  // bottom: 16,
                  // start: 16,
                  end: 16,
                  bottom: 16,
                  top: context.mediaQueryPadding.top + 3,
                ),
                // centerTitle: true,
                title: Text(
                  gallery.title ?? '',
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 1.25,
                      ),
                ),
                background: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.primaryContainer,
                        ]).createShader(
                      Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                    );
                  },
                  blendMode: BlendMode.dstOut,
                  child: ErosCachedNetworkImage(
                    imageUrl: gallery.thumbUrl ?? '',
                    fit: BoxFit.cover,
                    color:
                        Theme.of(context).colorScheme.background.withOpacity(0),
                    colorBlendMode: BlendMode.lighten,
                  ),
                ),
                stretchModes: const [
                  // StretchMode.zoomBackground,
                  // StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
            ),
            if (false)
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        height: 180,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              alignment: Alignment.center,
                              child: Hero(
                                tag: gallery.thumbUrl ?? '',
                                child: Card(
                                  margin: const EdgeInsets.all(0),
                                  clipBehavior: Clip.antiAlias,
                                  child: AspectRatio(
                                    aspectRatio: (gallery.thumbWidth ?? 300) /
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  Text(
                                    '#${gallery.gid}',
                                    style: Theme.of(context).textTheme.caption,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
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
    final images = ref.watch(galleryProvider(gid).select((g) => g.images));
    final status = ref.watch(pageStateProvider(gid));

    if (status == PageStatus.loading || images.isEmpty) {
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
                                // placeholder: (context, url) {
                                //   return const Center(
                                //     child: CircularProgressIndicator(),
                                //   );
                                // },
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
            // childAspectRatio: 0.6,
          )),
    );
  }
}
