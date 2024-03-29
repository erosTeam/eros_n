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

  final blacklistTags = RegExp(r'blacklisted_tags:\s+\[(.*)\],')
          .firstMatch(scriptText)
          ?.group(1) ??
      '';
  final blacklistTagsList = blacklistTags
      .split(',')
      .map((e) => e.trim().replaceAll("'", ''))
      .toList();
  logger.v('blacklistTagsList: $blacklistTagsList');

  const usernameSelector = '.username';
  final usernameElm = document.querySelector(usernameSelector);
  final username = usernameElm?.text;
  logger.v('username: $username');

  const selectorPopular =
      '#content > div.container.index-container.index-popular';

  const selectorGalleryList =
      '#content > div.container.index-container:not(.index-popular)';

  const selectorFavoriteList = '#favcontainer';

  const selectorGallery = '.gallery:not(.blacklisted)';
  const selectorFavoriteGallery = '.gallery-favorite > .gallery';
  const selectorMaxPage = '.last';

  final Element? popularElm = document.querySelector(selectorPopular);
  final Element? galleryListElm = document.querySelector(selectorGalleryList);
  final Element? favoriteListElm = document.querySelector(selectorFavoriteList);

  final List<Element> galleryElmListOfPopular =
      popularElm?.querySelectorAll(selectorGallery) ?? [];

  final List<Element> galleryElmList =
      galleryListElm?.querySelectorAll(selectorGallery) ?? [];

  final List<Element> favoriteGalleryElmList =
      favoriteListElm?.querySelectorAll(selectorFavoriteGallery) ?? [];

  logger.v('favoriteGalleryElmList.len ${favoriteGalleryElmList.length}');

  final maxPage = RegExp(r'\d+')
          .firstMatch(
              document.querySelector(selectorMaxPage)?.attributes['href'] ?? '')
          ?.group(0) ??
      '1';

  final galleryListFuture =
      parseGalleryListElm(galleryElmList, blacklistTagsList);
  final popularListFuture =
      parseGalleryListElm(galleryElmListOfPopular, blacklistTagsList);
  final favoriteListFuture = parseGalleryListElm(favoriteGalleryElmList, []);

  final result = await Future.wait(
      [galleryListFuture, popularListFuture, favoriteListFuture]);

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
    List<Element> galleryElmList, List<String> blacklistTagsList) async {
  final List<Gallery> galleryList = [];
  for (final Element elm in galleryElmList) {
    // logger.d('elm: ${elm.outerHtml}');

    final captionElm = elm.querySelector('.caption');

    final title = captionElm?.text ?? '';
    final url = elm.querySelector('.cover')?.attributes['href'] ?? '';
    final thumbUrl =
        elm.querySelector('.lazyload')?.attributes['data-src'] ?? '';
    final imageHeight =
        elm.querySelector('.lazyload')?.attributes['height'] ?? '';
    final imageWidth =
        elm.querySelector('.lazyload')?.attributes['width'] ?? '';

    final gid = RegExp(r'/(\d+)/').firstMatch(url)?.group(1) ?? '';
    final mediaId = RegExp(r'/(\d+)/').firstMatch(thumbUrl)?.group(1) ?? '';

    // 扩展名
    final ext = RegExp(r'\.(\w+)$').firstMatch(thumbUrl)?.group(1) ?? '';
    final type = ext.substring(0, 1);

    final dataTags =
        (elm.attributes['data-tags'] ?? '').split(RegExp(r'\s+')).toList();
    if (dataTags.any((e) => blacklistTagsList.contains(e))) {
      logger.v('$gid $title is blacklisted');
      continue;
    }

    // logger.d('dataTags $dataTags');

    final Gallery gallery = Gallery(
      gid: int.parse(gid),
      mediaId: mediaId,
      languageCode: getLanguageCode(dataTags),
      simpleTags: await getTags(dataTags),
      title: GalleryTitle(englishTitle: title),
      images: GalleryImages(
        // cover: GalleryImage(
        //   type: type,
        //   imgHeight: int.parse(imageHeight),
        //   imgWidth: int.parse(imageWidth),
        // ),
        thumbnail: GalleryImage(
          type: type,
          imgHeight: int.parse(imageHeight),
          imgWidth: int.parse(imageWidth),
        ),
      ),
    );
    // logger.d('gallery ${gallery.toJson()}');
    galleryList.add(gallery);
  }
  return galleryList;
}

Future<List<Tag>> getTags(List<String> dataTags) async {
  final List<Tag> tags = [];
  for (final String tag in dataTags) {
    final id = int.tryParse(tag) ?? 0;
    final nhTag = isarHelper.findNhTag(id);
    final translated = await isarHelper.findTagTranslateAsync(nhTag?.name ?? '',
        namespace: getTagNamespace(nhTag?.type ?? ''));
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
