import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eros_n/utils/logger.dart';

class DioThroughInterceptor extends Interceptor {
  DioThroughInterceptor({required this.dio, required this.throughHandler});

  Dio dio;
  Future<bool> Function(DioException err) throughHandler;

  @override
  Future<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!err.requestOptions.disableThrough) {
      final code = err.response?.statusCode;
      if (code == 403 || code == 503) {
        final isChallenge = _isCloudflareChallenge(err.response);
        logger.d(
          'DioThroughInterceptor onError: $code, isCloudflareChallenge=$isChallenge, '
          'url=${err.requestOptions.uri}, '
          'cf-mitigated=${err.response?.headers.value('cf-mitigated')}, '
          'server=${err.response?.headers.value('server')}, '
          'cf-ray=${err.response?.headers.value('cf-ray')}',
        );
        if (isChallenge) {
          final ok = await throughHandler(err);
          if (ok) {
            final headers = err.requestOptions.headers;
            headers.remove(HttpHeaders.cookieHeader);
            final request = err.requestOptions.copyWith(headers: headers);
            await dio
                .fetch<void>(request)
                .then((value) => handler.resolve(value));
            return;
          }
        }
      }
    }
    return super.onError(err, handler);
  }

  /// Detect whether the response is a Cloudflare challenge page.
  ///
  /// nhentai may return 403/503 for other reasons (rate limit, temporary
  /// outage, etc), so we need to check actual Cloudflare markers instead of
  /// blindly trusting the status code.
  bool _isCloudflareChallenge(Response? response) {
    if (response == null) {
      return false;
    }
    final code = response.statusCode;
    if (code != 403 && code != 503) {
      return false;
    }

    final headers = response.headers;
    final cfMitigated = headers.value('cf-mitigated')?.toLowerCase();
    final server = headers.value('server')?.toLowerCase();
    final cfRay = headers.value('cf-ray');
    final isCloudflareEdge = server == 'cloudflare';

    // Dump diagnostics so we can see exactly why a request was classified.
    final body = response.data;
    final bodyPreview = body is String
        ? body.substring(0, body.length > 400 ? 400 : body.length)
        : '<non-string body: ${body.runtimeType}>';
    logger.d(
      '_isCloudflareChallenge inspect: code=$code, '
      'cf-mitigated=$cfMitigated, server=$server, cf-ray=$cfRay, '
      'isCloudflareEdge=$isCloudflareEdge, '
      'bodyType=${body.runtimeType}, bodyLen=${body is String ? body.length : -1}, '
      'bodyPreview=$bodyPreview',
    );

    // 1. Most reliable signal: explicit Cloudflare challenge header.
    if (cfMitigated == 'challenge') {
      logger.d('_isCloudflareChallenge => true (cf-mitigated=challenge)');
      return true;
    }

    // 2. Check response body for known challenge markers. Only treat as
    // challenge when both edge=cloudflare AND the body looks like a real
    // challenge page (interactive JS challenge, Turnstile, etc).
    if (body is String && isCloudflareEdge) {
      const markers = [
        'cf_chl_opt',
        '__cf_chl_jschl_tk__',
        '/cdn-cgi/challenge-platform/',
        'cf-browser-verification',
        'Just a moment...',
        'Checking your browser before accessing',
      ];
      for (final m in markers) {
        if (body.contains(m)) {
          logger.d('_isCloudflareChallenge => true (marker hit: $m)');
          return true;
        }
      }
    }

    logger.d('_isCloudflareChallenge => false');
    return false;
  }
}

const _disableThroughKey = '__dio_through_disable';

extension RequestOptionsThrough on RequestOptions {
  bool get disableThrough => (extra[_disableThroughKey] as bool?) ?? false;

  set disableThrough(bool value) => extra[_disableThroughKey] = value;
}

extension OptionsThrough on Options {
  bool get disableRetry => (extra?[_disableThroughKey] as bool?) ?? false;

  set disableRetry(bool value) => extra?[_disableThroughKey] = value;
}
