import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:eros_n/common/global.dart';

class Api {
  static CacheOptions cacheOption = CacheOptions(
    store: BackupCacheStore(
      primary: MemCacheStore(),
      secondary: HiveCacheStore(Global.appSupportPath),
    ),
    policy: CachePolicy.forceCache,
    hitCacheOnErrorExcept: [401, 403, 304, 503],
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );
}
