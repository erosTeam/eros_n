// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    IndexRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const IndexPage(),
      );
    },
    FrontRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FrontPage(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FavoritePage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HistoryPage(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SearchPage(
          key: args.key,
          query: args.query,
        ),
      );
    },
    MoreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MorePage(),
      );
    },
    GalleryRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: GalleryPage(
          key: args.key,
          gid: args.gid,
          heroTag: args.heroTag,
        ),
      );
    },
    ReadRoute.name: (routeData) {
      final args =
          routeData.argsAs<ReadRouteArgs>(orElse: () => const ReadRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ReadPage(
          key: args.key,
          index: args.index,
          colorScheme: args.colorScheme,
        ),
      );
    },
    ThumbRoute.name: (routeData) {
      final args = routeData.argsAs<ThumbRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ThumbPage(
          key: args.key,
          gid: args.gid,
          colorScheme: args.colorScheme,
        ),
      );
    },
    CommentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommentsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CommentsPage(
          key: args.key,
          gid: args.gid,
          colorScheme: args.colorScheme,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    AppearanceSettingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AppearanceSettingPage(),
      );
    },
    GeneralSettingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const GeneralSettingPage(),
      );
    },
    ReadSettingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ReadSettingPage(),
      );
    },
    AdvancedSettingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdvancedSettingPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    WebLoginRoute.name: (routeData) {
      return MaterialPageX<List<Cookie>>(
        routeData: routeData,
        child: const WebLoginPage(),
      );
    },
    NhWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<NhWebViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NhWebViewPage(
          key: args.key,
          initialUrl: args.initialUrl,
          title: args.title,
        ),
      );
    },
    AboutRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    LicenseRoute.name: (routeData) {
      final args = routeData.argsAs<LicenseRouteArgs>(
          orElse: () => const LicenseRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LicensePage(
          key: args.key,
          applicationName: args.applicationName,
          applicationVersion: args.applicationVersion,
          applicationIcon: args.applicationIcon,
          applicationLegalese: args.applicationLegalese,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          IndexRoute.name,
          path: 'home',
        ),
        RouteConfig(
          FrontRoute.name,
          path: 'front',
        ),
        RouteConfig(
          FavoriteRoute.name,
          path: 'favorite',
        ),
        RouteConfig(
          HistoryRoute.name,
          path: 'history',
        ),
        RouteConfig(
          SearchRoute.name,
          path: 'search',
        ),
        RouteConfig(
          MoreRoute.name,
          path: 'more',
        ),
        RouteConfig(
          GalleryRoute.name,
          path: 'gallery',
        ),
        RouteConfig(
          ReadRoute.name,
          path: 'read',
        ),
        RouteConfig(
          ThumbRoute.name,
          path: 'thumb',
        ),
        RouteConfig(
          CommentsRoute.name,
          path: 'comments',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: 'settings',
        ),
        RouteConfig(
          AppearanceSettingRoute.name,
          path: 'appearanceSetting',
        ),
        RouteConfig(
          GeneralSettingRoute.name,
          path: 'generalSetting',
        ),
        RouteConfig(
          ReadSettingRoute.name,
          path: 'readSetting',
        ),
        RouteConfig(
          AdvancedSettingRoute.name,
          path: 'advancedSetting',
        ),
        RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        RouteConfig(
          WebLoginRoute.name,
          path: 'webLogin',
        ),
        RouteConfig(
          NhWebViewRoute.name,
          path: 'webView',
        ),
        RouteConfig(
          AboutRoute.name,
          path: 'about',
        ),
        RouteConfig(
          LicenseRoute.name,
          path: 'license',
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [IndexPage]
class IndexRoute extends PageRouteInfo<void> {
  const IndexRoute()
      : super(
          IndexRoute.name,
          path: 'home',
        );

  static const String name = 'IndexRoute';
}

/// generated route for
/// [FrontPage]
class FrontRoute extends PageRouteInfo<void> {
  const FrontRoute()
      : super(
          FrontRoute.name,
          path: 'front',
        );

  static const String name = 'FrontRoute';
}

/// generated route for
/// [FavoritePage]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: 'favorite',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute()
      : super(
          HistoryRoute.name,
          path: 'history',
        );

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    required String query,
  }) : super(
          SearchRoute.name,
          path: 'search',
          args: SearchRouteArgs(
            key: key,
            query: query,
          ),
        );

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    required this.query,
  });

  final Key? key;

  final String query;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute()
      : super(
          MoreRoute.name,
          path: 'more',
        );

  static const String name = 'MoreRoute';
}

/// generated route for
/// [GalleryPage]
class GalleryRoute extends PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    Key? key,
    required int gid,
    String? heroTag,
  }) : super(
          GalleryRoute.name,
          path: 'gallery',
          args: GalleryRouteArgs(
            key: key,
            gid: gid,
            heroTag: heroTag,
          ),
        );

  static const String name = 'GalleryRoute';
}

class GalleryRouteArgs {
  const GalleryRouteArgs({
    this.key,
    required this.gid,
    this.heroTag,
  });

  final Key? key;

  final int gid;

  final String? heroTag;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, gid: $gid, heroTag: $heroTag}';
  }
}

/// generated route for
/// [ReadPage]
class ReadRoute extends PageRouteInfo<ReadRouteArgs> {
  ReadRoute({
    Key? key,
    int? index,
    ColorScheme? colorScheme,
  }) : super(
          ReadRoute.name,
          path: 'read',
          args: ReadRouteArgs(
            key: key,
            index: index,
            colorScheme: colorScheme,
          ),
        );

  static const String name = 'ReadRoute';
}

class ReadRouteArgs {
  const ReadRouteArgs({
    this.key,
    this.index,
    this.colorScheme,
  });

  final Key? key;

  final int? index;

  final ColorScheme? colorScheme;

  @override
  String toString() {
    return 'ReadRouteArgs{key: $key, index: $index, colorScheme: $colorScheme}';
  }
}

/// generated route for
/// [ThumbPage]
class ThumbRoute extends PageRouteInfo<ThumbRouteArgs> {
  ThumbRoute({
    Key? key,
    required int gid,
    ColorScheme? colorScheme,
  }) : super(
          ThumbRoute.name,
          path: 'thumb',
          args: ThumbRouteArgs(
            key: key,
            gid: gid,
            colorScheme: colorScheme,
          ),
        );

  static const String name = 'ThumbRoute';
}

class ThumbRouteArgs {
  const ThumbRouteArgs({
    this.key,
    required this.gid,
    this.colorScheme,
  });

  final Key? key;

  final int gid;

  final ColorScheme? colorScheme;

  @override
  String toString() {
    return 'ThumbRouteArgs{key: $key, gid: $gid, colorScheme: $colorScheme}';
  }
}

/// generated route for
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    required int gid,
    ColorScheme? colorScheme,
  }) : super(
          CommentsRoute.name,
          path: 'comments',
          args: CommentsRouteArgs(
            key: key,
            gid: gid,
            colorScheme: colorScheme,
          ),
        );

  static const String name = 'CommentsRoute';
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.gid,
    this.colorScheme,
  });

  final Key? key;

  final int gid;

  final ColorScheme? colorScheme;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, gid: $gid, colorScheme: $colorScheme}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [AppearanceSettingPage]
class AppearanceSettingRoute extends PageRouteInfo<void> {
  const AppearanceSettingRoute()
      : super(
          AppearanceSettingRoute.name,
          path: 'appearanceSetting',
        );

  static const String name = 'AppearanceSettingRoute';
}

/// generated route for
/// [GeneralSettingPage]
class GeneralSettingRoute extends PageRouteInfo<void> {
  const GeneralSettingRoute()
      : super(
          GeneralSettingRoute.name,
          path: 'generalSetting',
        );

  static const String name = 'GeneralSettingRoute';
}

/// generated route for
/// [ReadSettingPage]
class ReadSettingRoute extends PageRouteInfo<void> {
  const ReadSettingRoute()
      : super(
          ReadSettingRoute.name,
          path: 'readSetting',
        );

  static const String name = 'ReadSettingRoute';
}

/// generated route for
/// [AdvancedSettingPage]
class AdvancedSettingRoute extends PageRouteInfo<void> {
  const AdvancedSettingRoute()
      : super(
          AdvancedSettingRoute.name,
          path: 'advancedSetting',
        );

  static const String name = 'AdvancedSettingRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [WebLoginPage]
class WebLoginRoute extends PageRouteInfo<void> {
  const WebLoginRoute()
      : super(
          WebLoginRoute.name,
          path: 'webLogin',
        );

  static const String name = 'WebLoginRoute';
}

/// generated route for
/// [NhWebViewPage]
class NhWebViewRoute extends PageRouteInfo<NhWebViewRouteArgs> {
  NhWebViewRoute({
    Key? key,
    required String initialUrl,
    String? title,
  }) : super(
          NhWebViewRoute.name,
          path: 'webView',
          args: NhWebViewRouteArgs(
            key: key,
            initialUrl: initialUrl,
            title: title,
          ),
        );

  static const String name = 'NhWebViewRoute';
}

class NhWebViewRouteArgs {
  const NhWebViewRouteArgs({
    this.key,
    required this.initialUrl,
    this.title,
  });

  final Key? key;

  final String initialUrl;

  final String? title;

  @override
  String toString() {
    return 'NhWebViewRouteArgs{key: $key, initialUrl: $initialUrl, title: $title}';
  }
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: 'about',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [LicensePage]
class LicenseRoute extends PageRouteInfo<LicenseRouteArgs> {
  LicenseRoute({
    Key? key,
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
  }) : super(
          LicenseRoute.name,
          path: 'license',
          args: LicenseRouteArgs(
            key: key,
            applicationName: applicationName,
            applicationVersion: applicationVersion,
            applicationIcon: applicationIcon,
            applicationLegalese: applicationLegalese,
          ),
        );

  static const String name = 'LicenseRoute';
}

class LicenseRouteArgs {
  const LicenseRouteArgs({
    this.key,
    this.applicationName,
    this.applicationVersion,
    this.applicationIcon,
    this.applicationLegalese,
  });

  final Key? key;

  final String? applicationName;

  final String? applicationVersion;

  final Widget? applicationIcon;

  final String? applicationLegalese;

  @override
  String toString() {
    return 'LicenseRouteArgs{key: $key, applicationName: $applicationName, applicationVersion: $applicationVersion, applicationIcon: $applicationIcon, applicationLegalese: $applicationLegalese}';
  }
}
