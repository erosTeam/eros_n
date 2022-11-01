import 'package:cached_network_image/cached_network_image.dart';
import 'package:eros_n/network/app_dio/dio_file_service.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:octo_image/octo_image.dart';

final imageCacheManager = CacheManager(
  Config('CachedNetworkImage', fileService: DioFileService()),
);

class ErosCachedNetworkImage extends StatelessWidget {
  const ErosCachedNetworkImage({
    super.key,
    this.imageUrl,
    this.image,
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
    this.color,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.medium,
  }) : assert(imageUrl != null || image != null);

  const ErosCachedNetworkImage.image({
    super.key,
    required this.image,
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
    this.color,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.medium,
  }) : imageUrl = null;

  final String? imageUrl;
  final ImageProvider? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Map<String, String>? httpHeaders;

  final VoidCallback? onLoadCompleted;

  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final bool checkPHashHide;
  final bool checkQRCodeHide;
  final ValueChanged<bool>? onHideFlagChanged;
  final FilterQuality filterQuality;
  final Color? color;
  final BlendMode? colorBlendMode;

  @override
  Widget build(BuildContext context) {
    final imageProvider =
        image ?? getErosImageProvider(imageUrl!, headers: httpHeaders);

    if (onLoadCompleted != null) {
      imageProvider.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener(
          (ImageInfo imageInfo, _) {
            onLoadCompleted?.call();
          },
        ),
      );
    }

    return OctoImage(
      image: imageProvider,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      placeholderBuilder: _octoPlaceholderBuilder,
      errorBuilder: _octoErrorBuilder,
      progressIndicatorBuilder: _octoProgressIndicatorBuilder,
      filterQuality: filterQuality,
    );
  }

  OctoPlaceholderBuilder? get _octoPlaceholderBuilder {
    if (placeholder == null) {
      return null;
    }
    return (context) {
      return placeholder!(context, imageUrl ?? '');
    };
  }

  OctoProgressIndicatorBuilder? get _octoProgressIndicatorBuilder {
    if (progressIndicatorBuilder == null) {
      return null;
    }
    return (context, progress) {
      return progressIndicatorBuilder!(
          context,
          imageUrl ?? '',
          DownloadProgress(
            imageUrl ?? '',
            progress?.expectedTotalBytes,
            progress?.cumulativeBytesLoaded ?? 0,
          ));
    };
  }

  OctoErrorBuilder? get _octoErrorBuilder {
    if (errorWidget == null) {
      return null;
    }
    return (context, error, stackTrace) {
      return errorWidget!(context, imageUrl ?? '', error);
    };
  }
}

ImageProvider getErosImageProvider(String url, {Map<String, String>? headers}) {
  return CachedNetworkImageProvider(
    url,
    cacheManager: imageCacheManager,
    cacheKey: buildImageCacheKey(url),
  );
}
