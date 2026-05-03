import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/nav/favorite/favorite_view.dart';
import 'package:eros_n/pages/nav/front/front_view.dart';
import 'package:eros_n/pages/nav/history/history_view.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/pages/nav/more/more_view.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

@RoutePage()
class IndexPage extends StatefulHookConsumerWidget {
  const IndexPage({super.key});

  @override
  ConsumerState<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends ConsumerState<IndexPage> {
  final pages = <Widget>[
    const FrontPage(),
    const FavoritePage(),
    const HistoryPage(),
    const MorePage(),
  ];

  Alignment _barAlignment = Alignment.bottomCenter;

  @override
  void initState() {
    logger.d('initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(indexProvider);
    final liquidGlass = ref.watch(
      settingsProvider.select((s) => s.liquidGlass),
    );

    final pageView = PageView(
      controller: state.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: pages,
      onPageChanged: (index) {
        ref.read(indexProvider.notifier).setIndex(index, context: context);
      },
    );

    if (liquidGlass) {
      return Scaffold(
        body: Stack(
          children: [
            Listener(
              onPointerMove: (event) {
                final half = MediaQuery.of(context).size.width / 2;
                final target = event.position.dx < half
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight;
                if (target != _barAlignment) {
                  setState(() => _barAlignment = target);
                }
              },
              child: pageView,
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: AnimatedSlide(
                offset: state.hideNavigationBar
                    ? const Offset(0, 1)
                    : Offset.zero,
                duration: 300.milliseconds,
                curve: Curves.ease,
                child: SafeArea(
                  top: false,
                  child: AnimatedAlign(
                    alignment: _barAlignment,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic,
                    child: Builder(
                      builder: (context) {
                        final isDark =
                            Theme.of(context).brightness == Brightness.dark;
                        final iconColor = isDark ? Colors.white : Colors.black;
                        final primaryColor = Theme.of(
                          context,
                        ).colorScheme.primary;
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 320),
                          child: GlassBottomBar(
                            barHeight: 52,
                            iconSize: 22,
                            iconLabelSpacing: 2,
                            horizontalPadding: 16,
                            verticalPadding: 6,
                            selectedIconColor: primaryColor,
                            unselectedIconColor: iconColor,
                            glassSettings: LiquidGlassSettings(
                              blur: 10,
                              thickness: 30,
                              glassColor: isDark
                                  ? const Color.fromARGB(80, 50, 50, 50)
                                  : const Color.fromARGB(100, 255, 255, 255),
                            ),
                            tabs: [
                              GlassBottomBarTab(
                                label: L10n.of(context).home,
                                icon: const Icon(Icons.home_outlined),
                                activeIcon: const Icon(Icons.home),
                              ),
                              GlassBottomBarTab(
                                label: L10n.of(context).favorites,
                                icon: const Icon(Icons.favorite_outline),
                                activeIcon: const Icon(Icons.favorite),
                              ),
                              GlassBottomBarTab(
                                label: L10n.of(context).history,
                                icon: const Icon(Icons.history),
                              ),
                              GlassBottomBarTab(
                                label: L10n.of(context).more,
                                icon: const Icon(Icons.more_horiz),
                              ),
                            ],
                            selectedIndex: state.selectedIndex,
                            onTabSelected: (index) {
                              ref
                                  .read(indexProvider.notifier)
                                  .setIndex(
                                    index,
                                    context: context,
                                    jumpToPage: true,
                                  );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: pageView,
      bottomNavigationBar: AnimatedContainer(
        height: state.hideNavigationBar
            ? 0
            : 80 + context.mediaQueryPadding.bottom,
        duration: 300.milliseconds,
        curve: Curves.ease,
        child: NavigationBar(
          selectedIndex: state.selectedIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: L10n.of(context).home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_outline),
              selectedIcon: const Icon(Icons.favorite),
              label: L10n.of(context).favorites,
            ),
            NavigationDestination(
              icon: const Icon(Icons.history),
              label: L10n.of(context).history,
            ),
            NavigationDestination(
              icon: const Icon(Icons.more_horiz),
              label: L10n.of(context).more,
            ),
          ],
          onDestinationSelected: (index) {
            ref
                .read(indexProvider.notifier)
                .setIndex(index, context: context, jumpToPage: true);
          },
        ),
      ),
    );
  }
}
