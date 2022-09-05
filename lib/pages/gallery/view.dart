import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GalleryPage extends StatelessWidget {
  final logic = Get.put(GalleryLogic());
  final state = Get.find<GalleryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
