import 'package:dio/dio.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/palette_generator.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/blur_image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/scrolling_fab.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nil/nil.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:path/path.dart' as path;
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:share/share.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'gallery_provider.dart';
import 'thumb_page.dart';

class GalleryPage extends StatefulHookConsumerWidget {
  const GalleryPage({
    Key? key,
    required this.gid,
    this.heroTag,
  }) : super(key: key);

  final int gid;
  final String? heroTag;

  @override
  ConsumerState<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  late ColorScheme colorScheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    colorScheme = Theme.of(context).colorScheme;
  }

  Color? getSeedColors(PaletteGenerator palette) {
    const int threshold = 30;
    if (palette.vibrantColor?.color != null &&
        (palette.vibrantColor?.population ?? 0) > threshold) {
      return palette.vibrantColor?.color;
    } else if (palette.lightVibrantColor?.color != null &&
        (palette.lightVibrantColor?.population ?? 0) > threshold) {
      return palette.lightVibrantColor?.color;
    } else {
      return palette.dominantColor?.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    final useGalleryTint =
        ref.watch(settingsProvider.select((s) => s.useGalleryTint));
    final thumbUrl =
        ref.watch(galleryProvider(widget.gid).select((g) => g.thumbUrl));
    if (useGalleryTint) {
      final paletteGenerator =
          ref.watch(paletteGeneratorProvider(thumbUrl ?? ''));
      paletteGenerator.whenData((palette) {
        // logger.d(palette);
        final seedColor = getSeedColors(palette);
        if (seedColor == null) {
          return;
        }
        final hslColor = HSLColor.fromColor(seedColor);
        final hsvColor = HSVColor.fromColor(seedColor);
        logger.v('$seedColor, $hslColor, $hsvColor');
        if (hsvColor.hue < 0.1) {
          return;
        }
        final lightColorScheme = ColorScheme.fromSeed(
          seedColor: seedColor.harmonizeWith(Theme.of(context).primaryColor),
        );

        final darkColorScheme = ColorScheme.fromSeed(
          seedColor: seedColor.harmonizeWith(Theme.of(context).primaryColor),
          brightness: Brightness.dark,
        );

        colorScheme = Theme.of(context).brightness == Brightness.light
            ? lightColorScheme
            : darkColorScheme;

        setState(() {});
      });
    }

    return AnimatedTheme(
      data: ThemeData.from(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      child: GalleryPageBody(gid: widget.gid, heroTag: widget.heroTag),
    );
  }
}

class GalleryPageBody extends HookConsumerWidget {
  const GalleryPageBody({
    super.key,
    required this.gid,
    this.heroTag,
  });

  final int gid;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final gallery = ref.read(galleryProvider(gid));
    // logger.v('build gallery $gid ${gallery.title}');

    final thumbUrl = ref.watch(galleryProvider(gid).select((g) => g.thumbUrl));
    final title = ref.watch(galleryProvider(gid).select((g) => g.title));
    final url = ref.watch(galleryProvider(gid).select((g) => g.url));
    final images = ref.watch(galleryProvider(gid).select((g) => g.images));
    final mediaId = ref.watch(galleryProvider(gid).select((g) => g.mediaId));

    final ScrollController scrollController = useScrollController();
    final ScrollController thumbScrollController = useScrollController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.scrolledUnder)) {
            return Theme.of(context).colorScheme.surface;
          }
          return Colors.transparent;
        }),
        // systemOverlayStyle: Theme.of(context).brightness == Brightness.light
        //     ? SystemUiOverlayStyle.dark
        //     : SystemUiOverlayStyle.light,
        // systemOverlayStyle: Theme.of(context).brightness == Brightness.light
        //     ? const SystemUiOverlayStyle(
        //         systemNavigationBarColor: Colors.transparent,
        //         systemNavigationBarDividerColor: Colors.transparent,
        //         systemNavigationBarIconBrightness: Brightness.dark,
        //         statusBarColor: Colors.transparent,
        //         // statusBarIconBrightness: Brightness.dark,
        //       )
        //     : const SystemUiOverlayStyle(
        //         systemNavigationBarColor: Colors.transparent,
        //         systemNavigationBarDividerColor: Colors.transparent,
        //         statusBarColor: Colors.transparent,
        //         // statusBarIconBrightness: Brightness.light,
        //       ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          statusBarColor: Colors.transparent,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final shareText = 'title:${title.englishTitle}\n$url';
              logger.d(shareText);
              Share.share(shareText);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: ScrollingFab(
        onPressed: () {
          RouteUtil.goRead(context, ref);
        },
        scrollController: scrollController,
        label: Consumer(builder: (context, ref, child) {
          final currentPageIndex =
              ref.watch(galleryProvider(gid).select((g) => g.currentPageIndex));
          final label = currentPageIndex == 0
              ? L10n.of(context).read
              : '${L10n.of(context).resume} ${currentPageIndex + 1}';
          return Text(label);
        }),
        icon: const Icon(Icons.play_arrow),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final large = context.isTablet;

        const kMinWidget = 386.0;

        final widget =
            maxWidth / 2 - kMinWidget > 50 ? kMinWidget : maxWidth / 2;

        return Row(
          children: [
            AnimatedContainer(
              width: large ? widget : maxWidth,
              duration: const Duration(milliseconds: 400),
              child: GalleryDetailBody(
                gid: gid,
                scrollController: scrollController,
                title: title,
                heroTag: heroTag,
                thumbUrl: thumbUrl,
                images: images,
                backGround: _BackGround(thumbUrl: thumbUrl),
                large: large,
              ),
            ),
            if (large)
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: context.isTablet ? 420 : 460,
                      child: _BackGround(thumbUrl: thumbUrl),
                    ),
                    SafeArea(
                      bottom: false,
                      child: ThumbBody(
                        gid: gid,
                        scrollController: thumbScrollController,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround({
    required this.thumbUrl,
  });

  final String? thumbUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Theme.of(context).canvasColor,
              // Colors.black,
              Colors.transparent,
              Theme.of(context).canvasColor,
              // Colors.white,
            ]).createShader(
          Rect.fromLTRB(0, 0, bounds.width, bounds.height - 0),
        );
      },
      blendMode: BlendMode.dstOut,
      child: ClipRect(
        child: BlurImage(
          sigma: 4,
          color: Theme.of(context).canvasColor.withOpacity(0.5),
          child: thumbUrl != null
              ? ErosCachedNetworkImage(
                  imageUrl: thumbUrl,
                  filterQuality: FilterQuality.medium,
                  fit: BoxFit.cover,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class GalleryDetailBody extends HookConsumerWidget {
  const GalleryDetailBody({
    super.key,
    required this.gid,
    required this.scrollController,
    required this.title,
    required this.heroTag,
    required this.thumbUrl,
    required this.images,
    this.backGround,
    this.large = false,
  });

  final int gid;
  final ScrollController scrollController;
  final GalleryTitle title;
  final String? heroTag;
  final String? thumbUrl;
  final GalleryImages images;
  final Widget? backGround;
  final bool large;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: ref.read(galleryProvider(gid).notifier).reloadData,
      edgeOffset: MediaQuery.of(context).padding.top,
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.isTablet ? 420 : 460,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  backGround ?? const SizedBox(),
                  Container(
                    padding: EdgeInsets.only(
                      left: context.mediaQueryPadding.left + 16,
                      right: context.mediaQueryPadding.right + 16,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelectableText(
                          title.englishTitle ?? '',
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: context.isTablet ? 2 : 3,
                          minLines: 1,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          height: 240,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 封面
                              Container(
                                width: 140,
                                margin: const EdgeInsets.only(right: 12),
                                alignment: Alignment.center,
                                child: Hero(
                                  tag: '${heroTag ?? ''}_$thumbUrl',
                                  child: Card(
                                    margin: const EdgeInsets.all(0),
                                    clipBehavior: Clip.antiAlias,
                                    child: AspectRatio(
                                      aspectRatio: (images.thumbnail.imgWidth ??
                                              300) /
                                          (images.thumbnail.imgHeight ?? 400),
                                      child: thumbUrl == null
                                          ? nil
                                          : ErosCachedNetworkImage(
                                              imageUrl: thumbUrl,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: HeadInfoView(gid: gid, context: context),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ThumbsView(gid: gid),
          DetailView(
            gid: gid,
            showThumbs: !large,
          ),
        ],
      ),
    );
  }
}

class HeadInfoView extends StatelessWidget {
  const HeadInfoView({
    super.key,
    required this.gid,
    required this.context,
  });

  final int gid;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          // 副标题
          Consumer(
            builder: (context, ref, child) {
              final japaneseTitle =
                  ref.watch(galleryProvider(gid)).title.japaneseTitle;
              return SelectableText(
                japaneseTitle ?? '',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.start,
                minLines: 1,
                maxLines: 2,
              );
            },
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 2,
            children: [
              Text(
                '#$gid',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Consumer(builder: (context, ref, child) {
                    final numFavorites =
                        ref.watch(galleryProvider(gid)).numFavorites;
                    return Text(
                      '${numFavorites ?? '··'}',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.start,
                    );
                  }),
                ],
              ),
              Consumer(builder: (context, ref, child) {
                final uploadedDate =
                    ref.watch(galleryProvider(gid)).uploadedDate;
                final uploadedDateStr = uploadedDate != null
                    ? DateFormat('yyyy-MM-dd').format(uploadedDate)
                    : '··';
                return Text(
                  uploadedDateStr,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                );
              }),
            ],
          ),
          const SizedBox(height: 8),
          // 作者
          Expanded(
            child: SingleChildScrollView(
              child: Consumer(builder: (context, ref, child) {
                final isTagTranslate = ref.watch(
                    settingsProvider.select((value) => value.isTagTranslate));

                final artistTags = ref
                    .watch(galleryProvider(gid))
                    .tags
                    .where((e) => e.type == 'Artists')
                    .toList();

                final textStyle = Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.primary);

                final artistTagsWidgets = artistTags
                    .map((tag) => TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          RouteUtil.goSearch(tag: tag);
                        },
                        child: isTagTranslate
                            ? Text(
                                tag.translatedName ?? tag.name ?? '',
                                style: textStyle,
                              )
                            : Text(tag.name ?? '', style: textStyle)))
                    .toList();

                // with separator
                final artistTagsWidgetsWithSeparator = artistTagsWidgets
                    .expand((element) => [
                          element,
                          Text('/',
                              style: Theme.of(context).textTheme.bodySmall)
                        ])
                    .toList();

                // remove last separator
                if (artistTagsWidgetsWithSeparator.isNotEmpty) {
                  artistTagsWidgetsWithSeparator.removeLast();
                }

                return Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  runAlignment: WrapAlignment.center,
                  children: artistTagsWidgetsWithSeparator,
                );
              }),
            ),
          ),

          ToolBarView(gid: gid),
        ],
      ),
    );
  }
}

class DetailView extends HookConsumerWidget {
  const DetailView({
    Key? key,
    required this.gid,
    this.showThumbs = true,
  }) : super(key: key);

  final int gid;
  final bool showThumbs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageStatus =
        ref.watch(pageStateProvider(gid).select((state) => state.pageStatus));
    logger.v('DetailView build $pageStatus');
    if (pageStatus == PageStatus.loading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SliverSafeArea(
        top: false,
        bottom: false,
        sliver: MultiSliver(children: [
          TagsView(gid: gid),
          if (kDebugMode) PaletteGeneratorWidget(gid: gid),
          if (showThumbs) const SizedBox(height: 8),
          if (showThumbs) ThumbListView(gid: gid),
          const SizedBox(height: 8),
          MoreLikeListView(gid: gid),
          const SizedBox(height: 8),
          CommentsListView(gid: gid),
          const SizedBox(height: 150),
        ]),
      );
    }
  }
}

class PaletteGeneratorWidget extends HookConsumerWidget {
  const PaletteGeneratorWidget({
    Key? key,
    required this.gid,
  }) : super(key: key);
  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbUrl = ref.watch(galleryProvider(gid).select((g) => g.thumbUrl));
    final paletteGenerator =
        ref.watch(paletteGeneratorProvider(thumbUrl ?? ''));
    return MultiSliver(children: [
      ListTile(
        title: const Text('PaletteGenerator (debug)'),
        subtitle: SizedBox(
          height: 100,
          child: paletteGenerator.when(
              data: (pg) => Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.dominantColor?.color,
                              ),
                            ),
                            Text(
                              'dm',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.dominantColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // vibrantColor
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.vibrantColor?.color,
                              ),
                            ),
                            Text(
                              'vibrant',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.vibrantColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // lightVibrantColor
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.lightVibrantColor?.color,
                              ),
                            ),
                            Text(
                              'lightV',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.lightVibrantColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // darkVibrantColor
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.darkVibrantColor?.color,
                              ),
                            ),
                            Text(
                              'darkV',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.darkVibrantColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // mutedColor
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.mutedColor?.color,
                              ),
                            ),
                            Text(
                              'muted',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.mutedColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // lightMutedColor
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.lightMutedColor?.color,
                              ),
                            ),
                            Text(
                              'lightM',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.lightMutedColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      // darkMutedColor
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: pg.darkMutedColor?.color,
                              ),
                            ),
                            Text(
                              'darkM',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${pg.darkMutedColor?.population}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              error: (_, __) => nil,
              loading: () => nil),
        ),
      ),
    ]);
  }
}

class TagsView extends HookConsumerWidget {
  const TagsView({
    Key? key,
    required this.gid,
  }) : super(key: key);

  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(galleryProvider(gid)).tags;
    // tags group by type
    final tagsGroupByType = <String, List<Tag>>{};
    for (final tag in tags) {
      if (tag.type == 'Artists') {
        continue;
      }

      if (tagsGroupByType.containsKey(tag.type)) {
        tagsGroupByType[tag.type]?.add(tag);
      } else {
        tagsGroupByType[tag.type!] = [tag];
      }
    }

    const buttonPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 3);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(
        children: tagsGroupByType.entries.map((entry) {
          final type = entry.key;
          final tags = entry.value;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: buttonPadding,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                child: Text(
                  // type,
                  _getTagTypeTranslate(context, type),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tags.map((Tag tag) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: buttonPadding,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Consumer(builder: (context, ref, child) {
                        final isTagTranslate = ref.watch(settingsProvider
                            .select((value) => value.isTagTranslate));
                        return Text(
                          isTagTranslate
                              ? tag.translatedName ?? ''
                              : tag.name ?? '',
                        );
                      }),
                      onPressed: () {
                        RouteUtil.goSearch(tag: tag);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ).paddingOnly(bottom: 8);
        }).toList(),
      ),
    );
  }
}

String _getTagTypeTranslate(BuildContext context, String tagType) {
  switch (tagType) {
    case 'Parodies':
      return L10n.of(context).tag_type_parodies;
    case 'Characters':
      return L10n.of(context).tag_type_characters;
    case 'Tags':
      return L10n.of(context).tag_type_tags;
    case 'Artists':
      return L10n.of(context).tag_type_artists;
    case 'Groups':
      return L10n.of(context).tag_type_groups;
    case 'Languages':
      return L10n.of(context).tag_type_languages;
    case 'Categories':
      return L10n.of(context).tag_type_categories;
    default:
      return tagType;
  }
}

class ThumbListView extends HookConsumerWidget {
  const ThumbListView({
    Key? key,
    required this.gid,
  }) : super(key: key);

  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.v('ThumbListView build');
    final pages = ref
        .watch(galleryProvider(gid).select((gallery) => gallery.images.pages));
    final mediaId =
        ref.watch(galleryProvider(gid).select((gallery) => gallery.mediaId));
    return MultiSliver(
      children: [
        ListTile(
          title: Text(L10n.of(context).thumbs),
          trailing: Text(
            '${L10n.of(context).more} ${pages.length}',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          onTap: () {
            erosRouter.push(ThumbRoute(
              gid: gid,
              colorScheme: Theme.of(context).colorScheme,
            ));
          },
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: pages.length,
            separatorBuilder: (context, index) => const SizedBox(width: 0),
            itemBuilder: (context, index) {
              final GalleryImage image = pages[index];
              return Consumer(
                  child: GestureDetector(
                    onTap: () async {
                      RouteUtil.goRead(context, ref, index: index);
                    },
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: image.imgWidth! / image.imgHeight!,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Hero(
                            tag: '${gid}_$index',
                            child: mediaId == null
                                ? nil
                                : ErosCachedNetworkImage(
                                    imageUrl:
                                        'https://t.nhentai.net/galleries/$mediaId/${index + 1}t.${NHConst.extMap[image.type]}',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  builder: (context, ref, child) {
                    final currentIndex = ref.watch(galleryProvider(gid)
                        .select((gallery) => gallery.currentPageIndex));
                    return HeroMode(
                      enabled: true,
                      child: child!,
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}

class MoreLikeListView extends HookConsumerWidget {
  const MoreLikeListView({
    Key? key,
    required this.gid,
  }) : super(key: key);

  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moreLikeGallerys = ref.watch(galleryProvider(gid)).moreLikeGallerys;
    final heroTag = useMemoized(() => 'more_like_$gid');
    return MultiSliver(
      children: [
        ListTile(title: Text(L10n.of(context).more_like_this)),
        SizedBox(
          height: 280,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: moreLikeGallerys.length,
            separatorBuilder: (context, index) => const SizedBox(width: 0),
            itemBuilder: (context, index) {
              final likeGallery = moreLikeGallerys[index];
              final aspectRatio = likeGallery.images.thumbnail.imgWidth! /
                  likeGallery.images.thumbnail.imgHeight!;
              return GestureDetector(
                onTap: () {
                  RouteUtil.goGallery(ref, likeGallery, heroTag: heroTag);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: aspectRatio,
                          child: Hero(
                            tag: '${heroTag}_${likeGallery.thumbUrl}',
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                foregroundDecoration:
                                    (likeGallery.languageCode == 'ja' ||
                                            likeGallery.languageCode == null)
                                        ? null
                                        : RotatedCornerDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.8),
                                            geometry: const BadgeGeometry(
                                                width: 38, height: 28),
                                            textSpan: TextSpan(
                                              text: likeGallery.languageCode
                                                      ?.toUpperCase() ??
                                                  '',
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                child: ErosCachedNetworkImage(
                                  imageUrl: likeGallery.thumbUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: aspectRatio * 200,
                      child: Text(
                        likeGallery.title.englishTitle ?? '',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CommentsListView extends HookConsumerWidget {
  const CommentsListView({
    Key? key,
    required this.gid,
  }) : super(key: key);

  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(galleryProvider(gid)).comments;

    return MultiSliver(
      children: [
        ListTile(
          title: Text(L10n.of(context).comments),
          trailing: Text(
            '${L10n.of(context).more} ${comments.length}',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          onTap: () {
            erosRouter.push(CommentsRoute(
              gid: gid,
              colorScheme: Theme.of(context).colorScheme,
            ));
          },
        ),
        if (comments.isEmpty)
          const SizedBox(height: 8)
        else
          SizedBox(
            height: 190,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: comments.length,
              separatorBuilder: (context, index) => const SizedBox(width: 0),
              itemBuilder: (context, index) {
                final Comment comment = comments[index];
                final date = DateTime.fromMillisecondsSinceEpoch(
                    (comment.postDate ?? 0) * 1000);
                final dateFormatted =
                    DateFormat('yyyy-MM-dd HH:mm').format(date.toLocal());
                return SizedBox(
                  width: 280,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        erosRouter.push(CommentsRoute(
                            gid: gid,
                            colorScheme: Theme.of(context).colorScheme));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: SizedBox(
                                      height: 48,
                                      width: 48,
                                      child: ErosCachedNetworkImage(
                                        imageUrl:
                                            'https://i.${NHConst.baseHost}/${comment.poster?.avatarUrl ?? ''}',
                                        fit: BoxFit.cover,
                                        placeholder: (_, __) => Container(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    comment.poster?.username ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 8, top: 12),
                                child: Text(
                                  comment.commentText ?? '',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  // textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 0.9,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                dateFormatted,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class ToolBarView extends HookConsumerWidget {
  const ToolBarView({Key? key, required this.gid}) : super(key: key);

  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 28.0;
    final gallery = ref.watch(galleryProvider(gid));
    final isUserLogin = ref.watch(userProvider.select((user) => user.isLogin));
    return Container(
      padding: context.isTablet
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisAlignment: context.isTablet
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.download_outlined, size: iconSize),
            color: Theme.of(context).colorScheme.primary,
            // color: Colors.blue
            //     .harmonizeWith(Theme.of(context).colorScheme.primary),
            onPressed: () {},
          ),
          IconButton(
            icon:
                const Icon(Icons.energy_savings_leaf_outlined, size: iconSize),
            color: Theme.of(context).colorScheme.primary,
            // color: Colors.green
            //     .harmonizeWith(Theme.of(context).colorScheme.primary),
            onPressed: isUserLogin
                ? () async {
                    // launch torrent
                    // logger.d('launch torrent ${NHConst.baseUrl}${gallery.torrentUrl}');
                    // launchUrlString('${NHConst.baseUrl}${gallery.torrentUrl}');

                    // final savePathFB =
                    //     path.joinAll([Global.extStorePath, gallery.gid ?? '']);
                    late String savePath;

                    await nhDownload(
                        url: '/g/${gallery.gid}/download',
                        savePath: (Headers headers) {
                          logger.d(headers);
                          final contentDisposition =
                              headers.value('content-disposition');
                          final filename = contentDisposition
                                  ?.split(RegExp(r"filename(=|\*=UTF-8'')"))
                                  .last ??
                              '';
                          final fileNameDecode =
                              Uri.decodeFull(filename).replaceAll('/', '_');
                          logger.d(fileNameDecode);
                          savePath = path.joinAll([
                            Global.tempPath,
                            'torrent',
                            '${gallery.gid}',
                            fileNameDecode
                          ]);
                          return savePath;
                        });
                    Share.shareFiles([savePath]);
                  }
                : null,
          ),
          // 收藏按钮
          IconButton(
            icon: (gallery.isFavorited ?? false)
                ? const Icon(Icons.favorite, size: iconSize)
                : const Icon(Icons.favorite_border_outlined, size: iconSize),
            color: Theme.of(context).colorScheme.primary,
            // color: Colors.redAccent
            //     .harmonizeWith(Theme.of(context).colorScheme.primary),
            onPressed: isUserLogin
                ? () {
                    ref.read(galleryProvider(gid).notifier).toggleFavorite();
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
