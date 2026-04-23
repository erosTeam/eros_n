import 'dart:convert';
import 'dart:io' show File;

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/parser/parser.dart';
import 'package:eros_n/component/exception/error.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/api.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/webview_proxy/hidden_webview_proxy.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

Options getOptions({bool forceRefresh = false}) {
  final options = Api.cacheOption
      .copyWith(policy: forceRefresh ? CachePolicy.refreshForceCache : null)
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
    'page': ?page,
    if (sort != null) 'sort': sort.value,
    'query': query ?? '',
  };

  final httpTransformer = HttpTransformerBuilder((response) {
    logger.d('statusCode ${response.statusCode}');
    final data = jsonEncode(response.data).processApi;
    final result = GallerySearch.fromJson(
      jsonDecode(data) as Map<String, dynamic>,
    );
    logger.t('result $result');
    return DioHttpResponse<GallerySearch>.success(result);
  });

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
    'page': ?page,
    if (sort != null && sort.value.isNotEmpty) 'sort': sort.value,
    'q': query ?? '',
  };

  logger.d('searchGallery params $params');

  int? statusCode;
  final httpTransformer = HttpTransformerBuilder((response) async {
    logger.t('statusCode ${response.statusCode}');
    statusCode = response.statusCode;
    final list = await parseGalleryList(response.data as String);
    return DioHttpResponse<GallerySet>.success(list);
  });

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

  final params = <String, dynamic>{'page': ?page};

  int? statusCode;

  final httpTransformer = HttpTransformerBuilder((response) async {
    logger.t('statusCode ${response.statusCode}');
    statusCode = response.statusCode;
    final list = await parseGalleryList(response.data as String);
    return DioHttpResponse<GallerySet>.success(list);
  });

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
      logger.t('fromCache');
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

  final params = <String, dynamic>{if (page != null && page > 1) 'page': page};

  int? statusCode;

  final httpTransformer = HttpTransformerBuilder((response) async {
    logger.t('statusCode ${response.statusCode}');
    statusCode = response.statusCode;
    final list = await parseGalleryList(response.data as String);
    return DioHttpResponse<GallerySet>.success(list);
  });

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
    httpTransformer: HttpTransformerBuilder((response) async {
      logger.t('statusCode ${response.statusCode}');
      final gallery = await parseGalleryDetail(response.data as String);
      return DioHttpResponse<Gallery>.success(gallery);
    }),
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
    httpTransformer: HttpTransformerBuilder((response) {
      logger.d('statusCode ${response.statusCode}');
      final galleryThumb = parseGalleryImage(response.data as String);
      return DioHttpResponse<GalleryImage>.success(galleryThumb);
    }),
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

  // nhentai migrated to /api/v2 in late 2025; the legacy /api/gallery/.../comments
  // endpoint now returns 404 with a pointer to /api/v2/docs.
  final url = '/api/v2/galleries/$gid/comments';
  logger.d('url $url');

  DioHttpResponse httpResponse = await dioHttpClient.get(
    url,
    httpTransformer: HttpTransformerBuilder((response) {
      final comments = <Comment>[];
      if (response.data is List) {
        for (final item in response.data as List) {
          if (item is Map) {
            comments.add(Comment.fromJson(item as Map<String, dynamic>));
          }
        }
      }
      return DioHttpResponse<List<Comment>>.success(comments);
    }),
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

  DioHttpResponse httpResponse = await dioHttpClient.get(
    NHConst.loginUrl,
    // queryParameters: {'next': '/'},
    options: getOptions(forceRefresh: true),
    // cancelToken: cancelToken,
    httpTransformer: HttpTransformerBuilder((response) {
      logger.d('statusCode ${response.statusCode}');
      final token = parseLoginPage(response.data as String);
      return DioHttpResponse<String>.success(token);
    }),
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
    httpTransformer: HttpTransformerBuilder((response) {
      final user = parseInfo(response.data as String);
      return DioHttpResponse<User>.success(user);
    }),
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
    httpTransformer: HttpTransformerBuilder((response) {
      final user = parseUserPage(response.data as String);
      return DioHttpResponse<User>.success(user);
    }),
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

  // nhentai v2 API: POST adds, DELETE removes. The response is
  // { favorited: bool, num_favorites: int? }. CSRF tokens are no longer
  // required — auth is purely cookie/Bearer based.
  final path = '/api/v2/galleries/$gid/favorite';

  final httpTransformer = HttpTransformerBuilder((response) {
    final result = response.data as Map<String, dynamic>? ?? const {};
    final favorited = result['favorited'] as bool?;
    final favNum = result['num_favorites'] as int?;
    return DioHttpResponse<Tuple2<bool?, int?>>.success(
      Tuple2(favorited, favNum),
    );
  });

  final options = getOptions(forceRefresh: refresh);
  if (csrfToken != null && csrfToken.isNotEmpty) {
    options.headers = {...?options.headers, 'x-csrftoken': csrfToken};
  }

  final DioHttpResponse httpResponse = unfavorite
      ? await dioHttpClient.delete(
          path,
          options: options,
          cancelToken: cancelToken,
          httpTransformer: httpTransformer,
        )
      : await dioHttpClient.post(
          path,
          options: options,
          cancelToken: cancelToken,
          httpTransformer: httpTransformer,
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

  // Use application/x-www-form-urlencoded body so the request can travel
  // through the WebView fetch proxy as a plain string. Multipart FormData
  // would not survive jsonEncode in the proxy boundary.
  final fields = <String, String>{
    'username_or_email': username,
    'password': password,
    'csrfmiddlewaretoken': csrfToken,
  };
  final formBody = fields.entries
      .map(
        (e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}',
      )
      .join('&');

  DioHttpResponse httpResponse = await dioHttpClient.post(
    NHConst.loginUrl,
    data: formBody,
    options: getOptions(forceRefresh: true)
      ..contentType = Headers.formUrlEncodedContentType
      ..headers = {'Referer': NHConst.loginUrl}
      ..validateStatus = (status) => status != null && status < 500,
    httpTransformer: HttpTransformerBuilder((response) {
      final finalUrl = (response.extra['final_url'] as String?) ?? '';
      logger.d('login statusCode=${response.statusCode}, finalUrl=$finalUrl');
      // Through the WebView proxy fetch follows redirects automatically,
      // so a successful login lands on the index ("/") instead of staying
      // on "/login/". Treat that as success.
      final landedAwayFromLogin =
          finalUrl.isNotEmpty && !Uri.parse(finalUrl).path.contains('/login');
      if (response.statusCode == 302 || landedAwayFromLogin) {
        return DioHttpResponse<bool>.success(true);
      }
      // Inspect the body for typical login error markers as a fallback
      // (CAPTCHA / invalid credential responses are 200 OK with a form).
      final body = response.data is String ? response.data as String : '';
      if (body.contains('Please verify') || body.contains('captcha')) {
        throw LoginCaptchaError();
      }
      if (body.contains('Please enter a correct') || body.contains('Invalid')) {
        throw LoginInvalidError();
      }
      return DioHttpResponse<bool>.success(false);
    }),
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
  logger.t('downloadUrl $downloadUrl');

  // Anything served by nhentai.net itself is behind Cloudflare and would
  // get blocked if dio streamed it directly. Pull it through the hidden
  // WebView proxy so the request inherits the browser's TLS fingerprint
  // and session cookies (needed for /g/{id}/download).
  final downloadUri = Uri.parse(downloadUrl);
  final viaProxy = downloadUri.host.endsWith('nhentai.net');

  try {
    if (viaProxy) {
      final resp = await HiddenWebViewProxy.instance.requestBinary(
        url: downloadUrl,
        method: 'GET',
      );
      if (resp.status < 200 || resp.status >= 400) {
        throw HttpException(
          'nhDownload via proxy failed: ${resp.status} ${resp.statusText}',
        );
      }
      // Synthesise the headers shape that the savePath callback expects
      // so call sites that read content-disposition keep working.
      final headersMap = <String, List<String>>{};
      resp.headers.forEach((k, v) {
        headersMap[k.toLowerCase()] = [v];
      });
      final headers = Headers.fromMap(headersMap);
      final resolvedPath = savePath is String
          ? savePath
          : (savePath as String Function(Headers))(headers);
      final file = File(resolvedPath);
      await file.create(recursive: true);
      await file.writeAsBytes(resp.bytes);
      progressCallback?.call(resp.bytes.length, resp.bytes.length);
      onDownloadComplete?.call();
      return;
    }

    // dio_cache_interceptor crashes with "Response type not supported"
    // when it tries to persist a stream response. dio's download flow
    // is always stream-based, so disable caching for these requests.
    final downloadOptions =
        Api.cacheOption.copyWith(policy: CachePolicy.noCache).toOptions()
          ..responseType = ResponseType.stream;
    await dioHttpClient.download(
      downloadUrl,
      savePath,
      options: downloadOptions,
      deleteOnError: deleteOnError,
      onReceiveProgress: (int count, int total) {
        progressCallback?.call(count, total);
        if (count == total) {
          onDownloadComplete?.call();
        }
      },
      cancelToken: cancelToken,
    );
  } on CancelException {
    logger.d('cancel');
  } on Exception {
    rethrow;
  }
}

Future<Map> getGithubApi(String url) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);
  // GitHub's REST API requires a non-empty UA and gets nervous when one
  // is missing/non-standard, on top of a strict 60/hour anonymous quota.
  final opts = getOptions(forceRefresh: true)
    ..headers = <String, dynamic>{
      'Accept': 'application/vnd.github+json',
      'X-GitHub-Api-Version': '2022-11-28',
      'User-Agent':
          'Mozilla/5.0 (Linux; Android 14; ErosN) AppleWebKit/537.36 '
          '(KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36',
    };

  final httpResponse = await dioHttpClient.get(
    url,
    options: opts,
    httpTransformer: HttpTransformerBuilder((response) {
      final code = response.statusCode ?? 0;
      if (code >= 400) {
        logger.w('getGithubApi $code body=${response.data}');
        return DioHttpResponse<dynamic>.failure(errorMsg: 'getGithubApi $code');
      }
      return DioHttpResponse<dynamic>.success(response.data);
    }),
  );
  if (httpResponse.ok && httpResponse.data is Map) {
    return httpResponse.data as Map;
  } else {
    throw httpResponse.error ?? HttpException('getGithubApi error');
  }
}

Future<Tuple2<bool, Comment?>> postComment({
  required int gid,
  required String comment,
  required String? csrfToken,
  CancelToken? cancelToken,
}) async {
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final dataMap = <String, dynamic>{'body': comment};

  final url = '/api/gallery/$gid/comments/submit';

  final dataJson = jsonEncode(dataMap);

  DioHttpResponse httpResponse = await dioHttpClient.post(
    url,
    data: dataJson,
    options: getOptions(forceRefresh: true)
      ..followRedirects = false
      ..headers = {'x-csrftoken': csrfToken}
      ..validateStatus = (status) => status! < 500,
    httpTransformer: HttpTransformerBuilder((response) {
      logger.d('statusCode ${response.statusCode}');
      logger.d('response ${response.data}');
      final success = response.data['success'] as bool?;
      final comment = response.data['comment'] as Map?;
      final error = response.data['error'] as String?;
      if (error != null) {
        return DioHttpResponse<Tuple2<bool, Comment?>>.failure(errorMsg: error);
      }

      if (success == true && comment != null) {
        final Comment commentObj = Comment.fromJson(
          comment as Map<String, dynamic>,
        );
        return DioHttpResponse<Tuple2<bool, Comment?>>.success(
          Tuple2(true, commentObj),
        );
      } else {
        return DioHttpResponse<Tuple2<bool, Comment?>>.success(
          const Tuple2(false, null),
        );
      }
    }),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is Tuple2<bool, Comment?>) {
    return httpResponse.data as Tuple2<bool, Comment?>;
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('postComment error');
  }
}

Future<List<Tag>> nhAutocomplete({
  String? name,
  TagCategory? type,
  String? typeName,
  CancelToken? cancelToken,
  int limit = 15,
}) async {
  final trimmed = (name ?? '').trim();
  if (trimmed.isEmpty) {
    return const [];
  }

  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  // nhentai's v2 autocomplete is `POST /api/v2/tags/search` with body
  // `{ "type": <namespace>, "query": <prefix>, "limit": N }`. The `type`
  // field is required and only accepts singular forms (tag, parody,
  // character, artist, group, language, category). When the caller does
  // not pin a namespace we fan out across the most useful ones.
  final pinnedType = typeName != null
      ? singularizeTagType(typeName)
      : (type != null ? singularizeTagType(type.value) : null);
  final probeTypes = <String>[
    if (pinnedType != null) pinnedType,
    if (pinnedType == null) ...[
      'tag',
      'parody',
      'character',
      'artist',
      'group',
    ],
  ];

  final aggregated = <Tag>[];
  final seenIds = <int>{};
  for (final probeType in probeTypes) {
    final body = <String, dynamic>{
      'type': probeType,
      'query': trimmed,
      'limit': limit,
    };
    try {
      final resp = await dioHttpClient.post(
        '/api/v2/tags/search',
        data: body,
        options: getOptions(forceRefresh: true)
          ..contentType = 'application/json'
          ..validateStatus = (s) => s != null && s < 500,
        cancelToken: cancelToken,
        httpTransformer: HttpTransformerBuilder((response) {
          final code = response.statusCode ?? 0;
          if (code >= 400) {
            logger.d('autocomplete($probeType) $code: ${response.data}');
            return DioHttpResponse<dynamic>.success(const <dynamic>[]);
          }
          return DioHttpResponse<dynamic>.success(response.data);
        }),
      );
      if (!resp.ok || resp.data is! List) {
        continue;
      }
      for (final raw in resp.data as List) {
        if (raw is! Map) {
          continue;
        }
        final map = raw.cast<String, dynamic>();
        final id = map['id'];
        if (id is! int || !seenIds.add(id)) {
          continue;
        }
        aggregated.add(Tag.fromJson(map));
      }
    } catch (e) {
      logger.w('autocomplete($probeType) failed: $e');
    }
    if (pinnedType != null) {
      break;
    }
  }

  return aggregated;
}
