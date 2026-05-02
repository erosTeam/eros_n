// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutPage();
    },
  );
}

/// generated route for
/// [AdvancedSettingPage]
class AdvancedSettingRoute extends PageRouteInfo<void> {
  const AdvancedSettingRoute({List<PageRouteInfo>? children})
    : super(AdvancedSettingRoute.name, initialChildren: children);

  static const String name = 'AdvancedSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdvancedSettingPage();
    },
  );
}

/// generated route for
/// [AppearanceSettingPage]
class AppearanceSettingRoute extends PageRouteInfo<void> {
  const AppearanceSettingRoute({List<PageRouteInfo>? children})
    : super(AppearanceSettingRoute.name, initialChildren: children);

  static const String name = 'AppearanceSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppearanceSettingPage();
    },
  );
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
         args: CommentsRouteArgs(key: key, gid: gid, colorScheme: colorScheme),
         initialChildren: children,
       );

  static const String name = 'CommentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentsRouteArgs>();
      return CommentsPage(
        key: args.key,
        gid: args.gid,
        colorScheme: args.colorScheme,
      );
    },
  );
}

class CommentsRouteArgs {
  const CommentsRouteArgs({this.key, required this.gid, this.colorScheme});

  final Key? key;

  final int gid;

  final ColorScheme? colorScheme;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, gid: $gid, colorScheme: $colorScheme}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommentsRouteArgs) return false;
    return key == other.key &&
        gid == other.gid &&
        colorScheme == other.colorScheme;
  }

  @override
  int get hashCode => key.hashCode ^ gid.hashCode ^ colorScheme.hashCode;
}

/// generated route for
/// [DownloadSettingPage]
class DownloadSettingRoute extends PageRouteInfo<void> {
  const DownloadSettingRoute({List<PageRouteInfo>? children})
    : super(DownloadSettingRoute.name, initialChildren: children);

  static const String name = 'DownloadSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DownloadSettingPage();
    },
  );
}

/// generated route for
/// [DownloadsPage]
class DownloadsRoute extends PageRouteInfo<void> {
  const DownloadsRoute({List<PageRouteInfo>? children})
    : super(DownloadsRoute.name, initialChildren: children);

  static const String name = 'DownloadsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DownloadsPage();
    },
  );
}

/// generated route for
/// [FavoritePage]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritePage();
    },
  );
}

/// generated route for
/// [FrontPage]
class FrontRoute extends PageRouteInfo<void> {
  const FrontRoute({List<PageRouteInfo>? children})
    : super(FrontRoute.name, initialChildren: children);

  static const String name = 'FrontRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FrontPage();
    },
  );
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
         args: GalleryRouteArgs(key: key, gid: gid, heroTag: heroTag),
         initialChildren: children,
       );

  static const String name = 'GalleryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryRouteArgs>();
      return GalleryPage(key: args.key, gid: args.gid, heroTag: args.heroTag);
    },
  );
}

class GalleryRouteArgs {
  const GalleryRouteArgs({this.key, required this.gid, this.heroTag});

  final Key? key;

  final int gid;

  final String? heroTag;

  @override
  String toString() {
    return 'GalleryRouteArgs{key: $key, gid: $gid, heroTag: $heroTag}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GalleryRouteArgs) return false;
    return key == other.key && gid == other.gid && heroTag == other.heroTag;
  }

  @override
  int get hashCode => key.hashCode ^ gid.hashCode ^ heroTag.hashCode;
}

/// generated route for
/// [GeneralSettingPage]
class GeneralSettingRoute extends PageRouteInfo<void> {
  const GeneralSettingRoute({List<PageRouteInfo>? children})
    : super(GeneralSettingRoute.name, initialChildren: children);

  static const String name = 'GeneralSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeneralSettingPage();
    },
  );
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HistoryPage();
    },
  );
}

/// generated route for
/// [IndexPage]
class IndexRoute extends PageRouteInfo<void> {
  const IndexRoute({List<PageRouteInfo>? children})
    : super(IndexRoute.name, initialChildren: children);

  static const String name = 'IndexRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IndexPage();
    },
  );
}

/// generated route for
/// [ItemWidthSettingPage]
class ItemWidthSettingRoute extends PageRouteInfo<void> {
  const ItemWidthSettingRoute({List<PageRouteInfo>? children})
    : super(ItemWidthSettingRoute.name, initialChildren: children);

  static const String name = 'ItemWidthSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ItemWidthSettingPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MorePage();
    },
  );
}

/// generated route for
/// [MyLicensePage]
class MyLicenseRoute extends PageRouteInfo<void> {
  const MyLicenseRoute({List<PageRouteInfo>? children})
    : super(MyLicenseRoute.name, initialChildren: children);

  static const String name = 'MyLicenseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyLicensePage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NhWebViewRouteArgs>();
      return NhWebViewPage(
        key: args.key,
        initialUrl: args.initialUrl,
        title: args.title,
      );
    },
  );
}

class NhWebViewRouteArgs {
  const NhWebViewRouteArgs({this.key, required this.initialUrl, this.title});

  final Key? key;

  final String initialUrl;

  final String? title;

  @override
  String toString() {
    return 'NhWebViewRouteArgs{key: $key, initialUrl: $initialUrl, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NhWebViewRouteArgs) return false;
    return key == other.key &&
        initialUrl == other.initialUrl &&
        title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ initialUrl.hashCode ^ title.hashCode;
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
         args: ReadRouteArgs(key: key, index: index, colorScheme: colorScheme),
         initialChildren: children,
       );

  static const String name = 'ReadRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReadRouteArgs>(
        orElse: () => const ReadRouteArgs(),
      );
      return ReadPage(
        key: args.key,
        index: args.index,
        colorScheme: args.colorScheme,
      );
    },
  );
}

class ReadRouteArgs {
  const ReadRouteArgs({this.key, this.index, this.colorScheme});

  final Key? key;

  final int? index;

  final ColorScheme? colorScheme;

  @override
  String toString() {
    return 'ReadRouteArgs{key: $key, index: $index, colorScheme: $colorScheme}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReadRouteArgs) return false;
    return key == other.key &&
        index == other.index &&
        colorScheme == other.colorScheme;
  }

  @override
  int get hashCode => key.hashCode ^ index.hashCode ^ colorScheme.hashCode;
}

/// generated route for
/// [ReadSettingPage]
class ReadSettingRoute extends PageRouteInfo<void> {
  const ReadSettingRoute({List<PageRouteInfo>? children})
    : super(ReadSettingRoute.name, initialChildren: children);

  static const String name = 'ReadSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReadSettingPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({Key? key, required String query, List<PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key, query: query),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>();
      return SearchPage(key: args.key, query: args.query);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key, required this.query});

  final Key? key;

  final String query;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, query: $query}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchRouteArgs) return false;
    return key == other.key && query == other.query;
  }

  @override
  int get hashCode => key.hashCode ^ query.hashCode;
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
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
         args: ThumbRouteArgs(key: key, gid: gid, colorScheme: colorScheme),
         initialChildren: children,
       );

  static const String name = 'ThumbRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThumbRouteArgs>();
      return ThumbPage(
        key: args.key,
        gid: args.gid,
        colorScheme: args.colorScheme,
      );
    },
  );
}

class ThumbRouteArgs {
  const ThumbRouteArgs({this.key, required this.gid, this.colorScheme});

  final Key? key;

  final int gid;

  final ColorScheme? colorScheme;

  @override
  String toString() {
    return 'ThumbRouteArgs{key: $key, gid: $gid, colorScheme: $colorScheme}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ThumbRouteArgs) return false;
    return key == other.key &&
        gid == other.gid &&
        colorScheme == other.colorScheme;
  }

  @override
  int get hashCode => key.hashCode ^ gid.hashCode ^ colorScheme.hashCode;
}

/// generated route for
/// [WebLoginPage]
class WebLoginRoute extends PageRouteInfo<void> {
  const WebLoginRoute({List<PageRouteInfo>? children})
    : super(WebLoginRoute.name, initialChildren: children);

  static const String name = 'WebLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WebLoginPage();
    },
  );
}
