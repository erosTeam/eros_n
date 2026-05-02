import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

class Api {
  // Shared cache store initialised once during Global.init() via
  // Api.initCacheStore(). Both AppDio and getOptions() use this single
  // instance so the Hive box is only opened and cleaned up once at startup.
  static late CacheStore sharedCacheStore;

  static late CacheOptions cacheOption;

  static Future<void> initCacheStore(String appSupportPath) async {
    final hiveStore = HiveCacheStore(appSupportPath);
    // HiveCacheStore constructor fires clean() unawaited; await here so the
    // box is fully idle before any request comes in.
    await hiveStore.clean(staleOnly: true);
    // Ensure the lazy box is open before returning.
    await hiveStore.get('__warmup__');

    sharedCacheStore = hiveStore;

    cacheOption = CacheOptions(
      store: sharedCacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(hours: 6),
      hitCacheOnErrorExcept: [401, 403, 503],
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
  }
}
