import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/receive_sharing_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/nav/favorite/favorite_view.dart';
import 'package:eros_n/pages/nav/front/front_view.dart';
import 'package:eros_n/pages/nav/history/history_view.dart';
import 'package:eros_n/pages/nav/more/more_view.dart';
import 'package:eros_n/pages/nav/search/search_view.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/logger.dart';
import 'index_provider.dart';

class IndexPage extends StatefulHookConsumerWidget {
  const IndexPage({super.key});

  @override
  ConsumerState<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends ConsumerState<IndexPage> {
  final pages = <Widget>[
    const FrontPage(),
    const FavoritePage(),
    const SearchPage(query: ''),
    const HistoryPage(),
    const MorePage(),
  ];

  @override
  void initState() {
    logger.d('initState');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      EasyDebounce.debounce(
        'listenReceiveSharing',
        const Duration(milliseconds: 500),
        () =>
            ref.read(receiveSharingProvider.notifier).listenReceiveSharing(ref),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(indexProvider);

    return Scaffold(
      body: PageView(
        controller: state.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
        onPageChanged: (index) {
          ref.read(indexProvider.notifier).setIndex(index, context: context);
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
              icon: const Icon(Icons.search),
              label: L10n.of(context).search,
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
