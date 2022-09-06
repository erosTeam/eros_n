import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HistoryPage extends StatelessWidget {
  final logic = Get.put(HistoryLogic());
  final state = Get.find<HistoryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(),
    );
  }
}
