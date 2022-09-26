import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/parser/parser.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';

import '../utils/logger.dart';
import 'api.dart';
import 'app_dio/pdio.dart';

Options getOptions({bool forceRefresh = false}) {
  final options = Api.cacheOption
      .copyWith(
        policy: forceRefresh ? CachePolicy.refreshForceCache : null,
      )
      .toOptions();

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

  int? statusCode;

  final httpTransformer = HttpTransformerBuilder(
    (response) {
      logger.v('statusCode ${response.statusCode}');
      statusCode = response.statusCode;
      final list = parseGalleryList(response.data as String);
      return DioHttpResponse<GallerySet>.success(list);
    },
  );

  DioHttpResponse httpResponse = await dioHttpClient.get(
    '/',
    queryParameters: params,
    httpTransformer: httpTransformer,
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is GallerySet) {
    GallerySet data = httpResponse.data as GallerySet;
    if (statusCode == 304) {
      data = data.copyWith(fromCache: true);
    }
    return data;
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

Future<String?> getLoginToken() async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{
    'next': '/',
  };

  DioHttpResponse httpResponse = await dioHttpClient.get(
    NHConst.loginUrl,
    queryParameters: params,
    options: getOptions(forceRefresh: true),
    // cancelToken: cancelToken,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        final token = parseLoginPage(response.data as String);
        return DioHttpResponse<String>.success(token);
      },
    ),
  );

  if (httpResponse.ok && httpResponse.data is String) {
    return httpResponse.data as String;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getLoginToken error');
  }
}

Future<User> getInfoFromIndex({
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  DioHttpResponse httpResponse = await dioHttpClient.get(
    NHConst.baseUrl,
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        final user = parseInfo(response.data as String);
        return DioHttpResponse<User>.success(user);
      },
    ),
  );

  if (httpResponse.ok && httpResponse.data is User) {
    return httpResponse.data as User;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getInfo error');
  }
}

Future<User> getInfoFromUserPage({
  required String url,
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        final user = parseUserPage(response.data as String);
        return DioHttpResponse<User>.success(user);
      },
    ),
  );

  if (httpResponse.ok && httpResponse.data is User) {
    return httpResponse.data as User;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getInfo error');
  }
}

Future<void> loginNhentai({
  required String username,
  required String password,
  required String csrfToken,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final dataMap = <String, dynamic>{
    'username_or_email': username,
    'password': password,
    'csrfmiddlewaretoken': csrfToken
  };

  final params = <String, dynamic>{
    'next': '/',
  };

  final dataForm = FormData.fromMap(dataMap);

  DioHttpResponse httpResponse = await dioHttpClient.post(
    NHConst.loginUrl,
    queryParameters: params,
    data: dataForm,
    options: getOptions(forceRefresh: true)
      ..followRedirects = true
      ..validateStatus = (status) => status! < 500,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        logger.d('response ${response.headers}');
        return DioHttpResponse<void>.success(null);
      },
    ),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok) {
    return;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('login error');
  }
}
