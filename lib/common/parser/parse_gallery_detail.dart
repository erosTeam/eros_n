import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

Gallery parseGalleryDetail(String html) {
  final Document document = parse(html);
  // logger.d('html\n$html');

  const selectorThumb = '.gallerythumb';

  final List<Element> galleryThumbsElm =
      document.querySelectorAll(selectorThumb);
  logger.v('galleryThumbsElm ${galleryThumbsElm.length}');

  final List<GalleryImage> galleryThumbs = [];
  // for galleryThumbsElm
  for (final elm in galleryThumbsElm) {
    final href = elm.attributes['href'];
    final thumbUrl = elm.querySelector('img')?.attributes['data-src'];
    final imgHeight = elm.querySelector('img')?.attributes['height'];
    final imgWidth = elm.querySelector('img')?.attributes['width'];

    // logger.d('thumbUrl: $thumbUrl');
    galleryThumbs.add(GalleryImage(
      href: href,
      thumbUrl: thumbUrl,
      thumbHeight: int.parse(imgHeight ?? '0'),
      thumbWidth: int.parse(imgWidth ?? '0'),
    ));
  }

  return Gallery(
    images: galleryThumbs,
  );
}
