import 'package:english_words/english_words.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FrontPage extends StatelessWidget {
  final logic = Get.put(FrontLogic());
  final state = Get.find<FrontLogic>().state;

  Widget itemBuilder(
    BuildContext context,
    int index,
    List<GalleryProvider> galleryProviders,
  ) {
    final galleryProvider = galleryProviders.elementAt(index);
    return Container(
      height: 200,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('FrontPage'),
            floating: true,
            snap: true,
            expandedHeight: kToolbarHeight,
            // flexibleSpace: FlexibleSpaceBar(
            //   background: ErosCachedNetworkImage(
            //     imageUrl: 'https://picsum.photos/250?image=9',
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          Obx(() {
            final galleryProviders = state.galleryProviders;
            if (galleryProviders.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text('No Data'),
                ),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return itemBuilder(context, index, galleryProviders);
                },
                childCount: galleryProviders.length,
              ),
            );
          }),
        ],
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
}
