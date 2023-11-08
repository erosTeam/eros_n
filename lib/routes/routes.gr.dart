// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    CommentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommentsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentsPage(
          key: args.key,
          gid: args.gid,
          colorScheme: args.colorScheme,
        ),
      );
    },
    ThumbRoute.name: (routeData) {
      final args = routeData.argsAs<ThumbRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ThumbPage(
          key: args.key,
          gid: args.gid,
          colorScheme: args.colorScheme,
        ),
      );
    },
    GalleryRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryRouteArgs>();
      return AutoRoutePage<dynamic>(
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReadPage(
          key: args.key,
          index: args.index,
          colorScheme: args.colorScheme,
        ),
      );
    },
    NhWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<NhWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NhWebViewPage(
          key: args.key,
          initialUrl: args.initialUrl,
          title: args.title,
        ),
      );
    },
    WebLoginRoute.name: (routeData) {
      return AutoRoutePage<List<Cookie>>(
        routeData: routeData,
        child: const WebLoginPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritePage(),
      );
    },
    MoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MorePage(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchPage(
          key: args.key,
          query: args.query,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryPage(),
      );
    },
    IndexRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IndexPage(),
      );
    },
    FrontRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FrontPage(),
      );
    },
    AdvancedSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdvancedSettingPage(),
      );
    },
    MyLicenseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyLicensePage(),
      );
    },
    GeneralSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralSettingPage(),
      );
    },
    AppearanceSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppearanceSettingPage(),
      );
    },
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    ReadSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReadSettingPage(),
      );
    },
  };
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    required int gid,
    ColorScheme? colorScheme,
    List<PageRouteInfo>? children,
  }) : super(
          CommentsRoute.name,
          args: CommentsRouteArgs(
            key: key,
            gid: gid,
            colorScheme: colorScheme,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentsRoute';

  static const PageInfo<CommentsRouteArgs> page =
      PageInfo<CommentsRouteArgs>(name);
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
/// [ThumbPage]
class ThumbRoute extends PageRouteInfo<ThumbRouteArgs> {
  ThumbRoute({
    Key? key,
    required int gid,
    ColorScheme? colorScheme,
    List<PageRouteInfo>? children,
  }) : super(
          ThumbRoute.name,
          args: ThumbRouteArgs(
            key: key,
            gid: gid,
            colorScheme: colorScheme,
          ),
          initialChildren: children,
        );

  static const String name = 'ThumbRoute';

  static const PageInfo<ThumbRouteArgs> page = PageInfo<ThumbRouteArgs>(name);
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
/// [GalleryPage]
class GalleryRoute extends PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    Key? key,
    required int gid,
    String? heroTag,
    List<PageRouteInfo>? children,
  }) : super(
          GalleryRoute.name,
          args: GalleryRouteArgs(
            key: key,
            gid: gid,
            heroTag: heroTag,
          ),
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static const PageInfo<GalleryRouteArgs> page =
      PageInfo<GalleryRouteArgs>(name);
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
    List<PageRouteInfo>? children,
  }) : super(
          ReadRoute.name,
          args: ReadRouteArgs(
            key: key,
            index: index,
            colorScheme: colorScheme,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadRoute';

  static const PageInfo<ReadRouteArgs> page = PageInfo<ReadRouteArgs>(name);
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
/// [NhWebViewPage]
class NhWebViewRoute extends PageRouteInfo<NhWebViewRouteArgs> {
  NhWebViewRoute({
    Key? key,
    required String initialUrl,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          NhWebViewRoute.name,
          args: NhWebViewRouteArgs(
            key: key,
            initialUrl: initialUrl,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'NhWebViewRoute';

  static const PageInfo<NhWebViewRouteArgs> page =
      PageInfo<NhWebViewRouteArgs>(name);
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
/// [WebLoginPage]
class WebLoginRoute extends PageRouteInfo<void> {
  const WebLoginRoute({List<PageRouteInfo>? children})
      : super(
          WebLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritePage]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    required String query,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            query: query,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
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
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IndexPage]
class IndexRoute extends PageRouteInfo<void> {
  const IndexRoute({List<PageRouteInfo>? children})
      : super(
          IndexRoute.name,
          initialChildren: children,
        );

  static const String name = 'IndexRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FrontPage]
class FrontRoute extends PageRouteInfo<void> {
  const FrontRoute({List<PageRouteInfo>? children})
      : super(
          FrontRoute.name,
          initialChildren: children,
        );

  static const String name = 'FrontRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdvancedSettingPage]
class AdvancedSettingRoute extends PageRouteInfo<void> {
  const AdvancedSettingRoute({List<PageRouteInfo>? children})
      : super(
          AdvancedSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdvancedSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyLicensePage]
class MyLicenseRoute extends PageRouteInfo<void> {
  const MyLicenseRoute({List<PageRouteInfo>? children})
      : super(
          MyLicenseRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyLicenseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GeneralSettingPage]
class GeneralSettingRoute extends PageRouteInfo<void> {
  const GeneralSettingRoute({List<PageRouteInfo>? children})
      : super(
          GeneralSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppearanceSettingPage]
class AppearanceSettingRoute extends PageRouteInfo<void> {
  const AppearanceSettingRoute({List<PageRouteInfo>? children})
      : super(
          AppearanceSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppearanceSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReadSettingPage]
class ReadSettingRoute extends PageRouteInfo<void> {
  const ReadSettingRoute({List<PageRouteInfo>? children})
      : super(
          ReadSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReadSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
