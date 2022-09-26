import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

User? parseUserPage(String html) {
  final Document document = parse(html);

  const avatarSelector = '.bigavatar > img';
  final avatarElm = document.querySelector(avatarSelector);
  final avatarUrl = avatarElm?.attributes['src'];
  return User(
    avatarUrl: avatarUrl,
  );
}
