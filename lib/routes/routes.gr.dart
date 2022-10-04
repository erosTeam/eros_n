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
    GalleryRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryRouteArgs>(
          orElse: () => const GalleryRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: GalleryPage(
          key: args.key,
          gid: args.gid,
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
          gid: args.gid,
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
    ThumbRoute.name: (routeData) {
      final args = routeData.argsAs<ThumbRouteArgs>(
          orElse: () => const ThumbRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ThumbPage(
          key: args.key,
          gid: args.gid,
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
          path: '/home',
        ),
        RouteConfig(
          GalleryRoute.name,
          path: '/gallery',
        ),
        RouteConfig(
          ReadRoute.name,
          path: '/read',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings',
        ),
        RouteConfig(
          AppearanceSettingRoute.name,
          path: '/appearanceSetting',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          WebLoginRoute.name,
          path: '/webLogin',
        ),
        RouteConfig(
          NhWebViewRoute.name,
          path: '/webview',
        ),
        RouteConfig(
          AboutRoute.name,
          path: '/about',
        ),
        RouteConfig(
          LicenseRoute.name,
          path: '/license',
        ),
        RouteConfig(
          ThumbRoute.name,
          path: '/thumb',
        ),
        RouteConfig(
          CommentsRoute.name,
          path: '/comments',
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
          path: '/home',
        );

  static const String name = 'IndexRoute';
}

/// generated route for
/// [GalleryPage]
class GalleryRoute extends PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    Key? key,
    int? gid,
  }) : super(
          GalleryRoute.name,
          path: '/gallery',
          args: GalleryRouteArgs(
            key: key,
            gid: gid,
          ),
        );

  static const String name = 'GalleryRoute';
}

class GalleryRouteArgs {
  const GalleryRouteArgs({
    this.key,
    this.gid,
  });

  final Key? key;

  final int? gid;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, gid: $gid}';
  }
}

/// generated route for
/// [ReadPage]
class ReadRoute extends PageRouteInfo<ReadRouteArgs> {
  ReadRoute({
    Key? key,
    int? gid,
  }) : super(
          ReadRoute.name,
          path: '/read',
          args: ReadRouteArgs(
            key: key,
            gid: gid,
          ),
        );

  static const String name = 'ReadRoute';
}

class ReadRouteArgs {
  const ReadRouteArgs({
    this.key,
    this.gid,
  });

  final Key? key;

  final int? gid;

  @override
  String toString() {
    return 'ReadRouteArgs{key: $key, gid: $gid}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [AppearanceSettingPage]
class AppearanceSettingRoute extends PageRouteInfo<void> {
  const AppearanceSettingRoute()
      : super(
          AppearanceSettingRoute.name,
          path: '/appearanceSetting',
        );

  static const String name = 'AppearanceSettingRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [WebLoginPage]
class WebLoginRoute extends PageRouteInfo<void> {
  const WebLoginRoute()
      : super(
          WebLoginRoute.name,
          path: '/webLogin',
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
          path: '/webview',
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
          path: '/about',
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
          path: '/license',
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

/// generated route for
/// [ThumbPage]
class ThumbRoute extends PageRouteInfo<ThumbRouteArgs> {
  ThumbRoute({
    Key? key,
    int? gid,
  }) : super(
          ThumbRoute.name,
          path: '/thumb',
          args: ThumbRouteArgs(
            key: key,
            gid: gid,
          ),
        );

  static const String name = 'ThumbRoute';
}

class ThumbRouteArgs {
  const ThumbRouteArgs({
    this.key,
    this.gid,
  });

  final Key? key;

  final int? gid;

  @override
  String toString() {
    return 'ThumbRouteArgs{key: $key, gid: $gid}';
  }
}

/// generated route for
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    required int? gid,
  }) : super(
          CommentsRoute.name,
          path: '/comments',
          args: CommentsRouteArgs(
            key: key,
            gid: gid,
          ),
        );

  static const String name = 'CommentsRoute';
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.gid,
  });

  final Key? key;

  final int? gid;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, gid: $gid}';
  }
}
