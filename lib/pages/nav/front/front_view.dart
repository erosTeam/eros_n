import 'package:eros_n/models/index.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'front_provider.dart';

class FrontPage extends StatefulHookConsumerWidget {
  const FrontPage({super.key});

  @override
  ConsumerState<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends ConsumerState<FrontPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(frontProvider.notifier).loadData();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('FrontPage build');

    super.build(context);
    logger.v('${MediaQuery.of(context).padding.top}');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(frontProvider.notifier).reloadData(),
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('FrontPage'),
              floating: true,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(height: 0),
              ),
            ),
            const GalleryListView(),
            Consumer(builder: (context, ref, _) {
              final state = ref.watch(frontProvider);
              return EndIndicator(
                loadStatus: state.status,
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class GalleryListView extends HookConsumerWidget {
  const GalleryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.d('GalleryListView build');
    final List<Gallery> list = ref.watch(gallerysProvider);
    final state = ref.watch(frontProvider);

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return GalleryWaterfallFlowView(
      gallerys: list,
      lastComplete: () => ref.read(frontProvider.notifier).loadNextPage(),
      keepPosition: true,
    );
  }
}
