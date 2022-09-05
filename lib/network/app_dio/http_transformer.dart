import 'dart:async';

import 'package:dio/dio.dart';

import 'http_response.dart';

typedef HttpTransformerBuilderCallback = FutureOr<DioHttpResponse> Function(
    Response response);

/// Response 解析
abstract class HttpTransformer {
  FutureOr<DioHttpResponse<dynamic>> parse(Response response);
}

class DefaultHttpTransformer extends HttpTransformer {
// 假设接口返回类型
//   {
//     "code": 100,
//     "data": {},
//     "message": "success"
// }
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;

  /// 单例对象
  static final DefaultHttpTransformer _instance =
      DefaultHttpTransformer._internal();

  @override
  FutureOr<DioHttpResponse<dynamic>> parse(Response response) {
    // if (response.data["code"] == 100) {
    //   return HttpResponse.success(response.data["data"]);
    // } else {
    // return HttpResponse.failure(errorMsg:response.data["message"],errorCode: response.data["code"]);
    // }
    // return DioHttpResponse.success(response.data['data']);
    return DioHttpResponse.success(response.data);
  }
}

class HttpTransformerBuilder extends HttpTransformer {
  HttpTransformerBuilder(this.parseCallback);

  final HttpTransformerBuilderCallback parseCallback;

  @override
  FutureOr<DioHttpResponse> parse(Response<dynamic> response) {
    return parseCallback(response);
  }
}
