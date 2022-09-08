import 'package:cached_network_image/cached_network_image.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' as retry;
import 'package:octo_image/octo_image.dart';

class ErosCachedNetworkImage extends StatelessWidget {
  const ErosCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.progressIndicatorBuilder,
    this.httpHeaders,
    this.onLoadCompleted,
    this.checkPHashHide = false,
    this.checkQRCodeHide = false,
    this.onHideFlagChanged,
  }) : super(key: key);

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Map<String, String>? httpHeaders;

  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final VoidCallback? onLoadCompleted;
  final bool checkPHashHide;
  final bool checkQRCodeHide;
  final ValueChanged<bool>? onHideFlagChanged;

  ImageWidgetBuilder get imageWidgetBuilder => (context, imageProvider) {
        return OctoImage(
          image: imageProvider,
          width: width,
          height: height,
          fit: fit,
        );
      };

  @override
  Widget build(BuildContext context) {
    final defHttpHeaders = {
      // 'Cookie': Global.profile.user.cookie,
      'Host': Uri.parse(imageUrl).host,
      'User-Agent': Global.userAgent ?? NHConst.userAgent,
      'Accept-Encoding': 'gzip, deflate, br'
    };
    if (httpHeaders != null) {
      defHttpHeaders.addAll(httpHeaders!);
    }

    final image = CachedNetworkImage(
      cacheManager: imageCacheManager,
      // imageBuilder: imageWidgetBuilder,
      httpHeaders: defHttpHeaders,
      width: width,
      height: height,
      fit: fit,
      // color: Color.fromARGB(240, 255, 255, 255),
      // colorBlendMode: BlendMode.lighten,
      // imageUrl: imageUrl.handleUrl,
      imageUrl: imageUrl,
      // placeholder: placeholder,
      // errorWidget: errorWidget,
      // progressIndicatorBuilder: progressIndicatorBuilder,
    );

    return image;
    return Opacity(opacity: 0.03, child: image);
  }
}

final client = retry.RetryClient(
  http.Client(),
);

final imageCacheManager = CacheManager(
  Config(
    'CachedNetworkImage',
    fileService: HttpFileService(
      httpClient: client,
    ),
  ),
);
