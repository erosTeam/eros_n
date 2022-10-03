import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:eros_n/component/models/image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/generated/l10n.dart';
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
        title: Text(L10n.of(context).thumbs),
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
    // final pages = ref.watch(galleryProvider(gid).select((g) => g.pages));

    final List<GalleryImage> pages = ref.read(galleryProvider(gid)).images.pages;
    final pageStatus =
        ref.watch(pageStateProvider(gid).select((state) => state.pageStatus));

    if (pageStatus == PageStatus.loading || pages.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final minRatio = pages
        .map((image) => (int.tryParse(image.imgWidth ?? '') ?? 300) / (int.tryParse(image.imgHeight ?? '') ?? 400))
        .min;
    // logger.d('minRatio: $minRatio');
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final image = pages[index];
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
            childCount: pages.length,
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
