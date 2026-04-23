import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:eros_n/network/webview_proxy/hidden_webview_proxy.dart';
import 'package:eros_n/utils/logger.dart';

/// Dio interceptor that transparently proxies requests against
/// Cloudflare-protected origins through a hidden WebView, sidestepping the
/// TLS/HTTP fingerprint mismatch that triggers the Cloudflare challenge for
/// requests issued by `dart:io`'s HTTP client.
///
/// Image CDNs (e.g. `i.nhentai.net`, `t.nhentai.net`) and any streaming
/// downloads bypass the proxy and stay on direct dio transport, preserving
/// throughput and concurrency for large binary payloads.
class WebViewProxyInterceptor extends Interceptor {
  WebViewProxyInterceptor({
    Set<String>? proxiedHosts,
  }) : _proxiedHosts = proxiedHosts ?? const {'nhentai.net'};

  final Set<String> _proxiedHosts;

  bool _shouldProxy(RequestOptions options) {
    if (options.responseType == ResponseType.stream) {
      return false;
    }
    if (options.disableWebViewProxy) {
      return false;
    }
    final host = options.uri.host;
    return _proxiedHosts.contains(host);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_shouldProxy(options)) {
      return handler.next(options);
    }

    try {
      final headers = <String, String>{};
      options.headers.forEach((k, v) {
        if (v == null) {
          return;
        }
        headers[k] = v.toString();
      });

      final url = options.uri.toString();
      logger.d('[WebViewProxy] -> ${options.method} $url');

      final proxyResp = await HiddenWebViewProxy.instance.request(
        url: url,
        method: options.method,
        headers: headers,
        body: options.data,
      );

      logger.d(
        '[WebViewProxy] <- ${proxyResp.status} '
        'url=${proxyResp.url} bodyLen=${proxyResp.body.length}',
      );

      final responseHeaders = <String, List<String>>{};
      proxyResp.headers.forEach((k, v) {
        responseHeaders[k.toLowerCase()] = [v];
      });

      final data = _decodeBody(proxyResp.body, options.responseType);

      final finalUrl = proxyResp.url;
      final isRedirected = finalUrl.isNotEmpty && finalUrl != url;
      final response = Response<dynamic>(
        requestOptions: options,
        statusCode: proxyResp.status,
        statusMessage: proxyResp.statusText,
        headers: Headers.fromMap(responseHeaders),
        data: data,
        isRedirect: isRedirected,
        redirects: isRedirected
            ? [
                RedirectRecord(
                  302,
                  options.method,
                  Uri.parse(finalUrl),
                ),
              ]
            : const [],
        extra: {
          'webview_proxy': true,
          'final_url': finalUrl,
        },
      );

      // Preserve dio's validateStatus contract: throw on bad status codes.
      final validate =
          options.validateStatus(response.statusCode);
      if (!validate) {
        return handler.reject(
          DioException.badResponse(
            statusCode: response.statusCode!,
            requestOptions: options,
            response: response,
          ),
          true,
        );
      }

      handler.resolve(response);
    } catch (e, stack) {
      logger.e('[WebViewProxy] error', error: e, stackTrace: stack);
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
          stackTrace: stack,
          message: 'WebViewProxy failed: $e',
        ),
        true,
      );
    }
  }

  /// Decode the raw text body into the shape dio's transformer would have
  /// produced for a normal response of [type].
  dynamic _decodeBody(String body, ResponseType type) {
    switch (type) {
      case ResponseType.json:
        if (body.isEmpty) {
          return null;
        }
        try {
          return jsonDecode(body);
        } catch (_) {
          return body;
        }
      case ResponseType.bytes:
        return Uint8List.fromList(utf8.encode(body));
      case ResponseType.plain:
      case ResponseType.stream:
        return body;
    }
  }
}

const _disableWebViewProxyKey = '__webview_proxy_disable';

extension RequestOptionsWebViewProxy on RequestOptions {
  bool get disableWebViewProxy =>
      (extra[_disableWebViewProxyKey] as bool?) ?? false;
  set disableWebViewProxy(bool value) =>
      extra[_disableWebViewProxyKey] = value;
}

extension OptionsWebViewProxy on Options {
  bool get disableWebViewProxy =>
      (extra?[_disableWebViewProxyKey] as bool?) ?? false;
  set disableWebViewProxy(bool value) =>
      (extra ??= <String, dynamic>{})[_disableWebViewProxyKey] = value;
}
