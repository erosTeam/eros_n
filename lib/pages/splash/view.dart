import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SplashPage extends StatelessWidget {
  final logic = Get.put(SplashLogic());
  final state = Get.find<SplashLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Eros-N',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
