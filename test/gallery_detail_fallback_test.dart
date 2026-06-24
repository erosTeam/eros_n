import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/models/gallery_images.dart';
import 'package:eros_n/component/models/image.dart';
import 'package:eros_n/component/models/tag.dart';
import 'package:eros_n/network/request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('missing HTML detail fields are treated as a bad gallery detail', () {
    expect(hasBrokenHtmlGalleryDetail(const Gallery()), isTrue);
    expect(
      hasBrokenHtmlGalleryDetail(
        const Gallery(mediaId: '1', images: GalleryImages(), tags: <Tag>[]),
      ),
      isTrue,
    );
    expect(
      hasBrokenHtmlGalleryDetail(
        const Gallery(
          mediaId: '1',
          images: GalleryImages(pages: <GalleryImage>[GalleryImage()]),
          tags: <Tag>[Tag(name: 'tag')],
        ),
      ),
      isFalse,
    );
  });
}
