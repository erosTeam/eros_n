import 'package:eros_n/models/index.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:get/get.dart';

import 'item/item_card.dart';

class GallerySliverListView extends StatelessWidget {
  const GallerySliverListView({
    Key? key,
    required this.galleryProviders,
    this.tabTag,
    this.maxPage,
    this.curPage = 0,
    this.lastComplete,
    this.lastTopitemIndex,
    this.keepPosition = false,
  }) : super(key: key);

  final List<GalleryProvider> galleryProviders;
  final dynamic tabTag;
  final int? maxPage;
  final int curPage;
  final VoidCallback? lastComplete;
  final int? lastTopitemIndex;
  final bool keepPosition;

  Widget itemCardBuilder(BuildContext context, int index) {
    if (galleryProviders.length - 1 < index) {
      return const SizedBox.shrink();
    }

    if (index == galleryProviders.length - 1) {
      // 加载完成最后一项的回调
      SchedulerBinding.instance
          .addPostFrameCallback((_) => lastComplete?.call());
    }

    final GalleryProvider provider = galleryProviders[index];

    return ItemCard(
      galleryProvider: provider,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSliverList(
      delegate: FlutterListViewDelegate(
        itemCardBuilder,
        onItemKey: (index) => galleryProviders[index].gid ?? '',
        childCount: galleryProviders.length,
        keepPosition: keepPosition,
        // onItemHeight: (index) => 180,
        preferItemHeight: 180,
      ),
    );
  }
}

class EndIndicator extends StatelessWidget {
  const EndIndicator({Key? key, required this.loadStatus, this.loadDataMore})
      : super(key: key);

  final LoadStatus loadStatus;
  final VoidCallback? loadDataMore;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              top: 50, bottom: 100.0 + context.mediaQueryPadding.bottom),
          child: () {
            switch (loadStatus) {
              case LoadStatus.success:
                return Container();
              case LoadStatus.loadingMore:
                return const CircularProgressIndicator();
              case LoadStatus.error:
                return GestureDetector(
                  onTap: loadDataMore,
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        Icons.error,
                        size: 40,
                        color: Colors.red,
                      ),
                      Text(
                        'Load more fail',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              default:
                return Container();
            }
          }()),
    );
  }
}
