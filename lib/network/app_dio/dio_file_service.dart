import 'dart:io';
import 'package:eros_n/common/global.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/src/web/mime_converter.dart';

import '../../network/app_dio/dio_http_cli.dart';
import 'package:clock/clock.dart';

import '../../network/app_dio/http_response.dart';
import '../../network/app_dio/http_transformer.dart';


class DioFileService extends FileService {
  DioFileService();

  @override
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers}) async {
    DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

    final req = await dioHttpClient.get(url,
        options: Options(
          headers: headers,
          responseType: ResponseType.stream,
        ), httpTransformer: HttpTransformerBuilder(
              (response) {
            return DioHttpResponse.success(response);
          },
        ));

    return DioGetResponse(req.data as Response);
  }
}

class DioGetResponse implements FileServiceResponse {
  DioGetResponse(this._response);

  final DateTime _receivedTime = clock.now();

  final Response _response;

  @override
  int get statusCode => _response.statusCode!;

  String? _header(String name) {
    return _response.headers.map[name]?.first;
  }

  @override
  Stream<List<int>> get content {
    return (_response.data as ResponseBody).stream.cast<List<int>>();
  }

  @override
  int? get contentLength {
    final contentLength = _response.headers[Headers.contentLengthHeader]?.first;
    return contentLength != null ? int.tryParse(contentLength) : null;
  }

  @override
  DateTime get validTill {
    // Without a cache-control header we keep the file for a week
    var ageDuration = const Duration(days: 7);
    final controlHeader = _header(HttpHeaders.cacheControlHeader);
    if (controlHeader != null) {
      final controlSettings = controlHeader.split(',');
      for (final setting in controlSettings) {
        final sanitizedSetting = setting.trim().toLowerCase();
        if (sanitizedSetting == 'no-cache') {
          ageDuration = const Duration();
        }
        if (sanitizedSetting.startsWith('max-age=')) {
          var validSeconds = int.tryParse(sanitizedSetting.split('=')[1]) ?? 0;
          if (validSeconds > 0) {
            ageDuration = Duration(seconds: validSeconds);
          }
        }
      }
    }

    return _receivedTime.add(ageDuration);
  }

  @override
  String? get eTag => _header(HttpHeaders.etagHeader);

  @override
  String get fileExtension {
    var fileExtension = '';
    final contentTypeHeader = _header(HttpHeaders.contentTypeHeader);
    if (contentTypeHeader != null) {
      final contentType = ContentType.parse(contentTypeHeader);
      fileExtension = contentType.fileExtension;
    }
    return fileExtension;
  }
}
