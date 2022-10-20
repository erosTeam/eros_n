import 'dart:async';

import 'package:eros_n/common/extension.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/nav/history/history_provider.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nil/nil.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HistoryPage extends StatefulHookConsumerWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  double lastScrollOffset = 0;
  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    indexProviderNoti.addScrollController(scrollController);
    scrollController.addListener(_scrollListener);

    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        // unfocus
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
    keyboardSubscription.cancel();
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
    logger.d('build HistoryPage');
    super.build(context);
    return Scaffold(
      body: Scrollbar(
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            Consumer(builder: (context, ref, child) {
              final appBarSearch =
                  ref.watch(historyProvider.select((s) => s.appBarSearch));
              return SliverAppBar(
                title: appBarSearch
                    ? TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: L10n.of(context).search,
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.search,
                        // onSubmitted: (value) {
                        //   logger.d('onSubmitted $value');
                        // },
                        onChanged: (value) {
                          ref
                              .read(searchKeyProvider.notifier)
                              .update((state) => state = value);
                        },
                      )
                    : Row(
                        children: [
                          Text(L10n.of(context).history),
                        ],
                      ),
                leadingWidth: appBarSearch ? 60 : 0,
                leading: appBarSearch
                    ? IconButton(
                        onPressed: () {
                          ref
                              .read(historyProvider.notifier)
                              .setAppBarSearch(false);
                        },
                        icon: const Icon(Icons.arrow_back))
                    : nil,
                floating: true,
                pinned: true,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(height: 0),
                ),
                actions: appBarSearch
                    ? null
                    : [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            ref
                                .read(historyProvider.notifier)
                                .setAppBarSearch(true);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            icon: const Icon(Icons.delete_sweep_outlined),
                            onPressed: () {
                              // dialog show
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(L10n.of(context).clear_history),
                                    content: Text(
                                        L10n.of(context).clear_history_tip),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(L10n.of(context).cancel),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ref
                                              .read(historyProvider.notifier)
                                              .clearHistory();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(L10n.of(context).ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        //search
                      ],
              );
            }),
            Consumer(
              builder: (context, ref, child) {
                // final historys = ref.watch(historyGallerysProvider);
                final historys = ref.watch(filteredHistoryGallerysProvider);
                final historysGroupByDate = groupByDate(historys);
                return SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: MultiSliver(
                      children: historysGroupByDate.entries.map(
                    (e) {
                      final DateTime date = e.key;
                      // if date is today
                      final String dateStr = date.isToday()
                          ? L10n.of(context).today
                          : date.isYesterday()
                              ? L10n.of(context).yesterday
                              : date.toLocal().toString().split(' ')[0];
                      final historysInDate = e.value;
                      return MultiSliver(
                        pushPinnedChildren: true,
                        children: [
                          SliverPinnedHeader(
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                dateStr,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final history = historysInDate[index];
                                return HistoryItem(history: history);
                              },
                              childCount: historysInDate.length,
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HistoryItem extends HookConsumerWidget {
  const HistoryItem({
    Key? key,
    required this.history,
  }) : super(key: key);

  final GalleryHistory history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // last view hour and minute
    final lastReadTime =
        DateTime.fromMillisecondsSinceEpoch(history.lastReadTime ?? 0);
    final String lastReadTimeStr =
        lastReadTime.toLocal().toString().split(' ')[1].substring(0, 5);

    return InkWell(
      onTap: () {
        final gallery = Gallery(
          gid: history.gid,
          mediaId: history.mediaId,
          title: GalleryTitle(
            englishTitle: history.title,
            japaneseTitle: history.japaneseTitle,
          ),
          images: GalleryImages(
            cover: GalleryImage(
              imgHeight: history.coverImgHeight,
              imgWidth: history.coverImgWidth,
            ),
          ),
        );

        RouteUtil.goGallery(ref, gallery);
      },
      child: Container(
        height: 84,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: ErosCachedNetworkImage(
                    imageUrl: history.thumbUrl ?? '',
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.title ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    alignment: Alignment.bottomLeft,
                    // time
                    child: Text(
                      lastReadTimeStr,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  ref.read(historyProvider.notifier).removeHistory(history.gid);
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                )),
          ],
        ),
      ),
    );
  }
}

Map<DateTime, List<GalleryHistory>> groupByDate(List<GalleryHistory> historys) {
  final Map<DateTime, List<GalleryHistory>> map = {};
  for (final history in historys) {
    final date = DateTime.fromMillisecondsSinceEpoch(history.lastReadTime ?? 0);
    final key = DateTime(date.year, date.month, date.day);
    if (map.containsKey(key)) {
      map[key]!.add(history);
    } else {
      map[key] = [history];
    }
  }
  return map;
}
