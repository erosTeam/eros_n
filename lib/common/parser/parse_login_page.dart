import 'package:eros_n/component/exception/error.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

String? parseLoginPage(String html) {
  final doc = parse(html);

  // final regExpToken = RegExp(r'csrf_token:\s+"(\w+)"');
  // final regExpTokenMatch = regExpToken.firstMatch(html);
  // final token = regExpTokenMatch?.group(1);

  const tokenSelector = '#content > form > input[type=hidden]';
  final tokenElement = doc.querySelector(tokenSelector);
  final tokenValue = tokenElement?.attributes['value'];

  const captchaSelector = '#content > form > div > div.captcha';

  final captchaElement = doc.querySelector(captchaSelector);

  logger.d('captchaElement ${captchaElement?.outerHtml}');

  final error = doc.querySelector('#errors')?.text ?? '';

  if (error.contains('CAPTCHA') || captchaElement != null) {
    logger.e('CAPTCHA');
    throw LoginCaptchaError();
  }

  if (error.contains('Invalid')) {
    logger.e('Invalid');
    throw LoginInvalidError();
  }

  return tokenValue;
}
