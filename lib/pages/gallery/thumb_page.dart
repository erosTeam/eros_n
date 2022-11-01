import 'package:collection/collection.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/models/image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/scrolling_fab.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThumbPage extends HookConsumerWidget {
  const ThumbPage({
    Key? key,
    required this.gid,
    this.colorScheme,
  }) : super(key: key);
  final int gid;
  final ColorScheme? colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();

    return Theme(
      data: Theme.of(context).copyWith(colorScheme: colorScheme),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(L10n.of(context).thumbs),
          ),
          floatingActionButton: ScrollingFab(
            onPressed: () {
              RouteUtil.goRead(
                context,
                ref,
              );
            },
            scrollController: scrollController,
            label: Consumer(builder: (context, ref, child) {
              final currentPageIndex = ref.watch(
                  galleryProvider(gid).select((g) => g.currentPageIndex));
              final label = currentPageIndex == 0
                  ? L10n.of(context).read
                  : '${L10n.of(context).resume} ${currentPageIndex + 1}';
              return Text(label);
            }),
            icon: const Icon(Icons.play_arrow),
          ),
          body: Scrollbar(
            controller: scrollController,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                ThumbsView(
                  gid: gid,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ThumbsView extends HookConsumerWidget {
  const ThumbsView({
    Key? key,
    required this.gid,
  }) : super(key: key);

  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.v('build thumbs $gid');
    // final pages = ref.watch(galleryProvider(gid).select((g) => g.pages));

    final List<GalleryImage> pages =
        ref.watch(galleryProvider(gid).select((g) => g.images.pages));
    final mediaId = ref.watch(galleryProvider(gid).select((g) => g.mediaId));
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
        .map((image) => (image.imgWidth ?? 300) / (image.imgHeight ?? 400))
        .min;
    // logger.d('minRatio: $minRatio');
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final thumb = pages[index];
              return GestureDetector(
                onTap: () {
                  RouteUtil.goRead(context, ref, index: index);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: thumb.imgWidth! / thumb.imgHeight!,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Hero(
                              tag: '${gid}_$index',
                              child: ErosCachedNetworkImage(
                                imageUrl:
                                    'https://t.nhentai.net/galleries/$mediaId/${index + 1}t.${NHConst.extMap[thumb.type]}',
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
