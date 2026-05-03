import 'dart:io';

import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/network/api.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/translation_cache.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_size_provider.g.dart';

@riverpod
class CacheSize extends _$CacheSize {
  @override
  Future<int> build() => _computeTotalBytes();

  Future<void> clearAll() async {
    state = const AsyncValue.loading();
    try {
      await Api.sharedCacheStore.clean();
      await imageCacheManager.emptyCache();
      await DefaultCacheManager().emptyCache();
      PaintingBinding.instance.imageCache.clear();
      await TranslationCacheService.instance.clear();
      // On some platforms emptyCache() doesn't fully remove files;
      // delete the directories as a fallback.
      await _deleteDir(Directory('${Global.tempPath}/CachedNetworkImage'));
      await _deleteDir(Directory('${Global.tempPath}/libCachedImageData'));
    } catch (e) {
      logger.w('clearCache error: $e');
    }
    state = await AsyncValue.guard(_computeTotalBytes);
  }

  Future<int> _computeTotalBytes() async {
    var total = 0;

    final hiveFile = File('${Global.appSupportPath}/dio_cache.hive');
    if (await hiveFile.exists()) {
      try {
        total += await hiveFile.length();
      } catch (_) {}
    }

    total += await _dirBytes(
      Directory('${Global.tempPath}/CachedNetworkImage'),
    );
    total += await _dirBytes(
      Directory('${Global.tempPath}/libCachedImageData'),
    );

    return total;
  }
}

Future<void> _deleteDir(Directory dir) async {
  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
}

Future<int> _dirBytes(Directory dir) async {
  if (!await dir.exists()) {
    return 0;
  }
  var total = 0;
  await for (final entity in dir.list(recursive: true, followLinks: false)) {
    if (entity is File) {
      try {
        total += await entity.length();
      } catch (_) {}
    }
  }
  return total;
}

/// Formats [bytes] into a human-readable string, or null if below 1 MB.
String? formatCacheSize(int bytes) {
  if (bytes < 1024 * 1024) {
    return null;
  }
  if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
}
