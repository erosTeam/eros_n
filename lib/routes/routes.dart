import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/gallery/comments_page.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/gallery/thumb_page.dart';
import 'package:eros_n/pages/nav/favorite/favorite_view.dart';
import 'package:eros_n/pages/nav/front/front_view.dart';
import 'package:eros_n/pages/nav/history/history_view.dart';
import 'package:eros_n/pages/nav/index/index_view.dart';
import 'package:eros_n/pages/nav/more/more_view.dart';
import 'package:eros_n/pages/nav/search/search_provider.dart';
import 'package:eros_n/pages/nav/search/search_view.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/pages/setting/about_page.dart';
import 'package:eros_n/pages/setting/advanced_setting_page.dart';
import 'package:eros_n/pages/setting/appearance_setting_page.dart';
import 'package:eros_n/pages/setting/general_setting_page.dart';
import 'package:eros_n/pages/setting/license_page.dart';
import 'package:eros_n/pages/setting/read_setting_page.dart';
import 'package:eros_n/pages/setting/settings_page.dart';
import 'package:eros_n/pages/splash/splash_view.dart';
import 'package:eros_n/pages/user/login_page.dart';
import 'package:eros_n/pages/user/web_login_page.dart';
import 'package:eros_n/pages/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/gallery/gallery_view.dart';

part 'routes.gr.dart';

class NHRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String front = '/front';
  static const String favorite = '/favorite';
  static const String history = '/history';
  static const String gallery = '/gallery';
  static const String read = '/read';
  static const String settings = '/settings';
  static const String appearanceSetting = '/appearanceSetting';
  static const String readSetting = '/readSetting';
  static const String advancedSetting = '/advancedSetting';
  static const String generalSetting = '/generalSetting';
  static const String login = '/login';
  static const String webLogin = '/webLogin';
  static const String webView = '/webView';
  static const String about = '/about';
  static const String license = '/license';
  static const String thumb = '/thumb';
  static const String comments = '/comments';
  static const String search = '/search';
  static const String more = '/more';
}

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: NHRoutes.root, page: SplashRoute.page),
    AutoRoute(path: NHRoutes.home, page: IndexRoute.page),
    AutoRoute(path: NHRoutes.front, page: FrontRoute.page),
    AutoRoute(path: NHRoutes.favorite, page: FavoriteRoute.page),
    AutoRoute(path: NHRoutes.history, page: HistoryRoute.page),
    AutoRoute(path: NHRoutes.search, page: SearchRoute.page),
    AutoRoute(path: NHRoutes.more, page: MoreRoute.page),
    AutoRoute(path: NHRoutes.gallery, page: GalleryRoute.page),
    AutoRoute(path: NHRoutes.read, page: ReadRoute.page),
    AutoRoute(path: NHRoutes.thumb, page: ThumbRoute.page),
    AutoRoute(path: NHRoutes.comments, page: CommentsRoute.page),
    AutoRoute(path: NHRoutes.settings, page: SettingsRoute.page),
    AutoRoute(
        path: NHRoutes.appearanceSetting, page: AppearanceSettingRoute.page),
    AutoRoute(path: NHRoutes.generalSetting, page: GeneralSettingRoute.page),
    AutoRoute(path: NHRoutes.readSetting, page: ReadSettingRoute.page),
    AutoRoute(path: NHRoutes.advancedSetting, page: AdvancedSettingRoute.page),
    AutoRoute(path: NHRoutes.login, page: LoginRoute.page),
    AutoRoute(path: NHRoutes.webLogin, page: WebLoginRoute.page),
    AutoRoute(path: NHRoutes.webView, page: NhWebViewRoute.page),
    AutoRoute(path: NHRoutes.about, page: AboutRoute.page),
    AutoRoute(path: NHRoutes.license, page: MyLicenseRoute.page),
  ];
}

class RouteUtil {
  static Future<void> goRead(
    BuildContext context,
    WidgetRef ref, {
    int? index,
    String? heroTagPrefix,
  }) async {
    final gid = currentGalleryGid;
    if (index != null) {
      ref.read(galleryProvider(gid).notifier).setInitialPage(index);
    }

    ref
        .read(thumbHeroTagPrefixProvider.notifier)
        .update((state) => heroTagPrefix ?? '');

    // erosRouter.push(ReadRoute(index: index));
    await context.router.push(ReadRoute(
      index: index,
      colorScheme: Theme.of(context).colorScheme,
    ));
  }

  static Future<void> goGallery(
    WidgetRef ref,
    Gallery gallery, {
    String? heroTag,
  }) async {
    ref.watch(galleryProvider(gallery.gid).notifier).initFromGallery(gallery);
    pushGalleryPage(gallery.gid);
    try {
      await erosRouter.push(GalleryRoute(gid: gallery.gid, heroTag: heroTag));
    } finally {
      popGalleryPage();
    }
  }

  static Future<void> goGalleryByGid(
    WidgetRef ref,
    int gid, {
    String? heroTag,
    bool replace = false,
  }) async {
    ref.watch(galleryProvider(gid).notifier).initFromGid(gid);
    pushGalleryPage(gid);
    try {
      if (replace) {
        await erosRouter.replace(GalleryRoute(gid: gid, heroTag: heroTag));
      } else {
        await erosRouter.push(GalleryRoute(gid: gid, heroTag: heroTag));
      }
    } finally {
      popGalleryPage();
    }
  }

  static Future<bool> goGalleryByUrl(
    WidgetRef ref,
    String url, {
    bool replace = false,
  }) async {
    final RegExp regGalleryUrl = RegExp(r'https?://nhentai.net/g/(\d+)/?');
    final RegExp regGalleryPageUrl = RegExp(r'https://nhentai.net/g/(\d+)/\d+');

    if (regGalleryUrl.hasMatch(url)) {
      final String gid = regGalleryUrl.firstMatch(url)!.group(1)!;
      await RouteUtil.goGalleryByGid(ref, int.parse(gid), replace: replace);
    } else if (regGalleryPageUrl.hasMatch(url)) {
      final String gid = regGalleryPageUrl.firstMatch(url)!.group(1)!;
      await RouteUtil.goGalleryByGid(ref, int.parse(gid), replace: replace);
    } else {
      return false;
    }
    return true;
  }

  static Future<void> goSearch({
    Tag? tag,
    String? keyword,
  }) async {
    String query = (tag?.name ?? '').trim();
    if (query.contains(' ')) {
      query = '"$query"';
    }
    query = '${tag?.type?.toLowerCase()}:$query';

    pushSearchDepth();
    try {
      await erosRouter.push(SearchRoute(query: query));
    } finally {
      popSearchDepth();
    }
  }
}
