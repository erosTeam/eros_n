import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/parser/parser.dart';
import 'package:eros_n/component/models/index.dart';

import '../utils/logger.dart';
import 'api.dart';
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
        policy: forceRefresh ? CachePolicy.refreshForceCache : null,
      )
      .toOptions();
  // if (forceRefresh) {
  //   options.validateStatus = (status) => status == 200 || status == 304;
  // }

  return options;
}

Future<GallerySet> getGalleryList({
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
        return DioHttpResponse<GallerySet>.success(list);
      },
    ),
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is GallerySet) {
    return httpResponse.data as GallerySet;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryList error');
  }
}

Future<Gallery> getGalleryDetail({
  required String url,
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        final gallery = parseGalleryDetail(response.data as String);
        return DioHttpResponse<Gallery>.success(gallery);
      },
    ),
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is Gallery) {
    return httpResponse.data as Gallery;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryDetail error');
  }
}

Future<GalleryImage> getGalleryImage({
  required String url,
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        final galleryThumb = parseGalleryImage(response.data as String);
        return DioHttpResponse<GalleryImage>.success(galleryThumb);
      },
    ),
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is GalleryImage) {
    return httpResponse.data as GalleryImage;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryImage error');
  }
}
