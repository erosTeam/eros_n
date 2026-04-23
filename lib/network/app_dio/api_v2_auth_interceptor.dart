import 'package:dio/dio.dart';

/// Historically this interceptor injected `Authorization: User <access_token>`
/// onto `/api/v2/*` requests by reading from Dart's cookie jar. That turned
/// out to be unreliable: nhentai silently rotates the access token, the
/// browser updates its cookie jar immediately, but Dart's jar can lag for
/// minutes. The stale token then earns a 401 even though the *browser* has
/// a perfectly valid one.
///
/// The actual injection now lives inside the WebView proxy's JS bridge, where
/// `document.cookie` always reflects the freshest value. This interceptor
/// is intentionally a no-op — kept here so the dio chain wiring stays
/// stable in case we want to add Dart-side `Authorization: Key <api_key>`
/// support later (e.g. user-supplied API keys).
class ApiV2AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }
}
