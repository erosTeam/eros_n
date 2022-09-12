import 'package:eros_n/pages/splash/splash_view.dart';
import 'package:eros_n/pages/nav/home/home_view.dart';
import 'package:get/get.dart';

import '../pages/nav/front/front_view.dart';
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
