import 'dart:io';

import 'package:dio/dio.dart';

class DioThroughInterceptor extends Interceptor {
  DioThroughInterceptor({required this.dio, required this.throughHandler});

  Dio dio;
  Future<bool> Function(DioError err) throughHandler;

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!err.requestOptions.disableThrough) {
      if (err.response?.statusCode == 403 || err.response?.statusCode == 503) {
        print('DioThroughInterceptor onError');
        print(err);
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
    return super.onError(err, handler);
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
