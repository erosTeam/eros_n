import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/component/widget/buttons.dart';
import 'package:eros_n/component/widget/pinch_grid_zoom.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/nav/front/front_provider.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:sliver_tools/sliver_tools.dart';

LiquidGlassSettings _glassButtonSettings(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return LiquidGlassSettings(
    blur: 10,
    thickness: 20,
    lightIntensity: 0.05,
    glassColor: isDark
        ? const Color.fromARGB(80, 60, 60, 60)
        : const Color.fromARGB(80, 255, 255, 255),
  );
}

@RoutePage()
class FrontPage extends StatefulHookConsumerWidget {
  const FrontPage({super.key});

  @override
  ConsumerState<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends ConsumerState<FrontPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  double lastScrollOffset = 0;

  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);

  @override
  void initState() {
    super.initState();
    indexProviderNoti.addScrollController(scrollController);
    ref.read(frontProvider.notifier).loadData();
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
    logger.t('FrontPage build');

    super.build(context);
    logger.t('${MediaQuery.of(context).padding.top}');
    logger.t('${context.width}');
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: Scaffold(
        body: PinchGridZoom(
        child: RefreshIndicator(
          onRefresh: () => ref.read(frontProvider.notifier).reloadData(),
          edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
          child: CustomScrollView(
          controller: scrollController,
          // cacheExtent: 500,
          physics: const ClampingScrollPhysics(),
          slivers: [
            Builder(
              builder: (context) {
                final glass = isLiquidGlass(ref);
                return SliverAppBar(
                  floating: true,
                  pinned: true,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: SizedBox(height: 0),
                  ),
                  toolbarHeight: 0,
                  elevation: 0,
                  scrolledUnderElevation: glass ? 0 : null,
                  backgroundColor: glass ? Colors.transparent : null,
                  flexibleSpace: glass ? glassFlexibleSpace(context) : null,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness:
                        Theme.of(context).brightness == Brightness.dark
                            ? Brightness.light
                            : Brightness.dark,
                  ),
                );
              },
            ),
            PopularListView(scrollController: scrollController),
            SliverGalleryListView(scrollController: scrollController),
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(frontProvider);
                return EndIndicator(loadStatus: state.status);
              },
            ),
          ],
        ),
        ),
      ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class SliverGalleryListView extends HookConsumerWidget {
  const SliverGalleryListView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortMap = <SearchSort, String>{
      SearchSort.recent: L10n.of(context).recent,
      SearchSort.popularToday: L10n.of(context).popular_today,
      SearchSort.popularWeek: L10n.of(context).popular_week,
      SearchSort.popularMonth: L10n.of(context).popular_month,
      SearchSort.popular: L10n.of(context).popular,
    };

    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: MultiSliver(
        pushPinnedChildren: true,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final searchSortOnFrontPage = ref.watch(
                settingsProvider.select((s) => s.searchSortOnFrontPage),
              );
              final frontLanguagesFilter = ref.watch(
                settingsProvider.select((s) => s.frontLanguagesFilter),
              );
              return SliverPinnedHeader(
                child: GestureDetector(
                  onTap: () {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: ListenableBuilder(
                    listenable: scrollController,
                    builder: (context, _) {
                      final glass = isLiquidGlass(ref);
                      final pinned = glass &&
                          scrollController.hasClients &&
                          scrollController.offset > 250;

                      final buttons = <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            context.router.push(SearchRoute(query: ''));
                          },
                        ),
                        LanguagesFilterPopupButton(
                          onSelected: (LanguagesFilter value) async {
                            if (value ==
                                ref
                                    .read(settingsProvider)
                                    .frontLanguagesFilter) {
                              return;
                            }
                            ref
                                .read(settingsProvider.notifier)
                                .setFrontLanguagesFilter(value);
                            await ref
                                .read(frontProvider.notifier)
                                .reloadData();
                          },
                          initValue: frontLanguagesFilter,
                        ),
                        SortPopupButton(
                          onSelected: (value) async {
                            if (value == searchSortOnFrontPage) {
                              return;
                            }
                            ref
                                .read(settingsProvider.notifier)
                                .setSearchSortOnFrontPage(value);
                            await ref
                                .read(frontProvider.notifier)
                                .reloadData();
                          },
                          initValue: searchSortOnFrontPage,
                        ),
                      ];

                      final isDark =
                          Theme.of(context).brightness == Brightness.dark;
                      final iconColor =
                          isDark ? Colors.white : Colors.black;

                      final sortText = sortMap[searchSortOnFrontPage] ??
                          L10n.of(context).recent;

                      const dur = Duration(milliseconds: 300);
                      const curve = Curves.easeInOut;

                      final bgColor =
                          Theme.of(context).scaffoldBackgroundColor;
                      return AnimatedContainer(
                        duration: dur,
                        curve: curve,
                        height: kToolbarHeight,
                        padding: EdgeInsets.symmetric(
                            horizontal: pinned ? 8 : 16),
                        color: pinned
                            ? bgColor.withValues(alpha: 0)
                            : bgColor,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            // Normal state
                            AnimatedOpacity(
                              opacity: pinned ? 0.0 : 1.0,
                              duration: dur,
                              child: IgnorePointer(
                                ignoring: pinned,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          sortText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                    ),
                                    ...buttons,
                                  ],
                                ),
                              ),
                            ),
                            // Pinned glass state
                            AnimatedOpacity(
                              opacity: pinned ? 1.0 : 0.0,
                              duration: dur,
                              child: IgnorePointer(
                                ignoring: !pinned,
                                child: IntrinsicHeight(
                                  child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    GlassContainer(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      shape:
                                          const LiquidRoundedSuperellipse(
                                              borderRadius: 999),
                                      settings:
                                          _glassButtonSettings(context),
                                      child: Center(
                                        child: Text(
                                          sortText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(height: 1.0),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GlassContainer(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      shape:
                                          const LiquidRoundedSuperellipse(
                                              borderRadius: 999),
                                      settings:
                                          _glassButtonSettings(context),
                                      child: IconTheme(
                                        data: IconThemeData(
                                            size: 22, color: iconColor),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: buttons,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          const GalleryListView(),
        ],
      ),
    );
  }
}

class PopularListView extends ConsumerWidget {
  const PopularListView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularList = ref.watch(popularProvider);
    final glass = isLiquidGlass(ref);
    return SliverSafeArea(
      top: false,
      bottom: false,
      sliver: MultiSliver(
        pushPinnedChildren: true,
        children: [
          SliverPinnedHeader(
            child: ListenableBuilder(
              listenable: scrollController,
              builder: (context, _) {
                final pinned = glass &&
                    scrollController.hasClients &&
                    scrollController.offset > 0;

                const dur = Duration(milliseconds: 300);
                final bgColor = Theme.of(context).scaffoldBackgroundColor;
                return AnimatedContainer(
                  duration: dur,
                  curve: Curves.easeInOut,
                  height: kToolbarHeight,
                  padding: EdgeInsets.symmetric(
                      horizontal: pinned ? 8 : 16),
                  color: pinned
                      ? bgColor.withValues(alpha: 0)
                      : bgColor,
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      AnimatedOpacity(
                        opacity: pinned ? 0.0 : 1.0,
                        duration: dur,
                        child: Text(
                          L10n.of(context).popular,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: pinned ? 1.0 : 0.0,
                        duration: dur,
                        child: IgnorePointer(
                          ignoring: !pinned,
                          child: UnconstrainedBox(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 48,
                              child: GlassContainer(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                shape: const LiquidRoundedSuperellipse(
                                    borderRadius: 999),
                                settings: _glassButtonSettings(context),
                                child: Center(
                                  child: Text(
                                    L10n.of(context).popular,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(height: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final gallery = popularList[index];
                final card = SizedBox(
                  width: 160,
                  child: Hero(
                    tag: '${NHRoutes.front}_popular_${gallery.thumbUrl}',
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        foregroundDecoration:
                            (gallery.languageCode == 'ja' ||
                                gallery.languageCode == null)
                            ? null
                            : RotatedCornerDecoration.withColor(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.8),
                                badgeSize: const Size(38, 28),
                                // geometry:
                                //     const BadgeGeometry(width: 38, height: 28),
                                textSpan: TextSpan(
                                  text:
                                      gallery.languageCode?.toUpperCase() ?? '',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          fit: StackFit.expand,
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.black54,
                                  ],
                                ).createShader(
                                  Rect.fromLTRB(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                );
                              },
                              blendMode: BlendMode.darken,
                              child: CoverImg(
                                imgUrl: gallery.thumbUrl ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (gallery.title.englishTitle ?? '').prettyTitle,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.8,
                                          ),
                                          offset: const Offset(0, 0),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );

                return GestureDetector(
                  onTap: () {
                    // popular
                    RouteUtil.goGallery(
                      ref,
                      gallery,
                      heroTag: '${NHRoutes.front}_popular',
                    );
                    // RouteUtil.goGalleryByGid(ref, gallery.gid);
                  },
                  child: card,
                );
              },
              itemCount: popularList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryListView extends HookConsumerWidget {
  const GalleryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.t('GalleryListView build');
    final List<Gallery> galleryList = ref.watch(gallerysProvider);
    final state = ref.watch(frontProvider);

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return GallerySliverList(
      gallerys: galleryList,
      lastComplete: () => ref.read(frontProvider.notifier).loadNextPage(),
      keepPosition: true,
      maxPage: state.maxPage,
      tabTag: NHRoutes.front,
    );
  }
}
