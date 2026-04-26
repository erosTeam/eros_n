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

String? getTagNamespace(String tagType) {
  switch (tagType) {
    case 'Parodies':
    case 'parody':
      return 'parody';
    case 'Characters':
    case 'character':
      return 'character';
    case 'Tags':
    case 'tag':
    case 'male':
    case 'female':
    case 'mixed':
      return null;
    case 'Artists':
    case 'artist':
      return 'artist';
    case 'Groups':
    case 'group':
      return 'group';
    case 'Languages':
    case 'language':
      return 'language';
    case 'Categories':
    case 'category':
      return null;
    default:
      return null;
  }
}

/// Normalize a tag type into the canonical singular lowercase form used
/// by nhentai's search syntax (`tag:`, `parody:`, `artist:` ...) and by
/// nhentai's autocomplete API.
///
/// Accepts any of:
///   - HTML detail page form: `Tags`, `Parodies`, `Characters`, ...
///   - Legacy fetcher form (plural lowercase): `tags`, `parodies`, ...
///   - API form (already singular): `tag`, `parody`, `character`, ...
String singularizeTagType(String tagType) {
  switch (tagType.toLowerCase()) {
    case 'tag':
    case 'tags':
    // EhTagTranslation buckets attribute tags (male/female/mixed/other)
    // under finer-grained namespaces; nhentai treats them all as `tag:`
    // in its search syntax.
    case 'female':
    case 'male':
    case 'mixed':
    case 'other':
      return 'tag';
    case 'parody':
    case 'parodies':
      return 'parody';
    case 'character':
    case 'characters':
      return 'character';
    case 'artist':
    case 'artists':
    case 'cosplayer':
      return 'artist';
    case 'group':
    case 'groups':
      return 'group';
    case 'language':
    case 'languages':
      return 'language';
    case 'category':
    case 'categories':
    case 'reclass':
      return 'category';
    default:
      return tagType.toLowerCase();
  }
}
