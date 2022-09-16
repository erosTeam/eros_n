import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final galleryImageProvider =
    FutureProvider.autoDispose.family<GalleryImage, String?>((ref, href) async {
  final galleryThumb = await getGalleryImage(url: href ?? '');
  return GalleryImage(
    href: href,
    imageUrl: galleryThumb.imageUrl,
    imgHeight: galleryThumb.imgHeight,
    imgWidth: galleryThumb.imgWidth,
  );
});
