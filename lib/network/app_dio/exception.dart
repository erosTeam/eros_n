class HttpException implements Exception {
  HttpException([this._message, this._code, this._data]);

  final String? _message;

  String get message => _message ?? runtimeType.toString();

  final int? _code;

  int get code => _code ?? -1;

  final dynamic _data;
  dynamic get data => _data;

  @override
  String toString() {
    return 'HttpException{_message: $_message, _code: $_code, _data: $_data}';
  }
}

/// 客户端请求错误
class BadRequestException extends HttpException {
  BadRequestException({String? message, int? code, dynamic data})
      : super(message, code, data);
}

/// 服务端响应错误
class BadServiceException extends HttpException {
  BadServiceException({String? message, int? code}) : super(message, code);
}

class UnknownException extends HttpException {
  UnknownException([String? message]) : super(message);
}

class CancelException extends HttpException {
  CancelException([String? message]) : super(message);
}

class Image509Exception extends HttpException {
  Image509Exception([String? message]) : super(message);
}

class NetworkException extends HttpException {
  NetworkException({String? message, int? code}) : super(message, code);
}

/// 401
class UnauthorisedException extends HttpException {
  UnauthorisedException({String? message, int? code = 401})
      : super(message, code);
}

class BadResponseException extends HttpException {
  BadResponseException([this.data]) : super();

  dynamic data;
}

/// 列表样式
class ListDisplayModeException extends HttpException {
  ListDisplayModeException({String? message, int? code, this.params})
      : super(message, code);
  Map<String, dynamic>? params;
}

class FavOrderException extends HttpException {
  FavOrderException({String? message, int? code, this.order})
      : super(message, code);
  String? order;
}
