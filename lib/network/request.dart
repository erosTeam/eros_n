import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/models/index.dart';

import '../common/const/const.dart';
import '../common/parser/parse_gallery_list.dart';
import '../utils/logger.dart';
import 'app_dio/pdio.dart';

Options getCacheOptions({bool forceRefresh = false, Options? options}) {
  return buildCacheOptions(
    const Duration(days: 5),
    maxStale: const Duration(days: 7),
    forceRefresh: forceRefresh,
    options: options,
  );
}

Future<List<GalleryProvider>> getGalleryList({
  bool refresh = false,
  CancelToken? cancelToken,
  String? referer,
  int? page,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{
    'page': page ?? 1,
  };

  DioHttpResponse httpResponse = await dioHttpClient.get(
    '/',
    queryParameters: params,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        final list = parseGalleryList(response.data as String);
        return DioHttpResponse<List<GalleryProvider>>.success(list);
      },
    ),
    options: getCacheOptions(forceRefresh: refresh)
      ..followRedirects = true
      ..headers = {
        'referer': referer ?? NHConst.baseUrl,
      },
    // ..validateStatus = (status) => (status ?? 0) <= 503,
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is List<GalleryProvider>) {
    return httpResponse.data as List<GalleryProvider>;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryList error');
  }
}
