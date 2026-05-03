import 'package:share_plus/share_plus.dart';

export 'package:share_plus/share_plus.dart' show XFile;

class ShareUtil {
  ShareUtil._();

  static Future<void> shareText(String text) {
    return SharePlus.instance.share(ShareParams(text: text));
  }

  static Future<void> shareFiles(List<XFile> files) {
    return SharePlus.instance.share(ShareParams(files: files));
  }
}
