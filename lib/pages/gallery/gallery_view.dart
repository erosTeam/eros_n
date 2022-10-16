import 'package:dio/dio.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:share/share.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'gallery_provider.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({
    super.key,
    required this.gid,
    this.heroTag,
  });

  final int gid;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.read(galleryProvider(gid));
    // 避免 currentPageIndex 变化时，重新构建 GalleryPage
    // final Gallery gallery = ref.watch(galleryProvider(gid)
    //     .select((gallery) => gallery.copyWith(currentPageIndex: 0)));
    logger.v('build gallery $gid ${gallery.title}');

    final ScrollController scrollController = useScrollController();

    Widget backGround() {
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
            // sigma: context.isTablet ? 4 : 4,
            sigma: 4,
            color: Theme.of(context).canvasColor.withOpacity(0.5),
            child: ErosCachedNetworkImage(
              imageUrl: gallery.thumbUrl,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

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
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final shareText =
                  '${gallery.title}  ${NHConst.baseUrl}${gallery.url}';
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
          RouteUtil.goRead(ref);
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
      body: RefreshIndicator(
        onRefresh: ref.read(galleryProvider(gid).notifier).reloadData,
        edgeOffset: MediaQuery.of(context).padding.top,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: context.isTablet ? 400 : 460,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    backGround(),
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
                            gallery.title.englishTitle ?? '',
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
                                    tag: '${heroTag ?? ''}_${gallery.thumbUrl}',
                                    child: Card(
                                      margin: const EdgeInsets.all(0),
                                      clipBehavior: Clip.antiAlias,
                                      child: AspectRatio(
                                        aspectRatio: (gallery.images.thumbnail
                                                    .imgWidth ??
                                                300) /
                                            (gallery.images.thumbnail
                                                    .imgHeight ??
                                                400),
                                        child: ErosCachedNetworkImage(
                                          imageUrl: gallery.thumbUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: buildGalleryInfo(gallery, context),
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
            DetailView(gid: gid),
          ],
        ),
      ),
    );
  }

  Widget buildGalleryInfo(Gallery gallery, BuildContext context) {
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
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.start,
                minLines: 1,
                maxLines: 2,
              );
            },
          ),
          const SizedBox(height: 8),
          Wrap(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            runSpacing: 2,
            children: [
              Text(
                '#${gallery.gid}',
                style: Theme.of(context).textTheme.caption,
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
                      style: Theme.of(context).textTheme.caption,
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
                  style: Theme.of(context).textTheme.caption,
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
                          Text('/', style: Theme.of(context).textTheme.caption)
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
  }) : super(key: key);

  final int gid;

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
          const SizedBox(height: 8),
          ThumbListView(gid: gid),
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            erosRouter.push(ThumbRoute(gid: gid));
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
                      RouteUtil.goRead(ref, index: index);
                    },
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: image.imgWidth! / image.imgHeight!,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Hero(
                            tag: '${gid}_$index',
                            child: ErosCachedNetworkImage(
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
                                  imageUrl: likeGallery.thumbUrl,
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            erosRouter.push(CommentsRoute(gid: gid));
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
                        erosRouter.push(CommentsRoute(gid: gid));
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
            onPressed: () {},
          ),
          IconButton(
            icon:
                const Icon(Icons.energy_savings_leaf_outlined, size: iconSize),
            color: Theme.of(context).colorScheme.primary,
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
