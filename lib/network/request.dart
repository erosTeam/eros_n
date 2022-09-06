import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:eros_n/common/global.dart';

import '../common/const/const.dart';
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

Future getGalleryList({
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  DioHttpResponse httpResponse = await dioHttpClient.get(
    '/',
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        return DioHttpResponse<bool>.success(true);
      },
    ),
    options: getCacheOptions(forceRefresh: refresh)
      ..followRedirects = true
      ..headers = {
        'referer': NHConst.baseUrl,
        // 'cookie':
        //     'csrftoken=PMMs3EuNZIDDx8bo9n0x06dkqqbphsQiyUk8pT0KbJ2gbQEWiSHf4FrwQj1chMgq;cf_clearance=HxXGMxwGki0vutcNrSlLVucXZB3oFJJAizhDLOVwyQI-1662486110-0-150'
      },
    // ..validateStatus = (status) => (status ?? 0) <= 503,
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is bool) {
    return httpResponse.data as bool;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryList error');
  }
}
