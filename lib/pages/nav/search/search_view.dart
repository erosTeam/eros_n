import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/component/widget/buttons.dart';
import 'package:eros_n/component/widget/pinch_grid_zoom.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/pages/nav/search/search_history_provider.dart';
import 'package:eros_n/pages/nav/search/search_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:sliver_tools/sliver_tools.dart';

@RoutePage()
class SearchPage extends StatefulHookConsumerWidget {
  const SearchPage({super.key, required this.query});
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
      // Defer search() until after the build phase finishes; otherwise
      // SearchHistory.add() inside it would synchronously update a provider
      // during widget mount and Riverpod would throw
      // "Tried to modify a provider while the widget tree was building".
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          searchProviderNoti.search();
        }
      });
    }

    final keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    logger.t(
      'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}',
    );

    // Subscribe
    keyboardSubscription = keyboardVisibilityController.onChange.listen((
      bool visible,
    ) {
      logger.t('Keyboard visibility update. Is visible: $visible');
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

    final liquidGlass = ref.watch(
      settingsProvider.select((s) => s.liquidGlass),
    );
    return Scaffold(
      floatingActionButton: liquidGlass
          ? GlassIconButton(
              icon: Icon(
                Icons.search,
                color: glassIconColor(context),
              ),
              onPressed: () {
                searchProviderNoti.searchFocusNode.unfocus();
                searchProviderNoti.search();
              },
              size: kGlassFabSize,
              settings: glassButtonSettings(context),
            )
          : FloatingActionButton(
              onPressed: () {
                searchProviderNoti.searchFocusNode.unfocus();
                searchProviderNoti.search();
              },
              child: const Icon(Icons.search),
            ),
      body: PinchGridZoom(
        child: RefreshIndicator(
          onRefresh: () => searchProviderNoti.reloadData(),
          edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
          child: CustomScrollView(
            // cacheExtent: 500,
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              Builder(
                builder: (context) {
                  final glass = isLiquidGlass(ref);
                  return SliverAppBar(
                    leading: const SizedBox(),
                    leadingWidth: 0,
                    title: buildSearchBar(),
                    backgroundColor: glass
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.surface,
                    flexibleSpace: glass ? glassFlexibleSpace(context) : null,
                    elevation: glass ? 0 : null,
                    scrolledUnderElevation: glass ? 0 : null,
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: SizedBox(height: 0),
                    ),
                    floating: true,
                    pinned: true,
                  );
                },
              ),
              SliverToBoxAdapter(
                child: ListenableBuilder(
                  listenable: searchProviderNoti.searchController,
                  builder: (context, _) {
                    final isEmpty = searchProviderNoti.searchController.text
                        .trim()
                        .isEmpty;
                    if (!isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return _SearchHistoryPanel(
                      onTap: (q) {
                        searchProviderNoti
                            .searchController
                            .value = TextEditingValue(
                          text: q,
                          selection: TextSelection.collapsed(offset: q.length),
                        );
                        searchProviderNoti.searchFocusNode.unfocus();
                        searchProviderNoti.search();
                      },
                    );
                  },
                ),
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
          controller: searchProviderNoti.searchController,
          focusNode: searchProviderNoti.searchFocusNode,
          builder: (context, controller, focusNode) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                filled: true,
                contentPadding: const EdgeInsets.only(),
                isDense: false,
                hintText: L10n.of(context).search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: getPrefixIcon(context),
                suffixIcon: ListenableBuilder(
                  // Drive the suffix area off the actual text + focus state
                  // instead of keyboard visibility, which is unreliable on
                  // tablets / desktops / split-screen and on platforms where
                  // the keyboard plugin doesn't report changes.
                  listenable: Listenable.merge([
                    searchProviderNoti.searchController,
                    searchProviderNoti.searchFocusNode,
                  ]),
                  builder: (context, _) {
                    final hasText = searchProviderNoti.searchController.text
                        .trim()
                        .isNotEmpty;
                    final hasFocus =
                        searchProviderNoti.searchFocusNode.hasFocus;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (hasText && hasFocus)
                          IconButton(
                            icon: const Icon(Icons.clear),
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              searchProviderNoti.searchController.clear();
                            },
                          ),
                        if (!hasFocus)
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
                            initValue: ref.watch(
                              settingsProvider.select(
                                (s) => s.searchLanguagesFilter,
                              ),
                            ),
                          ),
                        if (!hasFocus)
                          SortPopupButton(
                            onSelected: (value) async {
                              if (value ==
                                  ref.read(settingsProvider).searchSort) {
                                return;
                              }

                              ref
                                  .read(settingsProvider.notifier)
                                  .setSearchSort(value);

                              await searchProviderNoti.reloadData();
                            },
                            initValue: ref.watch(
                              settingsProvider.select((s) => s.searchSort),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              onChanged: (value) {},
              onEditingComplete: () {
                focusNode.unfocus();
                searchProviderNoti.search();
              },
              onSubmitted: (value) {
                focusNode.unfocus();
                searchProviderNoti.search();
              },
            );
          },
          decorationBuilder: (context, child) {
            return Material(
              type: MaterialType.card,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shadowColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(28),
              clipBehavior: Clip.antiAlias,
              child: child,
            );
          },
          suggestionsCallback: (pattern) async {
            final currQryText = pattern.split(RegExp(r'[ ;"]')).last;

            if (currQryText.isEmpty) {
              return Future.value([]);
            }
            logger.d('suggestionsCallback: $currQryText');
            try {
              return await _suggestTags(currQryText);
            } catch (e) {
              // Don't let a transient DB error keep the dropdown spinning.
              logger.w('suggestionsCallback error (DB not ready?): $e');
              return const [];
            }
          },
          itemBuilder: (BuildContext context, itemData) {
            return ListTile(
              title: Text(
                '${singularizeTagType(itemData.type ?? '')}:${itemData.name}',
              ),
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
          emptyBuilder: (context) {
            return const SizedBox();
          },
          hideOnEmpty: true,
          onSelected: (suggestion) {
            searchProviderNoti.appendNhTagQuery(suggestion, search: true);
          },
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

  // Cache of online autocomplete results keyed by query string.
  // Avoids hitting the API repeatedly while the user types within the
  // same session (the local DB already covers most cases after the first
  // online call thanks to learnNhTags).
  final Map<String, List<NhTag>> _onlineSuggestionCache = {};

  /// Suggestion strategy:
  /// 1. Query the local NhTag cache first (zero-latency, works offline).
  ///    `findNhTagContains` matches both the English `name` and the
  ///    cached `translateName`, so previously-learned tags can be found
  ///    via Chinese input directly.
  /// 2. For CJK input that has no online equivalent (the upstream API
  ///    only accepts English), translate via the EhTagTranslation
  ///    database (`TagTranslate`) and surface those candidates as
  ///    `NhTag` entries. The English `name` from a translation hit then
  ///    seeds an online lookup so we can fetch the real tag id / count.
  /// 3. If results are still sparse (< 8 entries), fall back to
  ///    nhentai's `/api/v2/tags/search` endpoint with the raw query and
  ///    merge the results.
  /// 4. Persist online results into the local cache so subsequent
  ///    queries become offline-capable.
  Future<List<NhTag>> _suggestTags(String query) async {
    final local = await objectBoxHelper.findNhTagContains(query, 200);

    // CJK input cannot be sent to nhentai's API verbatim, so resolve it
    // to English candidates via TagTranslate first.
    final translated = _hasCjk(query)
        ? await _resolveCjkCandidates(query, local)
        : const <NhTag>[];

    final base = _mergeNhTags(local, translated);
    if (base.length >= 8) {
      return base;
    }

    final cached = _onlineSuggestionCache[query];
    if (cached != null) {
      return _mergeNhTags(base, cached);
    }

    // For pure CJK queries the upstream API would just 404, so skip it
    // unless the query also contains ASCII characters.
    final shouldQueryOnline = !_isPureCjk(query);

    try {
      final online = shouldQueryOnline
          ? await nhAutocomplete(name: query)
          : const <Tag>[];
      if (online.isEmpty) {
        _onlineSuggestionCache[query] = const [];
        return base;
      }

      // Persist into local cache (also fills translateName via TagTranslate).
      unawaited(objectBoxHelper.learnNhTags(online));

      final converted = online
          .where((t) => t.id != null && t.id != 0 && (t.name ?? '').isNotEmpty)
          .map(
            (t) => NhTag(
              id: t.id!,
              name: t.name,
              type: singularizeTagType(t.type ?? ''),
              count: t.count,
              translateName: t.translatedName,
              lastUseTime: 0,
            ),
          )
          .toList();
      _onlineSuggestionCache[query] = converted;
      return _mergeNhTags(base, converted);
    } catch (e) {
      logger.w('online autocomplete failed for "$query": $e');
      return base;
    }
  }

  static final RegExp _cjkRegex = RegExp(
    r'[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff\uff66-\uff9f]',
  );
  static final RegExp _asciiAlnumRegex = RegExp(r'[A-Za-z0-9]');

  bool _hasCjk(String s) => _cjkRegex.hasMatch(s);
  bool _isPureCjk(String s) => _hasCjk(s) && !_asciiAlnumRegex.hasMatch(s);

  /// Look up the EhTagTranslation database for entries whose name or
  /// translated name contains [query] (typically a CJK substring) and
  /// expose them as `NhTag` candidates. Each hit also kicks an online
  /// lookup against the resolved English name so we can populate the
  /// real nhentai tag id / count and have it cached for next time.
  Future<List<NhTag>> _resolveCjkCandidates(
    String query,
    List<NhTag> local,
  ) async {
    final translates = await objectBoxHelper.findTagTranslateContains(
      query,
      30,
    );
    if (translates.isEmpty) {
      return const [];
    }

    final knownPairs = <String>{
      for (final t in local) '${t.type ?? ''}::${(t.name ?? '').toLowerCase()}',
    };

    final candidates = <NhTag>[];
    final onlineSeeds = <_TagSeed>[];
    // Use a stable negative id derived from the TagTranslate id so the
    // dedup key in `_mergeNhTags` does not collide with real NhTag ids
    // (which are positive). Once the online lookup completes the entry
    // will be replaced with the real id by `learnNhTags`.
    for (final tt in translates) {
      final ns = tt.namespace;
      final name = tt.name;
      if (ns.isEmpty || name.isEmpty) {
        continue;
      }
      final type = singularizeTagType(ns);
      final key = '$type::${name.toLowerCase()}';
      if (knownPairs.contains(key)) {
        continue;
      }
      knownPairs.add(key);
      candidates.add(
        NhTag(
          id: -tt.id,
          name: name,
          type: type,
          translateName: tt.translateNameNotMD,
          lastUseTime: 0,
        ),
      );
      onlineSeeds.add(_TagSeed(name: name, type: type));
    }

    // Fire-and-forget: enrich local cache with real ids/counts so the
    // next query (or the subsequent search) lands directly on a real
    // NhTag entry. Cap the fan-out to keep network use reasonable.
    if (onlineSeeds.isNotEmpty) {
      unawaited(_enrichSeeds(onlineSeeds.take(5).toList()));
    }
    return candidates;
  }

  Future<void> _enrichSeeds(List<_TagSeed> seeds) async {
    for (final seed in seeds) {
      try {
        final online = await nhAutocomplete(
          name: seed.name,
          typeName: seed.type,
        );
        if (online.isNotEmpty) {
          await objectBoxHelper.learnNhTags(online);
        }
      } catch (e) {
        logger.t('enrich seed "${seed.name}" (${seed.type}) failed: $e');
      }
    }
  }

  List<NhTag> _mergeNhTags(List<NhTag> a, List<NhTag> b) {
    // Dedup by (type, lowercase name) so a synthetic CJK candidate
    // (negative id) collapses into the matching real NhTag entry.
    final seen = <String>{};
    final out = <NhTag>[];
    for (final t in [...a, ...b]) {
      final key = '${t.type ?? ''}::${(t.name ?? '').toLowerCase()}';
      if (seen.add(key)) {
        out.add(t);
      }
    }
    return out;
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

class _TagSeed {
  const _TagSeed({required this.name, required this.type});
  final String name;
  final String type;
}

class _SearchHistoryPanel extends ConsumerWidget {
  const _SearchHistoryPanel({required this.onTap});

  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(searchHistoryProvider);
    if (history.isEmpty) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                L10n.of(context).recent_searches,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                icon: const Icon(Icons.delete_sweep_outlined, size: 18),
                label: Text(L10n.of(context).clear_history),
                onPressed: () => _confirmClear(context, ref),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final entry in history)
                  InputChip(
                    label: Text(entry.query),
                    onPressed: () => onTap(entry.query),
                    onDeleted: () => ref
                        .read(searchHistoryProvider.notifier)
                        .remove(entry.query),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10n.of(ctx).clear_history),
        content: Text(L10n.of(ctx).clear_search_history_tip),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(L10n.of(ctx).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(L10n.of(ctx).ok),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(searchHistoryProvider.notifier).clear();
    }
  }
}

class SearchListView extends HookConsumerWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Gallery> galleryList = ref.watch(
      searchGallerysProvider(currentSearchDepth),
    );
    final state = ref.watch(searchProvider(currentSearchDepth));

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
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
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(searchProvider(currentSearchDepth));
              return EndIndicator(loadStatus: state.status);
            },
          ),
        ],
      ),
    );
  }
}
