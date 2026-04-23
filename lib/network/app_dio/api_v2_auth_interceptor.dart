import 'package:dio/dio.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/utils/logger.dart';

/// nhentai's `/api/v2` endpoints authenticate via the
/// `Authorization: User <access_token>` header rather than session cookies.
/// This interceptor pulls the token from the shared cookie jar and attaches
/// it to any outbound v2 request that isn't already carrying its own
/// `Authorization` value.
class ApiV2AuthInterceptor extends Interceptor {
  static const _tokenCookieName = 'access_token';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.path.contains('/api/v2/')) {
      return handler.next(options);
    }
    if (options.headers.containsKey('Authorization') ||
        options.headers.containsKey('authorization')) {
      return handler.next(options);
    }

    try {
      final cookies = await Global.cookieJar.loadForRequest(options.uri);
      String token = '';
      for (final c in cookies) {
        if (c.name == _tokenCookieName && c.value.isNotEmpty) {
          token = c.value;
          break;
        }
      }
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'User $token';
      }
    } catch (e) {
      logger.w('ApiV2AuthInterceptor failed to read access_token: $e');
    }

    handler.next(options);
  }
}
