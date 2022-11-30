import 'dart:async';

import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class ReceiveSharingNotifier extends StateNotifier<void> {
  ReceiveSharingNotifier(this.ref) : super(null);

  final Ref ref;

  String? sharedText;

  Future<void> _goPage(
    String url,
    WidgetRef widgetRef, {
    bool replace = true,
  }) async {
    if (url.isEmpty ||
        !(await RouteUtil.goGalleryByUrl(widgetRef, url, replace: replace))) {
      0
          .milliseconds
          .delay()
          .then((value) => erosRouter.replaceNamed(NHRoutes.home));
    }
  }

  void listenReceiveSharing(WidgetRef widgetRef) {
    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    ReceiveSharingIntent.getTextStream().listen((String value) {
      sharedText = value;
      logger.e('getTextStream Shared: $sharedText');
      _goPage(sharedText ?? '', widgetRef, replace: false);
    }, onError: (err) {
      logger.e('getTextStream error: $err');
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((String? value) {
      logger.e('getInitialText Shared: $value');

      if (value == sharedText) {
        return;
      }

      sharedText = value ?? '';
      logger.v('Shared: $sharedText');
      _goPage(sharedText ?? '', widgetRef, replace: false);
    });
  }
}

final receiveSharingProvider =
    StateNotifierProvider.autoDispose<ReceiveSharingNotifier, void>((ref) {
  return ReceiveSharingNotifier(ref);
});
