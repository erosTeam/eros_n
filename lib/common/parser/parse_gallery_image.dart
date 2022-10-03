import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

GalleryImage parseGalleryImage(String html) {
  final Document document = parse(html);

  const selectorImage = '#image-container > a > img';

  final imageElm = document.querySelector(selectorImage);
  final imageUrl = imageElm?.attributes['src'];
  final imageHeight = imageElm?.attributes['height'];
  final imageWidth = imageElm?.attributes['width'];

  logger.d('imageUrl: $imageUrl');

  return GalleryImage(
    imageUrl: imageUrl,
    imgHeight: imageHeight,
    imgWidth: imageWidth,
  );
}
