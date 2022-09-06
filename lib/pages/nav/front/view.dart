import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FrontPage extends StatelessWidget {
  final logic = Get.put(FrontLogic());
  final state = Get.find<FrontLogic>().state;

  @override
  Widget build(BuildContext context) {
    final words = generateWordPairs().take(300);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        onRefresh: logic.getGalleryData,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final _word = words.elementAt(index);
            return Text(
              _word.toString(),
              style: TextStyle(fontSize: 16),
            );
          },
          itemCount: words.length,
        ),
      ),
    );
  }
}
