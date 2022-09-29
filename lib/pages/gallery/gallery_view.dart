import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/comment.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/blur_image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/component/widget/scrolling_fab.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:share/share.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'gallery_provider.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({
    super.key,
    this.gid,
  });

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.read(galleryProvider(gid));
    logger.v('build gallery $gid ${gallery.title}');

    late ScrollController scrollController;
    useEffect(() {
      scrollController = ScrollController();
      return scrollController.dispose;
    });

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
            sigma: context.isTablet ? 4 : 2,
            color: Theme.of(context).canvasColor.withOpacity(0.4),
            child: ErosCachedNetworkImage(
              imageUrl: gallery.thumbUrl ?? '',
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
              // color:
              //     Theme.of(context).colorScheme.background.withOpacity(0.5),
              // colorBlendMode: BlendMode.lighten,
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
              if (gallery.title != null) {
                final shareText =
                    '${gallery.title}  ${NHConst.baseUrl}${gallery.url}';
                logger.d(shareText);
                Share.share(shareText);
              }
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
          // ref.read(galleryProvider(gid).notifier).setInitialPage(index);
          context.router.push(ReadRoute(gid: gid));
        },
        scrollController: scrollController,
        label: Text(L10n.of(context).read),
        icon: const Icon(Icons.play_arrow),
      ),
      body: RefreshIndicator(
        onRefresh: ref.read(galleryProvider(gid).notifier).reloadData,
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 340,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    backGround(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          height: 240,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 封面
                              Container(
                                width: 140,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.center,
                                child: Hero(
                                  tag: gallery.thumbUrl ?? '',
                                  child: Card(
                                    margin: const EdgeInsets.all(0),
                                    clipBehavior: Clip.antiAlias,
                                    child: AspectRatio(
                                      aspectRatio: (gallery.thumbWidth ?? 300) /
                                          (gallery.thumbHeight ?? 400),
                                      child: ErosCachedNetworkImage(
                                        imageUrl: gallery.thumbUrl ?? '',
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
          // 主标题
          SelectableText(
            gallery.title ?? '',
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.3),
            maxLines: 4,
            minLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // 画廊id
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '#${gallery.gid}',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.start,
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.favorite,
                size: 12,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 4),
              Consumer(builder: (context, ref, child) {
                final favoritedNum =
                    ref.watch(galleryProvider(gid)).favoritedNum;
                return Text(
                  favoritedNum ?? '··',
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.start,
                );
              }),
              const SizedBox(width: 16),
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
          // 副标题
          Consumer(
            builder: (context, ref, child) {
              final secondTitle = ref.watch(galleryProvider(gid)).secondTitle;
              return SelectableText(
                secondTitle ?? '',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.start,
                minLines: 1,
                maxLines: 2,
              );
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                logger.v('constraints $constraints');
                if (constraints.maxHeight > 60 && constraints.maxWidth > 100) {
                  return ToolBarView(gid: gid);
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailView extends HookConsumerWidget {
  const DetailView({
    Key? key,
    this.gid,
  }) : super(key: key);

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageStatus =
        ref.watch(pageStateProvider(gid).select((state) => state.pageStatus));
    if (pageStatus == PageStatus.loading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MultiSliver(children: [
        TagsView(gid: gid),
        const SizedBox(height: 8),
        ThumbListView(gid: gid),
        const SizedBox(height: 8),
        MoreLikeListView(gid: gid),
        const SizedBox(height: 8),
        CommentsListView(gid: gid),
        const SizedBox(height: 150),
      ]);
    }
  }
}

class TagsView extends HookConsumerWidget {
  const TagsView({
    Key? key,
    this.gid,
  }) : super(key: key);

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(galleryProvider(gid)).tags;
    // tags group by type
    final tagsGroupByType = useMemoized(() {
      final tagsGroupByType = <String, List<Tag>>{};
      for (final tag in tags) {
        if (tagsGroupByType.containsKey(tag.type)) {
          tagsGroupByType[tag.type]?.add(tag);
        } else {
          tagsGroupByType[tag.type!] = [tag];
        }
      }
      return tagsGroupByType;
    });

    const buttonPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 4);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      sliver: MultiSliver(
        children: tagsGroupByType.entries.map((entry) {
          final type = entry.key;
          final tags = entry.value;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  type,
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
                      ),
                      child: Text(
                        tag.name ?? '',
                      ),
                      onPressed: () {
                        // ref.read(searchProvider).searchByTag(tag);
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

class ThumbListView extends HookConsumerWidget {
  const ThumbListView({
    Key? key,
    this.gid,
  }) : super(key: key);

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.read(galleryProvider(gid)).images;
    return MultiSliver(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                L10n.of(context).thumbs,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                  onPressed: () {
                    erosRouter.push(ThumbRoute(gid: gid));
                  },
                  child: Text(
                    '${L10n.of(context).more} ${images.length}',
                    style: Theme.of(context).textTheme.caption,
                  )),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) => const SizedBox(width: 0),
            itemBuilder: (context, index) {
              final image = images[index];
              return GestureDetector(
                onTap: () {
                  ref.read(galleryProvider(gid).notifier).setInitialPage(index);
                  context.router.push(ReadRoute(gid: gid));
                },
                child: Center(
                  child: AspectRatio(
                    aspectRatio: image.thumbWidth! / image.thumbHeight!,
                    child: Card(
                      // margin: const EdgeInsets.all(0),
                      clipBehavior: Clip.antiAlias,
                      child: Hero(
                        tag: '${gid}_$index',
                        child: ErosCachedNetworkImage(
                          imageUrl: image.thumbUrl ?? '',
                          fit: BoxFit.cover,
                        ),
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

class MoreLikeListView extends HookConsumerWidget {
  const MoreLikeListView({
    Key? key,
    this.gid,
  }) : super(key: key);

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moreLikeGallerys = ref.read(galleryProvider(gid)).moreLikeGallerys;
    return MultiSliver(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                L10n.of(context).more_like_this,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: moreLikeGallerys.length,
            separatorBuilder: (context, index) => const SizedBox(width: 0),
            itemBuilder: (context, index) {
              final likeGallery = moreLikeGallerys[index];
              final aspectRatio =
                  likeGallery.thumbWidth! / likeGallery.thumbHeight!;
              return GestureDetector(
                onTap: () {
                  ref
                      .read(galleryProvider(likeGallery.gid).notifier)
                      .initFromGallery(likeGallery);
                  context.router.push(GalleryRoute(gid: likeGallery.gid));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: aspectRatio,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: ErosCachedNetworkImage(
                              imageUrl: likeGallery.thumbUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: aspectRatio * 200,
                      child: Text(
                        likeGallery.title ?? '',
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
    this.gid,
  }) : super(key: key);

  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(galleryProvider(gid)).comments;

    return MultiSliver(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                L10n.of(context).comments,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                  onPressed: () {
                    erosRouter.push(CommentsRoute(gid: gid));
                  },
                  child: Text(
                    '${L10n.of(context).more} ${comments.length}',
                    style: Theme.of(context).textTheme.caption,
                  )),
            ],
          ),
        ),
        if (comments.isEmpty)
          const SizedBox(height: 8)
        else
          Container(
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
                return InkWell(
                  onTap: () {
                    erosRouter.push(CommentsRoute(gid: gid));
                  },
                  child: Container(
                    width: 280,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
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

  final String? gid;

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
                        url: '${gallery.torrentUrl}',
                        savePath: (Headers headers) {
                          logger.d(headers);
                          final contentDisposition =
                              headers.value('content-disposition');
                          final filename = contentDisposition
                                  ?.split(RegExp(r"filename(=|\*=UTF-8'')"))
                                  .last ??
                              '';
                          final fileNameDecode = Uri.decodeFull(filename ?? '')
                              .replaceAll('/', '_');
                          logger.d(fileNameDecode);
                          savePath = path.joinAll([
                            Global.tempPath,
                            'torrent',
                            gallery.gid ?? '',
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
