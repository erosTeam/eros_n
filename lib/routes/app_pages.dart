import 'package:eros_n/pages/splash/view.dart';
import 'package:eros_n/pages/tab/home/view.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: NHRoutes.root,
      page: () => SplashPage(),
    ),
    GetPage(
      name: NHRoutes.home,
      page: () => HomePage(),
    ),
  ];
}
