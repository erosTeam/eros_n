import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/network/api.dart';
import 'package:eros_n/network/webview_proxy/hidden_webview_proxy.dart';
import 'package:eros_n/utils/logger.dart';

/// Intercepts 401 responses on `/api/v2/` requests, refreshes the WebView
/// session (which picks up rotated access_token cookies), and retries
/// the original request exactly once.
///
/// Must sit after [WebViewProxyInterceptor] in the interceptor chain so
/// the 401 has already been surfaced by the proxy layer.
class AuthRetryInterceptor extends Interceptor {
  static const _retryKey = '__auth_retry';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.uri.path;
    final alreadyRetried = err.requestOptions.extra[_retryKey] == true;

    if (statusCode != 401 || !path.contains('/api/v2/') || alreadyRetried) {
      return handler.next(err);
    }

    logger.d(
      '[AuthRetry] 401 on ${err.requestOptions.method} $path, '
      'refreshing session and retrying…',
    );

    try {
      _invalidateCache(err.requestOptions);
      await HiddenWebViewProxy.instance.refreshSession();

      final opts = err.requestOptions;
      opts.extra[_retryKey] = true;

      final dio = Dio(BaseOptions(baseUrl: opts.baseUrl));
      final response = await dio.fetch<dynamic>(opts);
      return handler.resolve(response);
    } on DioException catch (retryErr) {
      logger.d(
        '[AuthRetry] retry also failed: ${retryErr.response?.statusCode}',
      );
      return handler.reject(retryErr);
    } catch (e) {
      logger.e('[AuthRetry] unexpected error during retry: $e');
      return handler.next(err);
    }
  }

  void _invalidateCache(RequestOptions options) {
    try {
      final cacheKey = CacheOptions.defaultCacheKeyBuilder(options);
      Api.sharedCacheStore.delete(cacheKey);
      logger.d('[AuthRetry] cache invalidated for key=$cacheKey');
    } catch (e) {
      logger.d('[AuthRetry] cache invalidation failed: $e');
    }
  }
}
