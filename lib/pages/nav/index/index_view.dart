import 'package:eros_n/pages/nav/favorite/favorite_view.dart';
import 'package:eros_n/pages/nav/front/front_view.dart';
import 'package:eros_n/pages/nav/history/history_view.dart';
import 'package:eros_n/pages/nav/more/more_view.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'index_provider.dart';

class IndexPage extends HookConsumerWidget {
  IndexPage({super.key});

  final pages = <Widget>[
    const FrontPage(),
    const FavoritePage(),
    const HistoryPage(),
    const MorePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(indexProvider);
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      body: PageView(
        controller: state.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
        onPageChanged: (index) {
          ref.read(indexProvider.notifier).setIndex(index);
        },
      ),
      bottomNavigationBar: AnimatedContainer(
        // height:
        //     state.hideNavigationBar ? 0 : 64 + context.mediaQueryPadding.bottom,
        height:
            state.hideNavigationBar ? 0 : 80 + context.mediaQueryPadding.bottom,
        duration: 300.milliseconds,
        curve: Curves.ease,
        child: NavigationBar(
          selectedIndex: state.selectedIndex,
          // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          // height: 48,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          onDestinationSelected: (index) {
            ref.read(indexProvider.notifier).setIndex(index, jumpToPage: true);
          },
        ),
      ),
    );
  }
}
