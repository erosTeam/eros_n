import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class DioUserAgentInterceptor extends Interceptor {
  DioUserAgentInterceptor(this.getUserAgent);
  FutureOr<String?> Function(RequestOptions) getUserAgent;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final ua = await getUserAgent(options);
    if(ua != null) {
      options.headers[HttpHeaders.userAgentHeader] = ua;
    }
    handler.next(options);
  }

}
