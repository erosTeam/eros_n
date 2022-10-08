import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/parser/parser.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/enum.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

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

/// 使用API进行搜索
/// 有严重的bug
/// 某些情况某些页码会报 404 "error": "does not exist"
/// 严重影响搜索 暂时不使用
Future<GallerySearch> searchGalleryByApi({
  bool refresh = false,
  CancelToken? cancelToken,
  int? page,
  String? query,
  SearchSort? sort,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  const url = '/api/galleries/search';
  final params = <String, dynamic>{
    if (page != null) 'page': page,
    if (sort != null) 'sort': sort.value,
    'query': query ?? '',
  };

  final httpTransformer = HttpTransformerBuilder(
    (response) {
      logger.d('statusCode ${response.statusCode}');
      final data = jsonEncode(response.data).processApi;
      final result =
          GallerySearch.fromJson(jsonDecode(data) as Map<String, dynamic>);
      logger.v('result $result');
      return DioHttpResponse<GallerySearch>.success(result);
    },
  );

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
    queryParameters: params,
    httpTransformer: httpTransformer,
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is GallerySearch) {
    final data = httpResponse.data as GallerySearch;
    return data;
  } else {
    throw httpResponse.error ?? HttpException('searchGalleryByApi error');
  }
}

Future<GallerySet> searchGallery({
  bool refresh = false,
  CancelToken? cancelToken,
  int? page,
  String? query,
  SearchSort? sort,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  const url = '/search/';
  final params = <String, dynamic>{
    if (page != null) 'page': page,
    if (sort != null && sort.value.isNotEmpty) 'sort': sort.value,
    'q': query ?? '',
  };

  int? statusCode;
  final httpTransformer = HttpTransformerBuilder(
    (response) async {
      logger.v('statusCode ${response.statusCode}');
      statusCode = response.statusCode;
      final list = await parseGalleryList(response.data as String);
      return DioHttpResponse<GallerySet>.success(list);
    },
  );

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
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
    (response) async {
      logger.v('statusCode ${response.statusCode}');
      statusCode = response.statusCode;
      final list = await parseGalleryList(response.data as String);
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
      logger.d('fromCache');
      data = data.copyWith(fromCache: true);
    }
    return data;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryList error');
  }
}

Future<GallerySet> getFavoriteList({
  bool refresh = false,
  CancelToken? cancelToken,
  String? referer,
  int? page,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{
    if (page != null && page > 1) 'page': page,
  };

  int? statusCode;

  final httpTransformer = HttpTransformerBuilder(
    (response) async {
      logger.v('statusCode ${response.statusCode}');
      statusCode = response.statusCode;
      final list = await parseGalleryList(response.data as String);
      return DioHttpResponse<GallerySet>.success(list);
    },
  );

  DioHttpResponse httpResponse = await dioHttpClient.get(
    '/favorites/',
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
    throw httpResponse.error ?? HttpException('getFavoriteList error');
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
      (response) async {
        logger.d('statusCode ${response.statusCode}');
        final gallery = await parseGalleryDetail(response.data as String);
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

Future<List<Comment>> getGalleryComments({
  required int? gid,
  String? token,
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final url = '/api/gallery/$gid/comments';

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        final comments = <Comment>[];
        if (response.data is List) {
          for (final item in response.data as List) {
            if (item is Map) {
              comments.add(Comment.fromJson(item as Map<String, dynamic>));
            }
          }
        }
        return DioHttpResponse<List<Comment>>.success(comments);
      },
    ),
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is List<Comment>) {
    return httpResponse.data as List<Comment>;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryComments error');
  }
}

Future<String?> getLoginToken() async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{
    'next': '/',
  };

  DioHttpResponse httpResponse = await dioHttpClient.get(
    NHConst.loginUrl,
    // queryParameters: params,
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
    NHConst.infoUrl,
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

Future<Tuple2<bool?, int?>> setFavorite({
  required int? gid,
  required String? csrfToken,
  bool unfavorite = false,
  bool refresh = true,
  CancelToken? cancelToken,
}) async {
  if (gid == null) {
    return const Tuple2(null, null);
  }
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final path = '/api/gallery/$gid/${unfavorite ? 'unfavorite' : 'favorite'}';

  DioHttpResponse httpResponse = await dioHttpClient.post(
    path,
    options: getOptions(forceRefresh: refresh)
      ..headers = {'x-csrftoken': csrfToken},
    cancelToken: cancelToken,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        final result = response.data;
        final favNums = result['num_favorites'] as List<dynamic>?;
        final favNum = favNums?.first as int?;
        final favorited = result['favorited'] as bool?;
        return DioHttpResponse<Tuple2<bool?, int?>>.success(
            Tuple2(favorited, favNum));
      },
    ),
  );

  if (httpResponse.ok && httpResponse.data is Tuple2<bool?, int?>) {
    return httpResponse.data as Tuple2<bool?, int?>;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('setFavorite error');
  }
}

Future<bool> loginNhentai({
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
    // queryParameters: params,
    data: dataForm,
    options: getOptions(forceRefresh: true)
      ..followRedirects = false
      ..validateStatus = (status) => status! < 500,
    httpTransformer: HttpTransformerBuilder(
      (response) {
        logger.d('statusCode ${response.statusCode}');
        logger.d('response ${response.headers}');
        if (response.statusCode == 302) {
          return DioHttpResponse<bool>.success(true);
        } else {
          return DioHttpResponse<bool>.success(false);
        }
      },
    ),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is bool) {
    return httpResponse.data as bool;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('login error');
  }
}

Future<void> nhDownload({
  required String url,
  required savePath,
  CancelToken? cancelToken,
  bool? errToast,
  bool deleteOnError = true,
  VoidCallback? onDownloadComplete,
  ProgressCallback? progressCallback,
}) async {
  late final String downloadUrl;
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);
  if (!url.startsWith(RegExp(r'https?://'))) {
    downloadUrl = '${NHConst.baseUrl}$url';
  } else {
    downloadUrl = url;
  }
  logger.v('downloadUrl $downloadUrl');
  try {
    final response = await dioHttpClient.download(
      downloadUrl,
      savePath,
      deleteOnError: deleteOnError,
      onReceiveProgress: (int count, int total) {
        progressCallback?.call(count, total);
        if (count == total) {
          onDownloadComplete?.call();
        }
      },
      cancelToken: cancelToken,
    );

    // logger.d('response.runtimeType ${response.runtimeType}');
    // logger.d('response.statusCode ${response.headers}');
  } on CancelException catch (e) {
    logger.d('cancel');
  } on Exception catch (e) {
    rethrow;
  }
}

Future<Map> getGithubApi(String url) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);
  DioHttpResponse httpResponse =
      await dioHttpClient.get(url, options: getOptions(forceRefresh: true));
  if (httpResponse.ok && httpResponse.data is Map) {
    return httpResponse.data as Map;
  } else {
    throw httpResponse.error ?? HttpException('getGithubApi error');
  }
}
