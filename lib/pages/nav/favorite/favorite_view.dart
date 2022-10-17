import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';
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
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  double lastScrollOffset = 0;

  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);

  @override
  void initState() {
    super.initState();
    indexProviderNoti.addScrollController(scrollController);
    ref.read(favoriteProvider.notifier).loadData();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    const double threshold = 100;
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_lastScrollDirection != ScrollDirection.reverse) {
        lastScrollOffset = scrollController.offset;
      }
      if (scrollController.offset - lastScrollOffset > threshold) {
        indexProviderNoti.hideNavigationBar();
      }
      _lastScrollDirection = ScrollDirection.reverse;
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_lastScrollDirection != ScrollDirection.forward) {
        lastScrollOffset = scrollController.offset;
      }
      if (lastScrollOffset - scrollController.offset > threshold) {
        indexProviderNoti.showNavigationBar();
      }
      _lastScrollDirection = ScrollDirection.forward;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isUserLoggedIn =
        ref.watch(userProvider.select((user) => user.isLogin));
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        onRefresh: isUserLoggedIn
            ? ref.read(favoriteProvider.notifier).reloadData
            : () async {},
        child: SizeCacheWidget(
          child: CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      Text(L10n.of(context).favorites),
                    ],
                  ),
                  onTap: () {
                    scrollController.animateTo(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                floating: true,
                pinned: true,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(height: 0),
                ),
              ),
              if (isUserLoggedIn)
                SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: MultiSliver(
                    children: [
                      const FavoriteListView(),
                      Consumer(builder: (context, ref, _) {
                        final state = ref.watch(favoriteProvider);
                        return EndIndicator(
                          loadStatus: state.status,
                        );
                      }),
                    ],
                  ),
                )
              else
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      L10n.of(context).please_login_first,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
            ],
          ),
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
        .v('FavoriteListView build ,galleryList.length: ${galleryList.length}');

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return GallerySliverList(
      gallerys: galleryList,
      lastComplete: () => ref.read(favoriteProvider.notifier).loadNextPage(),
      keepPosition: true,
      maxPage: state.maxPage,
      tabTag: NHRoutes.favorite,
    );
  }
}
