import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gallery_logic.dart';

class GalleryPage extends StatelessWidget {
  final logic = Get.put(GalleryLogic());
  final state = Get.find<GalleryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GalleryPage')),
      body: Container(
        // color: Colors.amber,
        child: Center(
          child: Text('GalleryPage'),
        ),
      ),
    );
  }
}
