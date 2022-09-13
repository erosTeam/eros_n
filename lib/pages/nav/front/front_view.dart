import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'front_logic.dart';
import 'front_state.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage>
    with AutomaticKeepAliveClientMixin {
  final FrontLogic logic = Get.put(FrontLogic());
  final FrontState state = Get.find<FrontLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    logger.d('${context.mediaQueryPadding.top}');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: logic.reloadData,
        edgeOffset: context.mediaQueryPadding.top + kToolbarHeight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('FrontPage'),
              floating: true,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(height: 0),
                // child: Container(
                //   height: 48,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           margin: const EdgeInsets.symmetric(horizontal: 8),
                //           decoration: BoxDecoration(
                //             // color: Colors.grey[200],
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           child: TextField(
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: 'Search',
                //               prefixIcon: Icon(Icons.search),
                //             ),
                //           ),
                //         ),
                //       ),
                //       IconButton(
                //         icon: Icon(Icons.filter_list),
                //         onPressed: () {},
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
            // Listview Main
            Obx(() {
              final galleryProviders = state.galleryProviders;

              if (state.isLoading) {
                return SliverFillRemaining(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: const CircularProgressIndicator(),
                  ),
                );
              }

              if (galleryProviders.isNotEmpty) {
                return SliverSafeArea(
                  top: false,
                  sliver: GalleryWaterfallFlowView(
                    galleryProviders: galleryProviders,
                    lastComplete: logic.loadNextPage,
                    keepPosition: true,
                    curPage: state.curPage,
                    maxPage: state.maxPage,
                  ),
                );
              }

              return SliverFillRemaining(
                child: Center(
                  child: Text('No Data'),
                ),
              );
            }),
            Obx(() {
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
