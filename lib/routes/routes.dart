import 'package:auto_route/auto_route.dart';
import 'package:eros_n/pages/nav/home/home_view.dart';
import 'package:eros_n/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';
part 'routes.gr.dart';

class NHRoutes {
  static const String root = '/';
  static const String home = '/home';
}

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: NHRoutes.root, page: SplashPage, initial: true),
    AutoRoute(path: NHRoutes.home, page: HomePage),
  ],
)
class AppRouter extends _$AppRouter {}
