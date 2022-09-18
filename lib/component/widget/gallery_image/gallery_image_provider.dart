import 'dart:async' show Future, StreamController;
import 'dart:ui' as ui show Codec;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'gallery_image_platform_interface.dart' show ImageRenderMethodForWeb;
import 'gallery_image_platform_interface.dart'
    if (dart.library.io) '_image_loader.dart'
    if (dart.library.html) 'cached_network_image_web.dart' show ImageLoader;
import 'gallery_image_provider.dart' as image_provider;
import 'multi_image_stream_completer.dart';

/// Function which is called after loading the image failed.
typedef ErrorListener = void Function();

/// IO implementation of the CachedNetworkImageProvider; the ImageProvider to
/// load network images using a cache.
@immutable
class GalleryImageProvider
    extends ImageProvider<image_provider.GalleryImageProvider> {
  /// Creates an ImageProvider which loads an image from the [imagePageUrl], using the [scale].
  /// When the image fails to load [errorListener] is called.
  const GalleryImageProvider(
    this.imagePageUrl, {
    this.maxHeight,
    this.maxWidth,
    this.scale = 1.0,
    this.errorListener,
    this.headers,
    this.cacheManager,
    this.cacheKey,
    this.imageRenderMethodForWeb = ImageRenderMethodForWeb.HtmlImage,
  });

  /// CacheManager from which the image files are loaded.
  final BaseCacheManager? cacheManager;

  /// Web url of the image page to load
  final String imagePageUrl;

  /// Cache key of the image to cache
  final String? cacheKey;

  /// Scale of the image
  final double scale;

  /// Listener to be called when images fails to load.
  final image_provider.ErrorListener? errorListener;

  /// Set headers for the image provider, for example for authentication
  final Map<String, String>? headers;

  /// Maximum height of the loaded image. If not null and using an
  /// [ImageCacheManager] the image is resized on disk to fit the height.
  final int? maxHeight;

  /// Maximum width of the loaded image. If not null and using an
  /// [ImageCacheManager] the image is resized on disk to fit the width.
  final int? maxWidth;

  /// Render option for images on the web platform.
  final ImageRenderMethodForWeb imageRenderMethodForWeb;

  @override
  Future<GalleryImageProvider> obtainKey(
      ImageConfiguration configuration) {
    return SynchronousFuture<GalleryImageProvider>(this);
  }

  @override
  ImageStreamCompleter loadBuffer(image_provider.GalleryImageProvider key,
      DecoderBufferCallback decode) {
    final chunkEvents = StreamController<ImageChunkEvent>();
    return MultiImageStreamCompleter(
      codec: _loadBufferAsync(key, chunkEvents, decode),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      informationCollector: () sync* {
        yield DiagnosticsProperty<ImageProvider>(
          'Image provider: $this \n Image key: $key',
          this,
          style: DiagnosticsTreeStyle.errorProperty,
        );
      },
    );
  }

  Stream<ui.Codec> _loadBufferAsync(
    image_provider.GalleryImageProvider key,
    StreamController<ImageChunkEvent> chunkEvents,
    DecoderBufferCallback decode,
  ) {
    assert(key == this);
    return ImageLoader().loadBufferAsync(
      imagePageUrl,
      cacheKey,
      chunkEvents,
      decode,
      cacheManager ?? DefaultCacheManager(),
      maxHeight,
      maxWidth,
      headers,
      errorListener,
      imageRenderMethodForWeb,
      () => PaintingBinding.instance.imageCache.evict(key),
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (other is GalleryImageProvider) {
      return ((cacheKey ?? imagePageUrl) == (other.cacheKey ?? other.imagePageUrl)) &&
          scale == other.scale &&
          maxHeight == other.maxHeight &&
          maxWidth == other.maxWidth;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(cacheKey ?? imagePageUrl, scale, maxHeight, maxWidth);

  @override
  String toString() => '$runtimeType("$imagePageUrl", scale: $scale)';
}
