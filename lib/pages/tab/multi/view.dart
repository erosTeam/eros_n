import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MultiPage extends StatelessWidget {
  final logic = Get.put(MultiLogic());
  final state = Get.find<MultiLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
