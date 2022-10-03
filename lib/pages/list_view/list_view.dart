import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/widget/sliver.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/list_view/item/item_waterfall_flow_card.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'item/item_card.dart';

class GallerySliverListView extends StatelessWidget {
  const GallerySliverListView({
    Key? key,
    required this.gallerys,
    this.tabTag,
    this.lastComplete,
    this.lastTopitemIndex,
    this.keepPosition = false,
  }) : super(key: key);

  final List<Gallery> gallerys;
  final dynamic tabTag;
  final VoidCallback? lastComplete;
  final int? lastTopitemIndex;
  final bool keepPosition;

  Widget itemCardBuilder(BuildContext context, int index) {
    if (gallerys.length - 1 < index) {
      return const SizedBox.shrink();
    }

    if (index == gallerys.length - 1) {
      // 加载完成最后一项的回调
      SchedulerBinding.instance
          .addPostFrameCallback((_) => lastComplete?.call());
    }

    final Gallery gallery = gallerys[index];

    return ItemCard(
      gallery: gallery,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSliverList(
      delegate: FlutterListViewDelegate(
        itemCardBuilder,
        onItemKey: (index) => gallerys[index].gid ?? '',
        childCount: gallerys.length,
        keepPosition: keepPosition,
        // onItemHeight: (index) => 180,
        preferItemHeight: 180,
      ),
    );
  }
}

class GalleryWaterfallFlowView extends StatelessWidget {
  const GalleryWaterfallFlowView({
    Key? key,
    required this.gallerys,
    this.tabTag,
    this.lastComplete,
    this.keepPosition = false,
    this.maxPage =1,
    this.currentPage = 1,
  }) : super(key: key);

  final List<Gallery> gallerys;
  final dynamic tabTag;
  final VoidCallback? lastComplete;
  final bool keepPosition;
  final int maxPage;
  final int currentPage;

  Widget itemCardBuilder(BuildContext context, int index) {
    if (gallerys.length - 1 < index) {
      return const SizedBox.shrink();
    }

    if (index == gallerys.length - 1 && currentPage < maxPage) {
      // 加载完成最后一项的回调
      SchedulerBinding.instance
          .addPostFrameCallback((_) => lastComplete?.call());
    }

    final Gallery gallery = gallerys[index];

    return ItemWaterfallFlowCard(
      gallery: gallery,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: NHConst.waterfallFlowLargeMainAxisSpacing,
        horizontal: NHConst.waterfallFlowLargeCrossAxisSpacing,
      ),
      sliver: SliverWaterfallFlow(
        delegate: SliverChildBuilderDelegate(
          itemCardBuilder,
          childCount: gallerys.length,
        ),
        gridDelegate: SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: NHConst.waterfallFlowLargeMaxCrossAxisExtent,
          crossAxisSpacing: NHConst.waterfallFlowLargeCrossAxisSpacing,
          mainAxisSpacing: NHConst.waterfallFlowLargeMainAxisSpacing,
          lastChildLayoutTypeBuilder: (int index) => index == gallerys.length
              ? LastChildLayoutType.foot
              : LastChildLayoutType.none,
        ),
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
              case LoadStatus.none:
              case LoadStatus.success:
                return Container();
              case LoadStatus.loadingMore:
                return const CircularProgressIndicator();
              case LoadStatus.error:
                return GestureDetector(
                  onTap: loadDataMore,
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.error,
                        size: 60,
                      ),
                      Text(
                        'Load more fail',
                        style: TextStyle(
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
