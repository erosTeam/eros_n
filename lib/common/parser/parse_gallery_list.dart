import 'package:eros_n/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

GalleryList parseGalleryList(String html) {
  final dom.Document document = parse(html);

  const selectorPopular =
      '#content > div.container.index-container.index-popular';

  const selectorGalleryList =
      '#content > div.container.index-container:not(.index-popular)';

  const selectorGallery = '.gallery';
  const selectorMaxPage = '.last';

  final dom.Element? popularElm = document.querySelector(selectorPopular);
  final dom.Element? galleryListElm =
      document.querySelector(selectorGalleryList);

  final List<dom.Element> galleryElmListOfPopular =
      popularElm?.querySelectorAll(selectorGallery) ?? [];

  final List<dom.Element> galleryElmList =
      galleryListElm?.querySelectorAll(selectorGallery) ?? [];

  // logger.d('galleryElmListOfPopular ${galleryElmListOfPopular.length}');
  // logger.d('galleryElmList ${galleryElmList.length}');

  final maxPage = RegExp(r'\d+')
          .firstMatch(
              document.querySelector(selectorMaxPage)?.attributes['href'] ?? '')
          ?.group(0) ??
      '1';

  final galleryList = parseGalleryListElm(galleryElmList);
  final popularList = parseGalleryListElm(galleryElmListOfPopular);
  return GalleryList(
    gallerys: galleryList,
    populars: popularList,
    maxPage: int.parse(maxPage),
  );
}

List<GalleryProvider> parseGalleryListElm(List<dom.Element> galleryElmList) {
  final List<GalleryProvider> galleryList = [];
  for (final dom.Element elm in galleryElmList) {
    final title = elm.querySelector('.caption')?.text ?? '';
    final url = elm.querySelector('.cover')?.attributes['href'] ?? '';
    final thumbUrl =
        elm.querySelector('.lazyload')?.attributes['data-src'] ?? '';
    final imageHeight =
        elm.querySelector('.lazyload')?.attributes['height'] ?? '';
    final imageWidth =
        elm.querySelector('.lazyload')?.attributes['width'] ?? '';
    final gid = RegExp(r'\d+').firstMatch(url)?.group(0) ?? '';

    final GalleryProvider gallery = GalleryProvider(
      gid: gid,
      title: title,
      url: url,
      thumbUrl: thumbUrl,
      imgHeight: int.parse(imageHeight),
      imgWidth: int.parse(imageWidth),
    );
    // logger.d('gallery ${gallery.toJson()}');
    galleryList.add(gallery);
  }
  return galleryList;
}
