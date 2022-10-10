import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:eros_n/common/global.dart';

import 'package:eros_n/utils/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_network_proxy/system_network_proxy.dart';
import 'package:system_proxy/system_proxy.dart';

import 'dio_user_agent.dart';
import 'http_config.dart';

export 'http_config.dart';

class AppDio with DioMixin implements Dio {
  AppDio({BaseOptions? options, this.dioConfig}) {
    options ??= BaseOptions(
      baseUrl: dioConfig?.baseUrl ?? '',
      contentType: dioConfig?.contentType ?? Headers.formUrlEncodedContentType,
      connectTimeout: dioConfig?.connectTimeout,
      sendTimeout: dioConfig?.sendTimeout,
      receiveTimeout: dioConfig?.receiveTimeout,
      // headers: <String, String>{
      //   if (Global.userAgent != null) 'User-Agent': Global.userAgent!,
      //   // 'Accept': NHConst.accept,
      //   // 'Accept-Language': NHConst.acceptLanguage,
      // },
    );
    this.options = options;

    logger.v('dioConfig ${dioConfig?.toString()}');

    if (dioConfig?.userAgent?.isNotEmpty ?? false) {
      logger.v('set userAgent from dioConfig');
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
      // hitCacheOnErrorExcept: [401, 403],
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
      interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(dioConfig!.cookiesPath))));
    } else {
      interceptors.add(CookieManager(Global.cookieJar));
    }

    // interceptors.add(PrettyDioLogger(
    //   request: false,
    //   requestHeader: false,
    //   requestBody: false,
    //   responseHeader: false,
    //   responseBody: false,
    //   error: true,
    //   maxWidth: 120,
    //   // logPrint: (_) {},
    //   // logPrint: kDebugMode ? loggerSimple.d : loggerSimpleOnlyFile.d,
    //   logPrint: loggerSimpleOnlyFile.d,
    // ));

    if (dioConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }
    httpClientAdapter = DefaultHttpClientAdapter();
    if (dioConfig?.proxy?.isNotEmpty ?? false) {
      setProxy(dioConfig!.proxy!);
    } else {
      getSystemProxy().then(setProxy);
    }

    (httpClientAdapter as DefaultHttpClientAdapter)
        .addOnHttpClientCreate((client) {
      client
        ..maxConnectionsPerHost = dioConfig?.maxConnectionsPerHost
        ..idleTimeout = const Duration(seconds: 6);
    });
  }

  DioHttpConfig? dioConfig;

  void setProxy(String proxy) {
    logger.d('setProxy $proxy');
    (httpClientAdapter as DefaultHttpClientAdapter)
        .addOnHttpClientCreate((client) {
      // config the http client
      client.findProxy = (uri) {
        // proxy all request to localhost:8888
        return proxy;
        // return 'SOCKS5 127.0.0.1:6153';
      };
      // you can also create a HttpClient to dio
      // return HttpClient();
    });
  }

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
      print("proxyEnable: $proxyEnable; proxyServer: $proxyServer");
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
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
  }) async {
    // We set the `responseType` to [ResponseType.STREAM] to retrieve the
    // response stream.
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
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        if (e.response!.requestOptions.receiveDataWhenStatusError == true) {
          var res = await transformer.transformResponse(
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

    response.headers = Headers.fromMap(response.data!.headers);

    File file;
    if (savePath is Function) {
      assert(savePath is String Function(Headers),
          'savePath callback type must be `String Function(HttpHeaders)`');

      // Add real uri and redirect information to headers
      response.headers
        ..add('redirects', response.redirects.length.toString())
        ..add('uri', response.realUri.toString());

      file = File(savePath(response.headers) as String);
    } else {
      file = File(savePath.toString());
    }

    //If directory (or file) doesn't exist yet, the entire method fails
    file.createSync(recursive: true);

    // Shouldn't call file.writeAsBytesSync(list, flush: flush),
    // because it can write all bytes by once. Consider that the
    // file with a very big size(up 1G), it will be expensive in memory.
    var raf = file.openSync(mode: FileMode.write);

    //Create a Completer to notify the success/error state.
    var completer = Completer<Response>();
    var future = completer.future;
    var received = 0;

    // Stream<Uint8List>
    var stream = response.data!.stream;
    var compressed = false;
    var total = 0;
    var contentEncoding = response.headers.value(Headers.contentEncodingHeader);
    if (contentEncoding != null) {
      compressed = ['gzip', 'deflate', 'compress'].contains(contentEncoding);
    }
    if (lengthHeader == Headers.contentLengthHeader && compressed) {
      total = -1;
    } else {
      total = int.parse(response.headers.value(lengthHeader) ?? '-1');
    }

    late StreamSubscription subscription;
    Future? asyncWrite;
    var closed = false;
    Future _closeAndDelete() async {
      if (!closed) {
        closed = true;
        await asyncWrite;
        await raf.close();
        if (deleteOnError) await file.delete();
      }
    }

    subscription = stream.listen(
      (data) {
        subscription.pause();
        // Write file asynchronously
        asyncWrite = raf.writeFrom(data).then((_raf) {
          // Notify progress
          received += data.length;

          onReceiveProgress?.call(received, total);

          raf = _raf;
          if (cancelToken == null || !cancelToken.isCancelled) {
            subscription.resume();
          }
        }).catchError((err, StackTrace stackTrace) async {
          try {
            await subscription.cancel();
          } finally {
            completer.completeError(DioMixin.assureDioError(
              err,
              response.requestOptions,
            ));
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
          completer.completeError(DioMixin.assureDioError(
            e,
            response.requestOptions,
          ));
        }
      },
      onError: (e) async {
        try {
          await _closeAndDelete();
        } finally {
          completer.completeError(DioMixin.assureDioError(
            e,
            response.requestOptions,
          ));
        }
      },
      cancelOnError: true,
    );
    // ignore: unawaited_futures
    cancelToken?.whenCancel.then((_) async {
      await subscription.cancel();
      await _closeAndDelete();
    });

    if (response.requestOptions.receiveTimeout > 0) {
      future = future
          .timeout(Duration(
        milliseconds: response.requestOptions.receiveTimeout,
      ))
          .catchError((Object err) async {
        await subscription.cancel();
        await _closeAndDelete();
        if (err is TimeoutException) {
          throw DioError(
            requestOptions: response.requestOptions,
            error:
                'Receiving data timeout[${response.requestOptions.receiveTimeout}ms]',
            type: DioErrorType.receiveTimeout,
          );
        } else {
          throw err;
        }
      });
    }
    return DioMixin.listenCancelForAsyncTask(cancelToken, future);
  }

  @override
  Future<Response> downloadUri(
    Uri uri,
    savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
  }) {
    return download(
      uri.toString(),
      savePath,
      onReceiveProgress: onReceiveProgress,
      lengthHeader: lengthHeader,
      deleteOnError: deleteOnError,
      cancelToken: cancelToken,
      data: data,
      options: options,
    );
  }
}

extension DefaultHttpClientAdapterExt on DefaultHttpClientAdapter {
  void addOnHttpClientCreate(void Function(HttpClient client) onCreate) {
    final old = onHttpClientCreate;
    onHttpClientCreate = (client) {
      old?.call(client);
      onCreate(client);
    };
  }
}
