import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../index/index_provider.dart';
import 'favorite_provider.dart';

class FavoritePage extends StatefulHookConsumerWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(favoriteProvider.notifier).loadData();
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
    final isUserLoggedIn =
        ref.watch(userProvider.select((user) => user.isLogin));
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: isUserLoggedIn
            ? ref.read(favoriteProvider.notifier).reloadData
            : () async {},
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverAppBar(
              title: Text('Favorite'),
              floating: true,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(height: 0),
              ),
            ),
            if (isUserLoggedIn)
              MultiSliver(
                children: [
                  const FavoriteListView(),
                  Consumer(builder: (context, ref, _) {
                    final state = ref.watch(favoriteProvider);
                    return EndIndicator(
                      loadStatus: state.status,
                    );
                  }),
                ],
              )
            else
              SliverFillRemaining(
                child: Center(
                  child: Text(
                    'Please login first',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FavoriteListView extends HookConsumerWidget {
  const FavoriteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Gallery> galleryList = ref.watch(favoriteGallerysProvider);
    final state = ref.watch(favoriteProvider);
    logger
        .d('FavoriteListView build ,galleryList.length: ${galleryList.length}');

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return GalleryWaterfallFlowView(
      gallerys: galleryList,
      lastComplete: () => ref.read(favoriteProvider.notifier).loadNextPage(),
      keepPosition: true,
    );
  }
}
