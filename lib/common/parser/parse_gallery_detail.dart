import 'package:collection/collection.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/parser/parse_gallery_list.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/store/db/entity/tag_translate.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart' hide Comment;
import 'package:html/parser.dart' show parse;
import 'package:tuple/tuple.dart';

Future<Gallery> parseGalleryDetail(String html) async {
  final Document document = parse(html);
  // logger.d('html\n$html');

  const selectorScript = 'body > script';
  final scriptElm = document.querySelector(selectorScript);
  final scriptText = scriptElm?.text ?? '';

  final csrfToken =
      RegExp(r'csrf_token:\s+"(.*)",').firstMatch(scriptText)?.group(1) ?? '';

  final titleElms = document.querySelectorAll('#info > .title');
  final title = titleElms.firstOrNull?.text ?? '';
  final jpnTitle = titleElms.lastOrNull?.text ?? '';
  logger.v('title: $title, jpnTitle: $jpnTitle');

  const selectorButtons = '#info > div.buttons';
  final buttonsElms = document.querySelector(selectorButtons);
  final favoriteButtonElm = buttonsElms?.children.first;

  final favoriteText = favoriteButtonElm?.text.trim() ?? '';
  logger.v('favoriteText: $favoriteText');
  final favNum = RegExp(r'\d+').firstMatch(favoriteText)?.group(0) ?? '';

  final favText = favoriteButtonElm?.querySelector('.text')?.text.trim() ?? '';
  logger.v('favText: $favText');
  final isFav = favText.contains('Un');

  logger.v('favNum: $favNum isFav: $isFav');

  final downloadButtonElm = buttonsElms?.children[1];
  final torrentUrl = downloadButtonElm?.attributes['href'] ?? '';
  logger.v('torrentUrl: $torrentUrl');

  const selectorMoreLikeGalleryList = '#related-container';
  const selectorGallery = '.gallery:not(.blacklisted)';
  final moreLikeGalleryElmList = document
          .querySelector(selectorMoreLikeGalleryList)
          ?.querySelectorAll(selectorGallery) ??
      [];
  final moreLikeGalleryList =
      await parseGalleryListElm(moreLikeGalleryElmList, []);

  const selectorThumb = '.gallerythumb';

  final List<Element> galleryThumbsElm =
      document.querySelectorAll(selectorThumb);
  logger.v('galleryThumbsElm ${galleryThumbsElm.length}');

  String? mediaId;

  final List<GalleryImage> galleryImagePages = [];
  // for galleryThumbsElm
  for (final elm in galleryThumbsElm) {
    final href = elm.attributes['href'];
    final thumbUrl = elm.querySelector('img')?.attributes['data-src'] ?? '';
    final imgHeight = elm.querySelector('img')?.attributes['height'];
    final imgWidth = elm.querySelector('img')?.attributes['width'];

    mediaId ??=
        RegExp(r'/galleries/(\d+)/').firstMatch(thumbUrl ?? '')?.group(1);
    // logger.d('mediaId: $mediaId');

    // 扩展名
    final ext = RegExp(r'\.(\w+)$').firstMatch(thumbUrl)?.group(1) ?? '';
    final type = ext.substring(0, 1);

    // logger.d('thumbUrl: $thumbUrl');
    galleryImagePages.add(GalleryImage(
      href: href,
      type: type,
      imgHeight: int.parse(imgHeight ?? '0'),
      imgWidth: int.parse(imgWidth ?? '0'),
    ));
  }

  final thumbImage = GalleryImage(
    type: galleryImagePages.first.type,
    imgHeight: galleryImagePages.first.imgHeight,
    imgWidth: galleryImagePages.first.imgWidth,
  );

  final tuple = parseGalleryTags(document);
  final tags = tuple.item1;
  final uploadedDateTime = tuple.item2;

  final List<Future<Tag>> tagsTranslatedFutures = tags.map((tag) async {
    final TagTranslate? translated = await isarHelper.findTagTranslateAsync(
        tag.name ?? '',
        namespace: getTagNamespace(tag.type ?? ''));
    final translatedName = translated?.translateNameNotMD ?? tag.name ?? '';
    return tag.copyWith(
      translatedName: translatedName,
    );
  }).toList();

  final tagsTranslated = await Future.wait(tagsTranslatedFutures);

  logger.v('tags: $tags');
  logger.v('uploadedDateTime: $uploadedDateTime');

  return Gallery(
    title: GalleryTitle(
      englishTitle: title,
      japaneseTitle: jpnTitle,
    ),
    images: GalleryImages(
      pages: galleryImagePages,
      thumbnail: thumbImage,
    ),
    mediaId: mediaId,
    isFavorited: isFav,
    numFavorites: int.tryParse(favNum) ?? 0,
    moreLikeGallerys: moreLikeGalleryList,
    csrfToken: csrfToken,
    tags: tagsTranslated,
    uploadedDateTime: uploadedDateTime,
  );
}

Tuple2<List<Tag>, String> parseGalleryTags(Document document) {
  const selectorTagGroups = '#tags > .tag-container';

  late final String uploadedDateTime;

  final tagGroupsElm = document.querySelectorAll(selectorTagGroups);
  final tags = <Tag>[];
  for (final groupElm in tagGroupsElm) {
    final tagType =
        (groupElm.nodes.first.text?.trim() ?? '').replaceFirst(':', '');
    // logger.d('tagType: $tagType');
    if (tagType == 'Uploaded') {
      uploadedDateTime =
          groupElm.querySelector('.nobold')?.attributes['datetime'] ?? '';
      continue;
    }

    if (tagType == 'Pages') {
      continue;
    }

    final tagElms = groupElm.querySelectorAll('.tag');
    for (final tagElm in tagElms) {
      final tagId = tagElm.className.trim().split(' ').last.split('-').last;
      final tagName = tagElm.querySelector('.name')?.text.trim() ?? '';
      final tagCount = tagElm.querySelector('.count')?.text.trim() ?? '';
      final tagUrl = tagElm.attributes['href'] ?? '';
      tags.add(Tag(
        id: int.tryParse(tagId) ?? 0,
        name: tagName,
        url: tagUrl,
        type: tagType,
        count: int.tryParse(tagCount) ?? 0,
      ));
    }
  }
  return Tuple2(tags, uploadedDateTime);
}
