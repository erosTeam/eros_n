import 'package:eros_n/common/global.dart';
import 'package:eros_n/objectbox.g.dart';

export '../../objectbox.g.dart' show Store;

Future<Store> openObjectBox({String? path}) async {
  final dirPath = path ?? Global.appSupportPath;
  return openStore(directory: dirPath);
}
