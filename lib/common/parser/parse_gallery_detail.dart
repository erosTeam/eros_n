import 'package:eros_n/common/parser/parse_gallery_list.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

Gallery parseGalleryDetail(String html) {
  final Document document = parse(html);
  // logger.d('html\n$html');

  final titleElms = document.querySelectorAll('#info > .title');
  final title = titleElms.first.text;
  final secondTitle = titleElms.last.text;
  logger.d('title: $title, secondTitle: $secondTitle');

  const selectorFavorite = '#favorite';
  final favoriteElm = document.querySelector(selectorFavorite);

  final favoriteText = favoriteElm?.text.trim() ?? '';
  logger.v('favoriteText: $favoriteText');
  final favNum = RegExp(r'\d+').firstMatch(favoriteText)?.group(0) ?? '0';

  final favText = favoriteElm?.querySelector('.text')?.text.trim() ?? '';
  logger.v('favText: $favText');
  final isFav = favText.contains('Un');

  logger.v('favNum: $favNum isFav: $isFav');

  const selectorMoreLikeGalleryList = '#related-container';
  const selectorGallery = '.gallery:not(.blacklisted)';
  final moreLikeGalleryElmList =
      document.querySelector(selectorMoreLikeGalleryList)?.querySelectorAll(selectorGallery) ?? [];
  final moreLikeGalleryList = parseGalleryListElm(moreLikeGalleryElmList, []);

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
    title: title,
    secondTitle: secondTitle,
    images: galleryThumbs,
    isFavorited: isFav,
    favoritedNum: favNum,
    moreLikeGallerys: moreLikeGalleryList,
  );
}
