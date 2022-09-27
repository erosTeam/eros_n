import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/nav/history/history_provider.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPage extends StatefulHookConsumerWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // ref.read(favoriteProvider.notifier).loadData();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      ref.read(indexProvider.notifier).hideNavigationBar();
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      ref.read(indexProvider.notifier).showNavigationBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('History'),
      // ),
      body: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const SliverAppBar(
            title: Text('History'),
            floating: true,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SizedBox(height: 0),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final historys = ref.watch(historyGallerysProvider);
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final history = historys[index];
                  return InkWell(
                    onTap: () {
                      final gallery = Gallery(
                        gid: '${history.gid}',
                        imageKey: history.imageKey,
                        title: history.title,
                        thumbUrl: history.thumbUrl,
                        thumbWidth: history.thumbWidth,
                        thumbHeight: history.thumbHeight,
                      );
                      ref
                          .read(galleryProvider('${history.gid}').notifier)
                          .initFromGallery(gallery);
                      erosRouter.push(GalleryRoute(gid: gallery.gid));
                    },
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ErosCachedNetworkImage(
                              imageUrl: history.thumbUrl ?? '',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(history.title ?? '',
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(historyProvider.notifier)
                                    .removeHistory(history.gid);
                              },
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                              )),
                        ],
                      ),
                    ),
                  );
                },
                childCount: historys.length,
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
