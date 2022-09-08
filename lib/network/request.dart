import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/models/index.dart';

import '../common/parser/parse_gallery_list.dart';
import '../utils/logger.dart';
import 'app_dio/api.dart';
import 'app_dio/pdio.dart';

// Options getCacheOptions({bool forceRefresh = false, Options? options}) {
//   logger.d('forceRefresh: $forceRefresh');
//   return buildCacheOptions(
//     const Duration(days: 3),
//     maxStale: const Duration(days: 7),
//     forceRefresh: forceRefresh,
//     options: options,
//   );
// }

Options getOptions({bool forceRefresh = false}) {
  final options = Api.cacheOption
      .copyWith(
        policy: forceRefresh ? CachePolicy.noCache : null,
      )
      .toOptions();
  // if (forceRefresh) {
  //   options.validateStatus = (status) => status == 200 || status == 304;
  // }

  return options;
}

Future<List<GalleryProvider>> getGalleryList({
  bool refresh = false,
  CancelToken? cancelToken,
  String? referer,
  int? page,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{
    if (page != null) 'page': page,
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
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is List<GalleryProvider>) {
    return httpResponse.data as List<GalleryProvider>;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryList error');
  }
}
