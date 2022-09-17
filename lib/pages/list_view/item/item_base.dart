import 'package:eros_n/component/widget/blur_image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoverImg extends StatelessWidget {
  const CoverImg({
    Key? key,
    required this.imgUrl,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String imgUrl;
  final double? height;
  final double? width;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    Widget image() {
      if (imgUrl.isNotEmpty) {
        return ErosCachedNetworkImage(
          imgUrl,
          // placeholder: (_, __) {
          //   return Container(
          //     alignment: Alignment.center,
          //     child: const CircularProgressIndicator(),
          //   );
          // },
          width: width,
          height: height,
          // httpHeaders: _httpHeaders,
          fit: fit,
        );
      } else {
        return Container();
      }
    }

    return BlurImage(
      // blur: kDebugMode,
      sigma: 5,
      blur: false,
      child: image(),
    );
  }
}
