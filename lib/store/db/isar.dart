import 'package:eros_n/common/global.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:isar/isar.dart';

Future<Isar> openIsar() async {
  final dirPath = Global.appSupportPath;

  final isar = await Isar.open(
    [
      GalleryHistorySchema,
    ],
    directory: dirPath,
    name: 'eros_n',
  );

  return isar;
}
