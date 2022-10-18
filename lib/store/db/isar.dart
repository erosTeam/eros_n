import 'package:eros_n/common/global.dart';
import 'package:isar/isar.dart';

import 'entity/gallery_history.dart';
import 'entity/nh_tag.dart';
import 'entity/tag_translate.dart';

Future<Isar> openIsar({String? path}) async {
  final dirPath = path ?? Global.appSupportPath;

  final isar = await Isar.open(
    [
      GalleryHistorySchema,
      TagTranslateSchema,
      NhTagSchema,
    ],
    directory: dirPath,
    name: 'eros_n',
  );

  return isar;
}
