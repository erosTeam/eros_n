import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MorePage extends StatelessWidget {
  final logic = Get.put(MoreLogic());
  final state = Get.find<MoreLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
