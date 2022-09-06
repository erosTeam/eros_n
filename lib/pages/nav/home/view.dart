import 'package:eros_n/pages/nav/front/view.dart';
import 'package:eros_n/pages/nav/history/view.dart';
import 'package:eros_n/pages/nav/more/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  static final pages = <Widget>[
    FrontPage(),
    HistoryPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: pages.elementAt(state.selectedIndex),
        bottomNavigationBar: NavigationBar(
          selectedIndex: state.selectedIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          onDestinationSelected: (index) => state.selectedIndex = index,
        ),
      );
    });
  }
}
