import 'package:eros_n/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

List<GalleryProvider> parseGalleryList(String html) {
  final dom.Document document = parse(html);

  const selectorPopular =
      '#content > div.container.index-container.index-popular';

  const selectorGalleryList =
      '#content > div.container.index-container:not(.index-popular)';

  const selectorGallery = '.gallery';

  final dom.Element? popularElm = document.querySelector(selectorPopular);
  final dom.Element? galleryListElm =
      document.querySelector(selectorGalleryList);

  final List<dom.Element> galleryElmListOfPopular =
      popularElm?.querySelectorAll(selectorGallery) ?? [];

  final List<dom.Element> galleryElmList =
      galleryListElm?.querySelectorAll(selectorGallery) ?? [];

  logger.d('galleryElmListOfPopular ${galleryElmListOfPopular.length}');
  logger.d('galleryElmList ${galleryElmList.length}');

  final List<GalleryProvider> galleryList = parseGalleryListElm(galleryElmList);
  return galleryList;
}

List<GalleryProvider> parseGalleryListElm(List<dom.Element> galleryElmList) {
  final List<GalleryProvider> galleryList = [];
  for (final dom.Element elm in galleryElmList) {
    final title = elm.querySelector('.caption')?.text ?? '';
    final url = elm.querySelector('.cover')?.attributes['href'] ?? '';
    final thumbUrl =
        elm.querySelector('.lazyload')?.attributes['data-src'] ?? '';
    final gid = RegExp(r'\d+').firstMatch(url)?.group(0) ?? '';

    final GalleryProvider gallery = GalleryProvider(
      gid: gid,
      title: title,
      url: url,
      thumbUrl: thumbUrl,
    );
    // logger.d('gallery ${gallery.toJson()}');
    galleryList.add(gallery);
  }
  return galleryList;
}
