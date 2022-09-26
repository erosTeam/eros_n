enum NhErrorType {
  def,

  loginCaptcha,

  loginInvalid,
}

class NhError implements Exception {
  NhError({
    this.type = NhErrorType.def,
    this.error,
  });

  NhErrorType type;

  dynamic error;

  String get message => error?.toString() ?? '';

  @override
  String toString() {
    var msg = 'EhError [$type]: $message';
    if (error is Error) {
      msg += '\n${error.stackTrace}';
    }
    return msg;
  }
}

class LoginCaptchaError extends NhError {
  LoginCaptchaError() : super(type: NhErrorType.loginCaptcha);
}

class LoginInvalidError extends NhError {
  LoginInvalidError() : super(type: NhErrorType.loginInvalid);
}
