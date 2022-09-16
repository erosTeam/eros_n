import 'dart:math';

import 'package:eros_n/common/const/const.dart';

T radomList<T>(Iterable<T> srcList) {
  final index = Random().nextInt(srcList.length);
  return srcList.toList()[index];
}

String buildImageCacheKey(String url) {
  final uri = Uri.parse(url);
  final host = uri.host;
  if (host.endsWith(NHConst.baseHost)) {
    return uri.path;
  }
  return url;
}
