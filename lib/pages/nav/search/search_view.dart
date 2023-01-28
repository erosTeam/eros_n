import 'dart:async';

import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/buttons.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../utils/logger.dart';
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

  late StreamSubscription<bool> keyboardSubscription;

  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);

  SearchNotifier get searchProviderNoti =>
      ref.read(searchProvider(currentSearchDepth).notifier);

  @override
  void initState() {
    super.initState();
    query = widget.query;
    searchProviderNoti.searchController.value = TextEditingValue(
      text: query,
      selection: TextSelection.collapsed(offset: query.length),
    );
    indexProviderNoti.addScrollController(scrollController);
    scrollController.addListener(_scrollListener);

    if (query.trim().isNotEmpty) {
      logger.d('search query: $query');
      searchProviderNoti.search();
    }

    final keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    logger.v(
        'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      logger.v('Keyboard visibility update. Is visible: $visible');
      if (!visible) {
        searchProviderNoti.searchFocusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
    keyboardSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          searchProviderNoti.searchFocusNode.unfocus();
          searchProviderNoti.search();
        },
        child: const Icon(Icons.search),
      ),
      body: RefreshIndicator(
        onRefresh: () => searchProviderNoti.reloadData(),
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: SizeCacheWidget(
          child: CustomScrollView(
            // cacheExtent: 500,
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                // leadingWidth: 36,
                // leading: getLeading(context),
                leading: const SizedBox(),
                leadingWidth: 0,
                // titleSpacing: 0,
                title: buildSearchBar(),
                backgroundColor: Theme.of(context).colorScheme.surface,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(height: 0),
                ),
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

  Widget buildSearchBar() {
    return StatefulBuilder(
      builder: (context, setState) {
        return TypeAheadField<NhTag>(
          textFieldConfiguration: TextFieldConfiguration(
            controller: searchProviderNoti.searchController,
            focusNode: searchProviderNoti.searchFocusNode,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.surfaceVariant,
              filled: true,
              contentPadding: const EdgeInsets.only(),
              // isCollapsed: true,
              isDense: false,
              hintText: L10n.of(context).search,
              // border: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
              // prefixIcon: const Icon(Icons.search),
              prefixIcon: getPrefixIcon(context),
              suffixIcon: KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (searchProviderNoti.searchController.text
                            .trim()
                            .isNotEmpty &&
                        isKeyboardVisible)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          searchProviderNoti.searchController.clear();
                          setState(() {});
                        },
                      ),
                    if (!isKeyboardVisible)
                      LanguagesFilterPopupButton(
                        onSelected: (LanguagesFilter value) async {
                          if (value ==
                              ref
                                  .read(settingsProvider)
                                  .searchLanguagesFilter) {
                            return;
                          }
                          ref
                              .read(settingsProvider.notifier)
                              .setSearchLanguagesFilter(value);
                          await searchProviderNoti.reloadData();
                        },
                        initValue: ref.watch(settingsProvider
                            .select((s) => s.searchLanguagesFilter)),
                      ),
                    if (!isKeyboardVisible)
                      SortPopupButton(
                        onSelected: (value) async {
                          if (value == ref.read(settingsProvider).searchSort) {
                            return;
                          }

                          ref
                              .read(settingsProvider.notifier)
                              .setSearchSort(value);

                          // reload
                          await searchProviderNoti.reloadData();
                        },
                        initValue: ref.watch(
                            settingsProvider.select((s) => s.searchSort)),
                      ),
                  ],
                );
              }),
            ),
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              setState(() {});
            },
            onEditingComplete: () {
              //focusNode
              searchProviderNoti.searchFocusNode.unfocus();
              searchProviderNoti.search();
            },
            onSubmitted: (value) {
              searchProviderNoti.searchFocusNode.unfocus();
              searchProviderNoti.search();
            },
          ),
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            shadowColor: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            clipBehavior: Clip.antiAlias,
          ),
          suggestionsCallback: (pattern) async {
            final currQryText = pattern.split(RegExp(r'[ ;"]')).last;

            if (currQryText.isEmpty) {
              return Future.value([]);
            }
            logger.d('suggestionsCallback: $currQryText');
            return isarHelper.findNhTagContains(currQryText, 200);
          },
          itemBuilder: (BuildContext context, itemData) {
            return ListTile(
              title: Text('${itemData.type}:${itemData.name}'),
              subtitle: itemData.translateName != null
                  ? Text(itemData.translateName ?? '')
                  : null,
              trailing: IconButton(
                icon: const Icon(Icons.north_west),
                onPressed: () {
                  searchProviderNoti.appendNhTagQuery(itemData);
                },
              ),
            );
          },
          noItemsFoundBuilder: (context) {
            return const SizedBox();
          },
          onSuggestionSelected: (suggestion) {
            searchProviderNoti.appendNhTagQuery(suggestion, search: true);
          },
          // keepSuggestionsOnSuggestionSelected: true,
          // keepSuggestionsOnLoading: false,
          // hideOnEmpty: true,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => currentSearchDepth == 0;

  Widget? getLeading(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    }
    return null;
  }

  Widget? getPrefixIcon(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    } else {
      return const Icon(Icons.search);
    }
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
}

class SearchListView extends HookConsumerWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Gallery> galleryList =
        ref.watch(searchGallerysProvider(currentSearchDepth));
    final state = ref.watch(searchProvider(currentSearchDepth));

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.isLoadError) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.refresh, size: 48),
                onPressed: () {
                  ref
                      .read(searchProvider(currentSearchDepth).notifier)
                      .reloadData();
                },
              ),
              Text(state.errorMessage ?? ''),
            ],
          ),
        ),
      );
    }

    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: MultiSliver(
        children: [
          GallerySliverList(
            gallerys: galleryList,
            lastComplete: () => ref
                .read(searchProvider(currentSearchDepth).notifier)
                .loadNextPage(),
            keepPosition: true,
            maxPage: state.maxPage,
            tabTag: '${NHRoutes.search}_$currentSearchDepth',
          ),
          Consumer(builder: (context, ref, _) {
            final state = ref.watch(searchProvider(currentSearchDepth));
            return EndIndicator(
              loadStatus: state.status,
            );
          }),
        ],
      ),
    );
  }
}
