import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/enum.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/nav/front/front_provider.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'search_provider.dart';

class SearchPage extends StatefulHookConsumerWidget {
  const SearchPage({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  double lastScrollOffset = 0;
  String query = '';

  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);

  SearchNotifier get searchProviderNoti => ref.read(searchProvider.notifier);

  @override
  void initState() {
    super.initState();
    query = widget.query;
    searchProviderNoti.searchController.value = TextEditingValue(text: query);
    indexProviderNoti.addScrollController(scrollController);
    // searchProviderNoti.loadData();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => searchProviderNoti.reloadData(),
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: SizeCacheWidget(
          child: CustomScrollView(
            cacheExtent: 500,
            controller: scrollController,
            slivers: [
              SliverAppBar(
                title: TextField(
                  controller: searchProviderNoti.searchController,
                  focusNode: searchProviderNoti.searchFocusNode,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    hintText: L10n.of(context).search,
                    // border: InputBorder.none,
                    // contentPadding: EdgeInsets.all(16),
                  ),
                  textInputAction: TextInputAction.search,
                  onEditingComplete: () {
                    //focusNode
                    searchProviderNoti.searchFocusNode.unfocus();
                    searchProviderNoti.search();
                  },
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(height: 0),
                ),
                actions: [
                  // IconButton(
                  //   icon: const Icon(Icons.search),
                  //   onPressed: () {
                  //     searchProviderNoti.searchFocusNode.unfocus();
                  //     searchProviderNoti.search();
                  //   },
                  // ),
                  PopupMenuButton<SearchSort>(
                    onSelected: (value) {
                      ref.read(settingsProvider.notifier).setSearchSort(value);
                    },
                    icon: const Icon(Icons.sort),
                    offset: const Offset(0, kToolbarHeight),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: SearchSort.recent,
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: ref.watch(settingsProvider).searchSort ==
                                      SearchSort.recent
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            SizedBox(width: 8),
                            Text(L10n.of(context).recent),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: SearchSort.popularToday,
                        child: Row(
                          children: [
                            Icon(
                              Icons.whatshot,
                              color: ref.watch(settingsProvider).searchSort ==
                                      SearchSort.popularToday
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            SizedBox(width: 8),
                            Text(L10n.of(context).popular_today),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: SearchSort.popularWeek,
                        child: Row(
                          children: [
                            Icon(
                              Icons.whatshot,
                              color: ref.watch(settingsProvider).searchSort ==
                                  SearchSort.popularWeek
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            SizedBox(width: 8),
                            Text(L10n.of(context).popular_week),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: SearchSort.popular,
                        child: Row(
                          children: [
                            Icon(
                              Icons.whatshot,
                              color: ref.watch(settingsProvider).searchSort ==
                                  SearchSort.popular
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            SizedBox(width: 8),
                            Text(L10n.of(context).popular_all),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                floating: true,
                pinned: true,
              ),
              const SearchListView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

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
}

class SearchListView extends HookConsumerWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Gallery> galleryList = ref.watch(searchGallerysProvider);
    final state = ref.watch(searchProvider);

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return MultiSliver(
      children: [
        GalleryWaterfallFlowView(
          gallerys: galleryList,
          lastComplete: () => ref.read(searchProvider.notifier).loadNextPage(),
          keepPosition: true,
          maxPage: state.maxPage,
        ),
        Consumer(builder: (context, ref, _) {
          final state = ref.watch(searchProvider);
          return EndIndicator(
            loadStatus: state.status,
          );
        }),
      ],
    );
  }
}
