import 'package:eros_n/pages/nav/front/front_view.dart';
import 'package:eros_n/pages/nav/history/history_view.dart';
import 'package:eros_n/pages/nav/more/more_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_provider.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  final pages = <Widget>[
    const FrontPage(),
    HistoryPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      body: PageView(
        controller: state.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: state.selectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
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
          ref.read(homeProvider.notifier).setIndex(index);
        },
      ),
    );
  }
}
