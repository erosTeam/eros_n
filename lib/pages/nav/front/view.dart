import 'package:english_words/english_words.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FrontPage extends StatelessWidget {
  final logic = Get.put(FrontLogic());
  final state = Get.find<FrontLogic>().state;

  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (context, index) {
                    // final word = words.elementAt(index);
                    final galleryProvider = galleryProviders.elementAt(index);
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          galleryProvider.title ?? '',
                          // style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  },
                  itemCount: galleryProviders.length,
                )
              : Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
