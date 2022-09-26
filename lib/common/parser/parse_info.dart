import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

User? parseInfo(String html) {
  final Document document = parse(html);

  const usernameSelector = '.username';
  final usernameElm = document.querySelector(usernameSelector);
  final username = usernameElm?.text;

  final hrefElem = usernameElm?.parent;
  logger.d('hrefElem: ${hrefElem?.outerHtml}');
  final href = hrefElem?.attributes['href'];
  final userId = RegExp(r'\d+').firstMatch(href ?? '')?.group(0);

  return User(
    userName: username,
    userId: userId,
    userUrl: href,
  );
}
