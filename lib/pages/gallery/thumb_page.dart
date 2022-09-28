import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThumbPage extends HookConsumerWidget {
  const ThumbPage({
    Key? key,
    this.gid,
  }) : super(key: key);
  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thumbs'),
      ),
      body: Scrollbar(
        controller: ScrollController(),
        child: CustomScrollView(
          slivers: [
            ThumbsView(
              gid: gid,
            ),
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
