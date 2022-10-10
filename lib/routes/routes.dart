import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/gallery/comments_page.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/gallery/thumb_page.dart';
import 'package:eros_n/pages/nav/index/index_view.dart';
import 'package:eros_n/pages/read/read_provider.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/pages/setting/about_page.dart';
import 'package:eros_n/pages/setting/appearance_setting_page.dart';
import 'package:eros_n/pages/setting/read_setting_page.dart';
import 'package:eros_n/pages/setting/settings_page.dart';
import 'package:eros_n/pages/splash/splash_view.dart';
import 'package:eros_n/pages/user/login_page.dart';
import 'package:eros_n/pages/user/web_login_page.dart';
import 'package:eros_n/pages/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/gallery/gallery_view.dart';

part 'routes.gr.dart';

class NHRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String gallery = '/gallery';
  static const String read = '/read';
  static const String settings = '/settings';
  static const String appearanceSetting = '/appearanceSetting';
  static const String readSetting = '/readSetting';
  static const String login = '/login';
  static const String webLogin = '/webLogin';
  static const String webview = '/webview';
  static const String about = '/about';
  static const String license = '/license';
  static const String thumb = '/thumb';
  static const String comments = '/comments';
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
    AutoRoute(path: NHRoutes.settings, page: SettingsPage),
    AutoRoute(path: NHRoutes.appearanceSetting, page: AppearanceSettingPage),
    AutoRoute(path: NHRoutes.readSetting, page: ReadSettingPage),
    AutoRoute(path: NHRoutes.login, page: LoginPage),
    AutoRoute<List<Cookie>>(path: NHRoutes.webLogin, page: WebLoginPage),
    AutoRoute(path: NHRoutes.webview, page: NhWebViewPage),
    AutoRoute(path: NHRoutes.about, page: AboutPage),
    AutoRoute(path: NHRoutes.license, page: LicensePage),
    AutoRoute(path: NHRoutes.thumb, page: ThumbPage),
    AutoRoute(path: NHRoutes.comments, page: CommentsPage),
  ],
)
class AppRouter extends _$AppRouter {}

class RouteUtil {
  static Future<void> goRead(
    WidgetRef ref, {
    int? index,
  }) async {
    final gid = ref.watch(currentGidProvider);
    if (index != null) {
      ref.watch(galleryProvider(gid).notifier).setInitialPage(index);
    }
    await erosRouter.push(ReadRoute(index: index));
  }
}
