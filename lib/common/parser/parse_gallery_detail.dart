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
  logger.t('title: $title, jpnTitle: $jpnTitle');

  const selectorButtons = '#info > div.buttons';
  final buttonsElms = document.querySelector(selectorButtons);
  final favoriteButtonElm = buttonsElms?.children.first;

  final favoriteText = favoriteButtonElm?.text.trim() ?? '';
  logger.t('favoriteText: $favoriteText');
  final favNum = RegExp(r'\d+').firstMatch(favoriteText)?.group(0) ?? '';

  final favText = favoriteButtonElm?.querySelector('.text')?.text.trim() ?? '';
  logger.t('favText: $favText');
  final isFav = favText.contains('Un');

  logger.t('favNum: $favNum isFav: $isFav');

  final downloadButtonElm = buttonsElms?.children[1];
  final torrentUrl = downloadButtonElm?.attributes['href'] ?? '';
  logger.t('torrentUrl: $torrentUrl');

  const selectorMoreLikeGalleryList = '#related-container';
  const selectorGallery = '.gallery:not(.blacklisted)';
  final moreLikeGalleryElmList =
      document
          .querySelector(selectorMoreLikeGalleryList)
          ?.querySelectorAll(selectorGallery) ??
      [];
  final moreLikeGalleryList = await parseGalleryListElm(
    moreLikeGalleryElmList,
    [],
  );

  const selectorThumb = '.gallerythumb';

  final List<Element> galleryThumbsElm = document.querySelectorAll(
    selectorThumb,
  );
  logger.t('galleryThumbsElm ${galleryThumbsElm.length}');

  String? mediaId;

  final List<GalleryImage> galleryImagePages = [];
  for (final elm in galleryThumbsElm) {
    final href = elm.attributes['href'];
    final imgElm = elm.querySelector('img');
    // SvelteKit no longer lazy-loads via `data-src`; the real URL sits on
    // `src` directly. Keep `data-src` as a fallback for the legacy frontend.
    final thumbUrl =
        imgElm?.attributes['data-src'] ?? imgElm?.attributes['src'] ?? '';
    final imgHeight = int.tryParse(imgElm?.attributes['height'] ?? '');
    final imgWidth = int.tryParse(imgElm?.attributes['width'] ?? '');

    mediaId ??= RegExp(r'/galleries/(\d+)/').firstMatch(thumbUrl)?.group(1);

    // Filenames look like `1t.webp`, `2t.jpg.webp`, or even `4t.webp.webp`.
    // The first extension after the page-token marker is the original page
    // format (jpg/png/gif/webp); whatever comes after is just the cdn's
    // webp-transcoded variant. We need the original to derive the full-size
    // image URL (`{page}.{ext}`).
    final extMatch = RegExp(r'/\d+t\.([A-Za-z0-9]+)').firstMatch(thumbUrl);
    final ext = extMatch?.group(1) ?? 'webp';
    final type = ext.isNotEmpty ? ext.substring(0, 1) : 'w';

    galleryImagePages.add(
      GalleryImage(
        href: href,
        type: type,
        imgHeight: imgHeight,
        imgWidth: imgWidth,
        // Preserve the actual thumbnail URL so the thumb grid can render
        // without having to reverse-engineer the filename suffix.
        imageUrl: thumbUrl.isNotEmpty ? thumbUrl : null,
      ),
    );
  }

  final firstPage = galleryImagePages.firstOrNull;
  final thumbImage = GalleryImage(
    type: firstPage?.type ?? 'w',
    imgHeight: firstPage?.imgHeight,
    imgWidth: firstPage?.imgWidth,
  );

  final tuple = parseGalleryTags(document);
  final tags = tuple.item1;
  final uploadedDateTime = tuple.item2;

  final List<Future<Tag>> tagsTranslatedFutures = tags.map((tag) async {
    final TagTranslate? translated = await objectBoxHelper
        .findTagTranslateAsync(
          tag.name ?? '',
          namespace: getTagNamespace(tag.type ?? ''),
        );
    final translatedName = translated?.translateNameNotMD ?? tag.name ?? '';
    return tag.copyWith(translatedName: translatedName);
  }).toList();

  final tagsTranslated = await Future.wait(tagsTranslatedFutures);

  logger.t('tags: $tags');
  logger.t('uploadedDateTime: $uploadedDateTime');

  return Gallery(
    title: GalleryTitle(englishTitle: title, japaneseTitle: jpnTitle),
    images: GalleryImages(pages: galleryImagePages, thumbnail: thumbImage),
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
    final tagType = (groupElm.nodes.first.text?.trim() ?? '').replaceFirst(
      ':',
      '',
    );
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
      tags.add(
        Tag(
          id: int.tryParse(tagId) ?? 0,
          name: tagName,
          url: tagUrl,
          type: tagType,
          count: int.tryParse(tagCount) ?? 0,
        ),
      );
    }
  }
  return Tuple2(tags, uploadedDateTime);
}
