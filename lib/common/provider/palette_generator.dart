import 'dart:async';
import 'dart:ui';

import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

final paletteGeneratorProvider = FutureProvider.autoDispose
    .family<PaletteGenerator, String>((ref, imageUrl) async {
  final imageProvider = ResizeImage(getErorsImageProvider(imageUrl), width: 32);

  final completer = Completer<PaletteGenerator>();
  imageProvider.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
      (imageInfo, _) {
        final image = imageInfo.image;
        final paletteGenerator = PaletteGenerator.fromImage(
          image,
          // region: Rect.fromCenter(
          //   center: Offset(image.width / 2, image.height / 2),
          //   width: image.width * 1,
          //   height: image.height * 1,
          // ),
        );
        completer.complete(paletteGenerator);
      },
    ),
  );

  return completer.future;
});
