import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

Future<GallerySet> parseGalleryList(String html) async {
  final Document document = parse(html);

  const selectorScript = 'body > script';
  final scriptElm = document.querySelector(selectorScript);
  final scriptText = scriptElm?.text ?? '';

  final blacklistTags =
      RegExp(
        r'blacklisted_tags:\s+\[(.*)\],',
      ).firstMatch(scriptText)?.group(1) ??
      '';
  final blacklistTagsList = blacklistTags
      .split(',')
      .map((e) => e.trim().replaceAll("'", ''))
      .toList();
  logger.t('blacklistTagsList: $blacklistTagsList');

  const usernameSelector = '.username';
  final usernameElm = document.querySelector(usernameSelector);
  final username = usernameElm?.text;
  logger.t('username: $username');

  // The new SvelteKit nhentai frontend wraps search results in
  // `.gallery-grid` while the homepage still uses the legacy
  // `.index-container` markup. Try both, in priority order.
  const selectorPopular =
      '#content > div.container.index-container.index-popular';

  const selectorGalleryListLegacy =
      '#content > div.container.index-container:not(.index-popular)';

  const selectorGalleryListSvelte = '.gallery-grid';

  const selectorFavoriteList = '#favcontainer';

  const selectorGallery = '.gallery:not(.blacklisted)';
  const selectorFavoriteGallery = '.gallery-favorite > .gallery';
  const selectorMaxPage = '.last';

  final Element? popularElm = document.querySelector(selectorPopular);
  final Element? galleryListElm =
      document.querySelector(selectorGalleryListLegacy) ??
          document.querySelector(selectorGalleryListSvelte);
  final Element? favoriteListElm = document.querySelector(selectorFavoriteList);

  final List<Element> galleryElmListOfPopular =
      popularElm?.querySelectorAll(selectorGallery) ?? [];

  final List<Element> galleryElmList =
      galleryListElm?.querySelectorAll(selectorGallery) ?? [];

  final List<Element> favoriteGalleryElmList =
      favoriteListElm?.querySelectorAll(selectorFavoriteGallery) ?? [];

  logger.t('favoriteGalleryElmList.len ${favoriteGalleryElmList.length}');

  // The href can contain other digits (e.g. inside the `q=` UUID), so anchor
  // the match on the explicit `page=` query parameter.
  final lastHref =
      document.querySelector(selectorMaxPage)?.attributes['href'] ?? '';
  final maxPage =
      RegExp(r'[?&]page=(\d+)').firstMatch(lastHref)?.group(1) ??
          RegExp(r'\d+').firstMatch(lastHref)?.group(0) ??
          '1';

  final galleryListFuture = parseGalleryListElm(
    galleryElmList,
    blacklistTagsList,
  );
  final popularListFuture = parseGalleryListElm(
    galleryElmListOfPopular,
    blacklistTagsList,
  );
  final favoriteListFuture = parseGalleryListElm(favoriteGalleryElmList, []);

  final result = await Future.wait([
    galleryListFuture,
    popularListFuture,
    favoriteListFuture,
  ]);

  final galleryList = result[0];
  final popularList = result[1];
  final favoriteList = result[2];

  final gallerySet = GallerySet(
    gallerys: galleryList,
    populars: popularList,
    favorites: favoriteList,
    maxPage: int.parse(maxPage),
  );

  return gallerySet;
}

Future<List<Gallery>> parseGalleryListElm(
  List<Element> galleryElmList,
  List<String> blacklistTagsList,
) async {
  final List<Gallery> galleryList = [];
  for (final Element elm in galleryElmList) {
    // logger.d('elm: ${elm.outerHtml}');

    final captionElm = elm.querySelector('.caption');

    final title = captionElm?.text ?? '';
    final url = elm.querySelector('.cover')?.attributes['href'] ?? '';
    // The current nhentai frontend uses native lazy loading: thumbnail URLs
    // live on `src`, with `data-src` no longer emitted. Fall back to `src`
    // when `data-src` is missing.
    final lazyloadElm = elm.querySelector('.lazyload');
    final thumbUrl = lazyloadElm?.attributes['data-src'] ??
        lazyloadElm?.attributes['src'] ??
        '';
    final imageHeight = int.tryParse(
      lazyloadElm?.attributes['height'] ?? '',
    );
    final imageWidth = int.tryParse(
      lazyloadElm?.attributes['width'] ?? '',
    );

    if (url.isEmpty) {
      continue;
    }

    final gid = RegExp(r'/(\d+)/').firstMatch(url)?.group(1) ?? '';
    final mediaId = RegExp(r'/(\d+)/').firstMatch(thumbUrl)?.group(1) ?? '';

    final ext = RegExp(r'\.(\w+)$').firstMatch(thumbUrl)?.group(1) ?? '';
    // type is a single-letter shorthand (`j`, `p`, `g`, `w`); default to `j`
    // when the URL has no extension we can read.
    final type = ext.isNotEmpty ? ext.substring(0, 1) : 'j';

    // The new SvelteKit frontend no longer emits `data-tags` on gallery
    // elements, so the inline blacklist filter degrades to a no-op here.
    final dataTags = (elm.attributes['data-tags'] ?? '')
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (dataTags.isNotEmpty &&
        dataTags.any((e) => blacklistTagsList.contains(e))) {
      logger.t('$gid $title is blacklisted');
      continue;
    }

    if (gid.isEmpty) {
      continue;
    }

    final Gallery gallery = Gallery(
      gid: int.parse(gid),
      mediaId: mediaId,
      languageCode: getLanguageCode(dataTags),
      simpleTags: await getTags(dataTags),
      title: GalleryTitle(englishTitle: title),
      images: GalleryImages(
        thumbnail: GalleryImage(
          type: type,
          imgHeight: imageHeight,
          imgWidth: imageWidth,
          // Preserve the exact thumbnail URL from the page so we don't have
          // to guess the filename suffix (now `thumb.jpg.webp`, `thumb.webp`,
          // etc., depending on the source format).
          imageUrl: thumbUrl.isNotEmpty ? thumbUrl : null,
        ),
      ),
    );
    galleryList.add(gallery);
  }
  return galleryList;
}

Future<List<Tag>> getTags(List<String> dataTags) async {
  final List<Tag> tags = [];
  for (final String tag in dataTags) {
    final id = int.tryParse(tag) ?? 0;
    final nhTag = objectBoxHelper.findNhTag(id);
    final translated = await objectBoxHelper.findTagTranslateAsync(
      nhTag?.name ?? '',
      namespace: getTagNamespace(nhTag?.type ?? ''),
    );
    final Tag t = Tag(
      id: id,
      name: nhTag?.name,
      translatedName: translated?.translateNameNotMD ?? nhTag?.name ?? '',
    );
    tags.add(t);
  }
  return tags;
}

String? getLanguageCode(List<String> tagIds) {
  if (tagIds.any((e) => e.trim() == '6346')) {
    return 'ja';
  } else if (tagIds.any((e) => e.trim() == '29963')) {
    return 'zh';
  } else if (tagIds.any((e) => e.trim() == '12227')) {
    return 'en';
  } else {
    return null;
  }
}
