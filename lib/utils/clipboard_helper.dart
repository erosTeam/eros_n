import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClipboardHelper {
  Future<String?> getClipboardData() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  void setClipboardData(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  Future<void> chkClipboardLink(BuildContext context, WidgetRef ref) async {
    final clipboardDetection =
        ref.read(settingsProvider.select((s) => s.clipboardDetection));
    if (!clipboardDetection) {
      return;
    }

    final String? text = await getClipboardData();
    if (text != null) {
      _showClipboardLinkToast(text, ref);
    }
  }

  Future<void> _showClipboardLinkToast(String text, WidgetRef ref) async {
    final RegExp regGalleryPageUrl = RegExp(r'https://nhentai.net/g/(\d+)/\d+');
    final RegExp regGalleryUrl = RegExp(r'https?://nhentai.net/g/(\d+)/?');

    final url = regGalleryPageUrl.firstMatch(text)?.group(0) ??
        regGalleryUrl.firstMatch(text)?.group(0) ??
        '';

    if (regGalleryUrl.hasMatch(text) || regGalleryPageUrl.hasMatch(text)) {
      showActionToast(
        url,
        icon: CupertinoIcons.link,
        onPressed: () {
          RouteUtil.goGalleryByUrl(ref, text);
        },
      );
    }
  }
}
