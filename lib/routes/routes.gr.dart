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
      final args = routeData.argsAs<IndexRouteArgs>(
          orElse: () => const IndexRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: IndexPage(key: args.key),
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
class IndexRoute extends PageRouteInfo<IndexRouteArgs> {
  IndexRoute({Key? key})
      : super(
          IndexRoute.name,
          path: '/home',
          args: IndexRouteArgs(key: key),
        );

  static const String name = 'IndexRoute';
}

class IndexRouteArgs {
  const IndexRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'IndexRouteArgs{key: $key}';
  }
}

/// generated route for
/// [GalleryPage]
class GalleryRoute extends PageRouteInfo<GalleryRouteArgs> {
  GalleryRoute({
    Key? key,
    String? gid,
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

  final String? gid;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, gid: $gid}';
  }
}
