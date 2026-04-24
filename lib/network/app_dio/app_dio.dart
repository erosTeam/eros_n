import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/network/app_dio/api_v2_auth_interceptor.dart';
import 'package:eros_n/network/app_dio/dio_user_agent.dart';
import 'package:eros_n/network/app_dio/http_config.dart';
import 'package:eros_n/network/app_dio/proxy.dart';
import 'package:eros_n/network/app_dio/webview_proxy_interceptor.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:system_network_proxy/system_network_proxy.dart';
import 'package:system_proxy/system_proxy.dart';

export 'http_config.dart';

typedef AppHttpAdapter = HttpProxyAdapter;

class AppDio with DioMixin implements Dio {
  AppDio({BaseOptions? options, this.dioConfig}) {
    options ??= BaseOptions(
      baseUrl: dioConfig?.baseUrl ?? '',
      contentType: dioConfig?.contentType ?? Headers.formUrlEncodedContentType,
      connectTimeout: dioConfig?.connectTimeout != null
          ? Duration(milliseconds: dioConfig!.connectTimeout)
          : null,
      sendTimeout: dioConfig?.sendTimeout != null
          ? Duration(milliseconds: dioConfig!.sendTimeout)
          : null,
      receiveTimeout: dioConfig?.receiveTimeout != null
          ? Duration(milliseconds: dioConfig!.receiveTimeout)
          : null,
      // headers: <String, String>{
      //   if (Global.userAgent != null) 'User-Agent': Global.userAgent!,
      //   // 'Accept': NHConst.accept,
      //   // 'Accept-Language': NHConst.acceptLanguage,
      // },
    );
    this.options = options;

    logger.t('dioConfig ${dioConfig?.toString()}');

    if (dioConfig?.userAgent?.isNotEmpty ?? false) {
      logger.t('set userAgent from dioConfig');
      this.options.headers['User-Agent'] = dioConfig?.userAgent;
    }

    // DioCacheManager
    // final cacheOptions = CacheConfig(
    //   databasePath: Global.appSupportPath,
    //   // baseUrl: dioConfig?.baseUrl,
    //   // defaultRequestMethod: 'GET',
    // );
    // interceptors.add(DioCacheManager(cacheOptions).interceptor as Interceptor);

    final cacheOptions = CacheOptions(
      store: BackupCacheStore(
        primary: MemCacheStore(),
        secondary: HiveCacheStore(Global.appSupportPath),
      ),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403, 503],
      maxStale: const Duration(days: 2),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    // interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, handler) async {
    //     final key = cacheOptions.keyBuilder(options);
    //     logger.d('cache key: $key');
    //     final cache = await cacheOptions.store?.get(key);
    //     if (cache != null &&
    //         DateTime.now().difference(cache.responseDate).inMinutes < 5) {
    //       logger.d('cache hit');
    //       // return handler.resolve(cache.toResponse(options, fromNetwork: false));
    //     }
    //
    //     return handler.next(options);
    //   },
    // ));
    interceptors.add(DioUserAgentInterceptor((options) => Global.userAgent));

    interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // Cookie管理
    if (dioConfig?.cookiesPath?.isNotEmpty ?? false) {
      interceptors.add(
        CookieManager(
          PersistCookieJar(storage: FileStorage(dioConfig!.cookiesPath)),
        ),
      );
    } else {
      interceptors.add(CookieManager(Global.cookieJar));
    }

    if (dioConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }

    // Attach `Authorization: User <access_token>` to /api/v2/* requests
    // before they're handed off to the WebView proxy so the header travels
    // along inside the proxied fetch.
    interceptors.add(ApiV2AuthInterceptor());

    // Route Cloudflare-protected origins through the hidden WebView so the
    // request inherits Chromium's TLS/HTTP fingerprints and is not challenged.
    // Image CDNs and stream downloads are excluded by the interceptor itself.
    interceptors.add(WebViewProxyInterceptor());

    httpClientAdapter = AppHttpAdapter(proxy: dioConfig?.proxy ?? '');

    // httpClientAdapter = IOHttpClientAdapter();

    // if (dioConfig?.proxy?.isNotEmpty ?? false) {
    //   setProxy(dioConfig!.proxy!);
    // } else {
    //   getSystemProxy().then(setProxy);
    // }

    // (httpClientAdapter as IOHttpClientAdapter)
    //     .addOnHttpClientCreate((client) {
    //   client
    //     ..maxConnectionsPerHost = dioConfig?.maxConnectionsPerHost
    //     ..idleTimeout = const Duration(seconds: 6);
    // });
  }

  DioHttpConfig? dioConfig;

  // void setProxy(String proxy) {
  //   logger.d('setProxy $proxy');
  //   (httpClientAdapter as IOHttpClientAdapter)
  //       .addOnHttpClientCreate((client) {
  //     // config the http client
  //     client.findProxy = (uri) {
  //       // proxy all request to localhost:8888
  //       return proxy;
  //       // return 'SOCKS5 127.0.0.1:6153';
  //     };
  //     // you can also create a HttpClient to dio
  //     // return HttpClient();
  //   });
  // }

  Future<String> getSystemProxy() async {
    if (Platform.isAndroid || Platform.isIOS) {
      Map<String, String>? systemProxy = await SystemProxy.getProxySettings();
      if (systemProxy != null) {
        return 'PROXY ${systemProxy['host']}:${systemProxy['port']}';
      }
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      SystemNetworkProxy.init();
      final proxyEnable = await SystemNetworkProxy.getProxyEnable();
      final proxyServer = await SystemNetworkProxy.getProxyServer();
      logger.d('proxyEnable: $proxyEnable; proxyServer: $proxyServer');
      if (proxyEnable && proxyServer.isNotEmpty) {
        return 'PROXY $proxyServer';
      }
    } else if (Platform.isWindows) {
      // SystemNetworkProxyWindows
    }
    return 'DIRECT';
  }

  /// DioMixin 没有实现下载
  /// 从 [DioForNative] 复制过来的
  @override
  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    FileAccessMode fileAccessMode = FileAccessMode.write,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    // We set the `responseType` to [ResponseType.STREAM] to retrieve the
    // response stream.
    // ignore: invalid_use_of_internal_member
    options ??= DioMixin.checkOptions('GET', options);

    // Receive data with stream.
    options.responseType = ResponseType.stream;
    Response<ResponseBody> response;
    try {
      response = await request<ResponseBody>(
        urlPath,
        data: data,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken ?? CancelToken(),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        if (e.response!.requestOptions.receiveDataWhenStatusError == true) {
          final res = await transformer.transformResponse(
            e.response!.requestOptions..responseType = ResponseType.json,
            e.response!.data as ResponseBody,
          );
          e.response!.data = res;
        } else {
          e.response!.data = null;
        }
      }
      rethrow;
    }
    final File file;
    if (savePath is FutureOr<String> Function(Headers)) {
      // Add real Uri and redirect information to headers.
      response.headers
        ..add('redirects', response.redirects.length.toString())
        ..add('uri', response.realUri.toString());
      file = File(await savePath(response.headers));
    } else if (savePath is String) {
      file = File(savePath);
    } else {
      throw ArgumentError.value(
        savePath.runtimeType,
        'savePath',
        'The type must be `String` or `FutureOr<String> Function(Headers)`.',
      );
    }

    // If the directory (or file) doesn't exist yet, the entire method fails.
    file.createSync(recursive: true);

    // Shouldn't call file.writeAsBytesSync(list, flush: flush),
    // because it can write all bytes by once. Consider that the file is
    // a very big size (up to 1 Gigabytes), it will be expensive in memory.
    RandomAccessFile raf = file.openSync(mode: FileMode.write);

    // Create a Completer to notify the success/error state.
    final completer = Completer<Response>();
    Future<Response> future = completer.future;
    int received = 0;

    // Stream<Uint8List>
    final stream = response.data!.stream;
    bool compressed = false;
    int total = 0;
    final contentEncoding = response.headers.value(
      Headers.contentEncodingHeader,
    );
    if (contentEncoding != null) {
      compressed = ['gzip', 'deflate', 'compress'].contains(contentEncoding);
    }
    if (lengthHeader == Headers.contentLengthHeader && compressed) {
      total = -1;
    } else {
      total = int.parse(response.headers.value(lengthHeader) ?? '-1');
    }

    Future<void>? asyncWrite;
    bool closed = false;
    Future<void> closeAndDelete() async {
      if (!closed) {
        closed = true;
        await asyncWrite;
        await raf.close();
        if (deleteOnError && file.existsSync()) {
          await file.delete();
        }
      }
    }

    late StreamSubscription subscription;
    subscription = stream.listen(
      (data) {
        subscription.pause();
        // Write file asynchronously
        asyncWrite = raf
            .writeFrom(data)
            .then((result) {
              // Notify progress
              received += data.length;
              onReceiveProgress?.call(received, total);
              raf = result;
              if (cancelToken == null || !cancelToken.isCancelled) {
                subscription.resume();
              }
            })
            .catchError((Object e) async {
              try {
                await subscription.cancel();
              } finally {
                completer.completeError(
                  // ignore: invalid_use_of_internal_member
                  DioMixin.assureDioException(e, response.requestOptions),
                );
              }
            });
      },
      onDone: () async {
        try {
          await asyncWrite;
          closed = true;
          await raf.close();
          completer.complete(response);
        } catch (e) {
          completer.completeError(
            // ignore: invalid_use_of_internal_member
            DioMixin.assureDioException(e, response.requestOptions),
          );
        }
      },
      onError: (e) async {
        try {
          await closeAndDelete();
        } finally {
          completer.completeError(
            // ignore: invalid_use_of_internal_member
            DioMixin.assureDioException(e as Object, response.requestOptions),
          );
        }
      },
      cancelOnError: true,
    );
    cancelToken?.whenCancel.then((_) async {
      await subscription.cancel();
      await closeAndDelete();
    });

    final timeout = response.requestOptions.receiveTimeout;
    if (timeout != null) {
      future = future.timeout(timeout).catchError((
        dynamic e,
        StackTrace s,
      ) async {
        await subscription.cancel();
        await closeAndDelete();
        if (e is TimeoutException) {
          throw DioException.receiveTimeout(
            timeout: timeout,
            requestOptions: response.requestOptions,
            error: e,
          );
        } else {
          throw e as Object;
        }
      });
    }
    // ignore: invalid_use_of_internal_member
    return DioMixin.listenCancelForAsyncTask(cancelToken, future);
  }

  @override
  Future<Response> downloadUri(
    Uri uri,
    savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    FileAccessMode fileAccessMode = FileAccessMode.write,
    lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
  }) {
    return download(
      uri.toString(),
      savePath,
      onReceiveProgress: onReceiveProgress,
      fileAccessMode: fileAccessMode,
      lengthHeader: lengthHeader,
      deleteOnError: deleteOnError,
      cancelToken: cancelToken,
      data: data,
      options: options,
    );
  }
}
