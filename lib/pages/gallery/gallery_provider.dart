import 'package:eros_n/models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryNotifier extends StateNotifier<Gallery> {
  GalleryNotifier(super.state);
  void initFromGallery(Gallery gallery) {
    state = state.copyWith(
      thumbUrl: gallery.thumbUrl,
      imgWidth: gallery.imgWidth,
      imgHeight: gallery.imgHeight,
      gid: gallery.gid,
      title: gallery.title,
    );
  }
}

final galleryProvider =
    StateNotifierProvider.family<GalleryNotifier, Gallery, String?>((ref, gid) {
  return GalleryNotifier(Gallery(gid: gid));
});
