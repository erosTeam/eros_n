import 'dart:convert';
import 'dart:io' show File;

import 'package:collection/collection.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/gallery_fetch_mode.dart';
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

/// Search galleries via nhentai's v2 API (`GET /api/v2/search`).
///
/// Replaces the old HTML scrape of `/search/` — the SvelteKit frontend no
/// longer ships per-gallery `data-tags`, so the JSON endpoint is the only
/// way to get tag ids back into the listing.
Future<GallerySet> searchGallery({
  bool refresh = false,
  CancelToken? cancelToken,
  int? page,
  String? query,
  SearchSort? sort,
}) async {
  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  const url = '/api/v2/search';
  final params = <String, dynamic>{
    'query': query ?? '',
    'page': ?page,
    if (sort != null && sort.value.isNotEmpty) 'sort': sort.value,
  };

  logger.d('searchGallery params $params');

  int? statusCode;
  final httpTransformer = HttpTransformerBuilder((response) async {
    statusCode = response.statusCode;
    final json = response.data as Map<String, dynamic>;
    final set = await parseGalleryListV2(json, backfill: getTagsByIds);
    return DioHttpResponse<GallerySet>.success(set);
  });

  final httpResponse = await dioHttpClient.get(
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
    throw httpResponse.error ?? HttpException('searchGallery error');
  }
}

/// Newest galleries via `/api/v2/galleries`. Used as the front page list
/// when no language filter is active. Popular galleries live on a separate
/// endpoint (`/api/v2/galleries/popular`) and are fetched alongside via
/// `getPopularList`.
Future<GallerySet> getGalleryList({
  bool refresh = false,
  CancelToken? cancelToken,
  String? referer,
  int? page,
}) async {
  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{'page': ?page};

  int? statusCode;

  final httpTransformer = HttpTransformerBuilder((response) async {
    statusCode = response.statusCode;
    final json = response.data as Map<String, dynamic>;
    final set = await parseGalleryListV2(json, backfill: getTagsByIds);
    return DioHttpResponse<GallerySet>.success(set);
  });

  final httpResponse = await dioHttpClient.get(
    '/api/v2/galleries',
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

/// Today's popular galleries via `/api/v2/galleries/popular`. Returns a
/// bare JSON array (no pagination), so we route through the array variant
/// of the parser. Caller is expected to swallow failures so a popular
/// outage doesn't take down the main listing.
Future<GallerySet> getPopularList({
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final httpTransformer = HttpTransformerBuilder((response) async {
    final list = response.data as List<dynamic>;
    final set = await parseGalleryListV2Array(list, backfill: getTagsByIds);
    return DioHttpResponse<GallerySet>.success(set);
  });

  final httpResponse = await dioHttpClient.get(
    '/api/v2/galleries/popular',
    httpTransformer: httpTransformer,
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is GallerySet) {
    return httpResponse.data as GallerySet;
  }
  throw httpResponse.error ?? HttpException('getPopularList error');
}

/// User favorites via `/api/v2/favorites`. Requires the v2 access token,
/// which `ApiV2AuthInterceptor` injects from the persisted cookie jar.
Future<GallerySet> getFavoriteList({
  bool refresh = false,
  CancelToken? cancelToken,
  String? referer,
  int? page,
  String? query,
}) async {
  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final params = <String, dynamic>{
    if (page != null && page > 1) 'page': page,
    if (query != null && query.isNotEmpty) 'q': query,
  };

  int? statusCode;

  final httpTransformer = HttpTransformerBuilder((response) async {
    statusCode = response.statusCode;
    final json = response.data as Map<String, dynamic>;
    final set = await parseGalleryListV2(
      json,
      kind: GalleryListKind.favorites,
      backfill: getTagsByIds,
    );
    return DioHttpResponse<GallerySet>.success(set);
  });

  final httpResponse = await dioHttpClient.get(
    '/api/v2/favorites',
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
  final mode = defaultTargetPlatform == TargetPlatform.ohos
      ? GalleryFetchMode.api
      : kGalleryFetchMode;

  if (mode == GalleryFetchMode.api) {
    final gid = RegExp(r'/g/(\d+)/').firstMatch(url)?.group(1);
    if (gid != null) {
      return _getGalleryDetailByApi(int.parse(gid), refresh: refresh, cancelToken: cancelToken);
    }
  }

  if (mode == GalleryFetchMode.html) {
    return _getGalleryDetailHtml(url: url, refresh: refresh, cancelToken: cancelToken);
  }

  // autoFallback: try HTML first, fall back to API on CF 403.
  try {
    return await _getGalleryDetailHtml(url: url, refresh: refresh, cancelToken: cancelToken);
  } on BadRequestException catch (e) {
    if (e.code == 403) {
      logger.w('getGalleryDetail CF 403, falling back to API for $url');
      final gid = RegExp(r'/g/(\d+)/').firstMatch(url)?.group(1);
      if (gid != null) {
        return _getGalleryDetailByApi(int.parse(gid), refresh: refresh, cancelToken: cancelToken);
      }
    }
    rethrow;
  }
}

Future<Gallery> _getGalleryDetailHtml({
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

/// Fetches gallery detail via `GET /api/v2/galleries/<gid>` (JSON, no Cloudflare).
Future<Gallery> _getGalleryDetailByApi(
  int gid, {
  bool refresh = false,
  CancelToken? cancelToken,
}) async {
  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final DioHttpResponse httpResponse = await dioHttpClient.get(
    '/api/v2/galleries/$gid',
    httpTransformer: HttpTransformerBuilder((response) async {
      final json = response.data as Map<String, dynamic>;
      final gallery = await parseGalleryDetailFromApi(json);
      return DioHttpResponse<Gallery>.success(gallery);
    }),
    options: getOptions(forceRefresh: refresh),
    cancelToken: cancelToken,
  );

  if (!httpResponse.ok || httpResponse.data is! Gallery) {
    logger.e('_getGalleryDetailByApi gid=$gid ${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('getGalleryDetail api error');
  }

  final gallery = httpResponse.data as Gallery;

  // Fetch related galleries separately (best-effort, don't fail on error).
  try {
    final relatedResponse = await dioHttpClient.get(
      '/api/v2/galleries/$gid/related',
      httpTransformer: HttpTransformerBuilder((response) {
        final data = response.data as Map<String, dynamic>;
        final items = (data['result'] as List? ?? []).whereType<Map>().map((item) {
          final id = (item['id'] as num?)?.toInt() ?? 0;
          final mediaId = item['media_id'] as String?;
          final thumbPath = item['thumbnail'] as String? ?? '';
          return Gallery(
            gid: id,
            mediaId: mediaId,
            title: GalleryTitle(
              englishTitle: item['english_title'] as String?,
              japaneseTitle: item['japanese_title'] as String?,
            ),
            images: GalleryImages(
              pages: const [],
              cover: const GalleryImage(),
              thumbnail: GalleryImage(
                type: thumbPath.endsWith('.webp') ? 'w' : 'j',
                imgWidth: (item['thumbnail_width'] as num?)?.toInt(),
                imgHeight: (item['thumbnail_height'] as num?)?.toInt(),
                imageUrl: thumbPath.isNotEmpty
                    ? 'https://t.nhentai.net/$thumbPath'
                    : null,
              ),
            ),
            numPages: (item['num_pages'] as num?)?.toInt(),
            simpleTags: (item['tag_ids'] as List? ?? [])
                .whereType<num>()
                .map((id) => Tag(id: id.toInt()))
                .toList(),
            tags: const [],
            moreLikeGallerys: const [],
          );
        }).toList();
        return DioHttpResponse<List<Gallery>>.success(items);
      }),
      options: getOptions(forceRefresh: refresh),
      cancelToken: cancelToken,
    );
    if (relatedResponse.ok && relatedResponse.data is List<Gallery>) {
      return gallery.copyWith(moreLikeGallerys: relatedResponse.data as List<Gallery>);
    }
  } catch (e) {
    logger.w('_getGalleryDetailByApi related gid=$gid error: $e');
  }

  return gallery;
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

Future<({bool? favorited, int? favNum})> setFavorite({
  required int? gid,
  required String? csrfToken,
  bool unfavorite = false,
  bool refresh = true,
  CancelToken? cancelToken,
}) async {
  if (gid == null) {
    return (favorited: null, favNum: null);
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
    return DioHttpResponse<({bool? favorited, int? favNum})>.success((
      favorited: favorited,
      favNum: favNum,
    ));
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

  if (httpResponse.ok &&
      httpResponse.data is ({bool? favorited, int? favNum})) {
    return httpResponse.data as ({bool? favorited, int? favNum});
  } else {
    logger.e('${httpResponse.error.runtimeType}');
    throw httpResponse.error ?? HttpException('setFavorite error');
  }
}

/// Queries nhentai for the current user's favorite state on a gallery.
///
/// nhentai's SvelteKit frontend renders the favorite button server-side
/// without any session-aware state, so the only way to know whether the
/// logged-in user has favorited a gallery is to ask the API directly.
///
/// Returns the boolean state when the API answered, or `null` when the
/// endpoint isn't available / the user isn't logged in / the request
/// failed. Failures are intentionally swallowed: this is a best-effort
/// enrichment, not a hard requirement for the detail page.
Future<bool?> getGalleryFavoriteStatus({
  required int? gid,
  CancelToken? cancelToken,
}) async {
  if (gid == null) {
    return null;
  }
  final dio = DioHttpClient(dioConfig: globalDioConfig);
  final path = '/api/v2/galleries/$gid/favorite';
  try {
    final r = await dio.get(
      path,
      options: getOptions(forceRefresh: true)
        ..validateStatus = (status) => status != null && status < 500,
      cancelToken: cancelToken,
      httpTransformer: HttpTransformerBuilder((response) {
        final status = response.statusCode ?? 0;
        if (status >= 400) {
          return DioHttpResponse<bool?>.success(null);
        }
        final data = response.data;
        if (data is Map) {
          final fav = data['favorited'];
          if (fav is bool) {
            return DioHttpResponse<bool?>.success(fav);
          }
        }
        return DioHttpResponse<bool?>.success(null);
      }),
    );
    return r.ok ? r.data as bool? : null;
  } catch (e) {
    logger.d('getGalleryFavoriteStatus failed: $e');
    return null;
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
  // Use longer timeouts for CDN image downloads — under high concurrency the
  // CDN can take >10 s to start responding, which is the default connectTimeout.
  final downloadDioConfig = globalDioConfig.copyWith(
    connectTimeout: 30000,
    receiveTimeout: 60000,
  );
  DioHttpClient dioHttpClient = DioHttpClient(dioConfig: downloadDioConfig);
  if (!url.startsWith(RegExp(r'https?://'))) {
    downloadUrl = '${NHConst.baseUrl}$url';
  } else {
    downloadUrl = url;
  }
  logger.t('downloadUrl $downloadUrl');

  // Anything served by nhentai.net *itself* is behind Cloudflare and would
  // get blocked if dio streamed it directly. Pull it through the hidden
  // WebView proxy so the request inherits the browser's TLS fingerprint
  // and session cookies (needed for /g/{id}/download).
  // Image CDN subdomains (i.nhentai.net, t.nhentai.net) are NOT behind the
  // challenge and are already accessible via Dio; routing them through the
  // proxy would trigger a cross-origin fetch error inside the WebView.
  final downloadUri = Uri.parse(downloadUrl);
  final viaProxy = downloadUri.host == 'nhentai.net';

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

/// nhentai's v2 API gates write actions (comments, edits, etc.) behind a
/// proof-of-work challenge fetched from `GET /api/v2/pow?action=...`. The
/// server returns `{challenge: hex, difficulty: int}`; the client must find a
/// nonce such that `sha256(challenge + nonce)` has at least `difficulty`
/// leading zero bits. Difficulty for `create_comment` is currently 16, which
/// is solved in ~30k attempts (a few ms on device).
Future<({String challenge, String nonce})> _solveCommentPow({
  CancelToken? cancelToken,
}) async {
  final dio = DioHttpClient(dioConfig: globalDioConfig);
  final resp = await dio.get(
    '/api/v2/pow',
    queryParameters: const {'action': 'comment'},
    options: getOptions(forceRefresh: true)
      ..validateStatus = (status) => status != null && status < 500,
    cancelToken: cancelToken,
    httpTransformer: HttpTransformerBuilder((response) {
      final data = response.data;
      if (data is Map &&
          data['challenge'] is String &&
          data['difficulty'] is int) {
        return DioHttpResponse<({String challenge, int difficulty})>.success((
          challenge: data['challenge'] as String,
          difficulty: data['difficulty'] as int,
        ));
      }
      return DioHttpResponse<({String challenge, int difficulty})>.failure(
        errorMsg: 'invalid PoW challenge: $data',
      );
    }),
  );

  if (!resp.ok || resp.data is! ({String challenge, int difficulty})) {
    throw resp.error ?? HttpException('failed to fetch PoW challenge');
  }
  final challenge =
      (resp.data as ({String challenge, int difficulty})).challenge;
  final difficulty =
      (resp.data as ({String challenge, int difficulty})).difficulty;
  final nonce = _findPowNonce(challenge: challenge, difficulty: difficulty);
  return (challenge: challenge, nonce: nonce);
}

String _findPowNonce({required String challenge, required int difficulty}) {
  final prefixBytes = utf8.encode(challenge);
  // Bound the search to keep us from spinning forever if the server hands us
  // an unreasonable difficulty. 2 million attempts at difficulty=24 is still
  // < 1s on modern phones; anything beyond that means we should bail.
  const maxAttempts = 2000000;
  for (var i = 0; i < maxAttempts; i++) {
    final nonce = i.toString();
    final input = Uint8List(prefixBytes.length + nonce.length)
      ..setRange(0, prefixBytes.length, prefixBytes)
      ..setRange(
        prefixBytes.length,
        prefixBytes.length + nonce.length,
        utf8.encode(nonce),
      );
    final digest = sha256.convert(input).bytes;
    if (_leadingZeroBits(digest) >= difficulty) {
      return nonce;
    }
  }
  throw HttpException('PoW solver exhausted at difficulty=$difficulty');
}

int _leadingZeroBits(List<int> bytes) {
  var count = 0;
  for (final b in bytes) {
    if (b == 0) {
      count += 8;
      continue;
    }
    var bit = 7;
    while (bit >= 0 && (b >> bit) & 1 == 0) {
      count++;
      bit--;
    }
    break;
  }
  return count;
}

Future<({bool ok, Comment? comment})> postComment({
  required int gid,
  required String comment,
  required String? csrfToken,
  CancelToken? cancelToken,
}) async {
  final dio = DioHttpClient(dioConfig: globalDioConfig);

  // nhentai migrated comment posting to /api/v2 along with the rest of the
  // SvelteKit rewrite. The legacy `/api/gallery/.../comments/submit` route
  // returns 404 (with a "use /api/v2 instead" notice in the body). The new
  // endpoint expects `{body, pow_challenge, pow_nonce}` and authenticates
  // via the access token cookie that the webview proxy injects automatically.
  final pow = await _solveCommentPow(cancelToken: cancelToken);

  final url = '/api/v2/galleries/$gid/comments';
  final dataJson = jsonEncode(<String, dynamic>{
    'body': comment,
    'pow_challenge': pow.challenge,
    'pow_nonce': pow.nonce,
  });

  final httpResponse = await dio.post(
    url,
    data: dataJson,
    options: getOptions(forceRefresh: true)
      ..contentType = 'application/json'
      ..followRedirects = false
      ..validateStatus = (status) => status != null && status < 500,
    httpTransformer: HttpTransformerBuilder((response) {
      final status = response.statusCode ?? 0;
      final data = response.data;

      if (status >= 400) {
        logger.w('postComment failed: $status $data');
        // v2 surfaces validation errors as `{"error": "..."}`; auth/CF
        // failures usually come back as HTML. Either way, surface the
        // most useful string we can find without crashing on type mismatch.
        String? error;
        if (data is Map) {
          final raw = data['error'] ?? data['detail'] ?? data['message'];
          if (raw is String) {
            error = raw;
          }
        }
        return DioHttpResponse<({bool ok, Comment? comment})>.failure(
          errorMsg: error ?? 'postComment failed: HTTP $status',
        );
      }

      // v2 typically returns the freshly created Comment as a top-level
      // JSON object; tolerate `{"comment": {...}}` too just in case.
      Map<String, dynamic>? commentJson;
      if (data is Map<String, dynamic>) {
        if (data['id'] != null) {
          commentJson = data;
        } else if (data['comment'] is Map) {
          commentJson = (data['comment'] as Map).cast<String, dynamic>();
        }
      }

      if (commentJson != null) {
        return DioHttpResponse<({bool ok, Comment? comment})>.success((
          ok: true,
          comment: Comment.fromJson(commentJson),
        ));
      }
      return DioHttpResponse<({bool ok, Comment? comment})>.success((
        ok: false,
        comment: null,
      ));
    }),
    cancelToken: cancelToken,
  );

  if (httpResponse.ok && httpResponse.data is ({bool ok, Comment? comment})) {
    return httpResponse.data as ({bool ok, Comment? comment});
  }
  throw httpResponse.error ?? HttpException('postComment error');
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
    ?pinnedType,
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

/// Resolve a batch of tag ids into rich `Tag` objects via
/// `GET /api/v2/tags/ids?ids=...`. The endpoint accepts at most 100 ids
/// per call (rate-limited to 15/min per IP), so we chunk and bail out
/// gracefully on rate-limit errors. Used to backfill the local
/// `NhTag` table for ids encountered in v2 list responses but not yet
/// known locally.
Future<List<Tag>> getTagsByIds(
  List<int> ids, {
  CancelToken? cancelToken,
}) async {
  if (ids.isEmpty) {
    return const [];
  }
  final dioHttpClient = DioHttpClient(dioConfig: globalDioConfig);

  final results = <Tag>[];
  // Chunk to 100 per call. /api/v2/tags/ids hard-caps at 100 ids and the
  // overall rate limit is 15/min, so even worst-case (~1000 ids on a busy
  // listing) only burns ~10 calls.
  for (var i = 0; i < ids.length; i += 100) {
    final chunk = ids.sublist(i, i + 100 > ids.length ? ids.length : i + 100);
    try {
      final resp = await dioHttpClient.get(
        '/api/v2/tags/ids',
        queryParameters: {'ids': chunk.join(',')},
        options: getOptions(),
        cancelToken: cancelToken,
        httpTransformer: HttpTransformerBuilder((response) {
          final code = response.statusCode ?? 0;
          if (code >= 400) {
            logger.w('getTagsByIds $code: ${response.data}');
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
        results.add(Tag.fromJson(raw.cast<String, dynamic>()));
      }
    } catch (e) {
      logger.w('getTagsByIds chunk failed: $e');
    }
  }
  return results;
}

/// Returns the nhentai csrftoken cookie value from the persistent cookie jar.
/// Used when Gallery.csrfToken is null (API mode) and a write operation needs it.
Future<String?> getCsrfTokenFromCookie() async {
  final cookies = await Global.cookieJar
      .loadForRequest(Uri.parse(NHConst.baseUrl));
  return cookies.firstWhereOrNull((Cookie c) => c.name == 'csrftoken')?.value;
}
