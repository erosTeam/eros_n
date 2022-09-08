import 'package:english_words/english_words.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

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
    logger.d('build');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: logic.reloadData,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('FrontPage'),
              floating: true,
              snap: true,
              expandedHeight: kToolbarHeight,
            ),
            Obx(() {
              final galleryProviders = state.galleryProviders;
              if (galleryProviders.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text('No Data'),
                  ),
                );
              }
              return SliverSafeArea(
                top: false,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return itemBuilder(context, index, galleryProviders);
                    },
                    childCount: galleryProviders.length,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder(
    BuildContext context,
    int index,
    List<GalleryProvider> galleryProviders,
  ) {
    final galleryProvider = galleryProviders.elementAt(index);
    return Container(
      height: 180,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Container(
              width: 120,
              child: ErosCachedNetworkImage(
                imageUrl: galleryProvider.thumbUrl ?? '',
                fit: BoxFit.scaleDown,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      galleryProvider.title ?? '',
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      // style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  Widget build2(BuildContext context) {
    // final words = generateWordPairs().take(300).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        onRefresh: logic.reloadData,
        child: Obx(() {
          final galleryProviders = state.galleryProviders;
          logger.d('galleryProviders.length: ${galleryProviders.length}');
          // return Center(child: Text('${galleryProviders.length}'));
          return galleryProviders.isNotEmpty
              ? ListView.builder(
                  itemCount: galleryProviders.length,
                  itemExtent: 200,
                  itemBuilder: (context, index) {
                    // final word = words.elementAt(index);
                    final galleryProvider = galleryProviders.elementAt(index);
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            child: ErosCachedNetworkImage(
                              imageUrl: galleryProvider.thumbUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    galleryProvider.title ?? '',
                                    textAlign: TextAlign.start,
                                    // style: TextStyle(fontSize: 20),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
