import 'package:auto_route/auto_route.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/nav/index/index_view.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../pages/gallery/gallery_view.dart';

part 'routes.gr.dart';

class NHRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String gallery = '/gallery';
  static const String read = '/read';
}

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: NHRoutes.root, page: SplashPage, initial: true),
    AutoRoute(path: NHRoutes.home, page: IndexPage),
    AutoRoute(path: NHRoutes.gallery, page: GalleryPage),
    AutoRoute(path: NHRoutes.read, page: ReadPage),
  ],
)
class AppRouter extends _$AppRouter {}
