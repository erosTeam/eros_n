import 'dart:async';
import 'dart:io';

import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  StreamSubscription? _intentDataStreamSubscription;
  late String? sharedText = '';

  @override
  void initState() {
    super.initState();
    if (!Platform.isIOS && !Platform.isAndroid) {
      0
          .milliseconds
          .delay()
          .then((value) => erosRouter.replaceNamed(NHRoutes.home));
    } else {
      // For sharing or opening urls/text coming from outside the app while the app is in the memory
      _intentDataStreamSubscription =
          ReceiveSharingIntent.getTextStream().listen((String value) {
        sharedText = value;
        logger.d('getTextStream Shared: $sharedText');
        _goPage(sharedText ?? '', replace: false);
      }, onError: (err) {
        logger.e('getTextStream error: $err');
      });

      // For sharing or opening urls/text coming from outside the app while the app is closed
      ReceiveSharingIntent.getInitialText().then((String? value) {
        // logger.i('value(closed): $value');
        sharedText = value ?? '';
        logger.v('Shared: $sharedText');
        _goPage(sharedText ?? '');
      });
    }
  }

  Future<void> _goPage(String url, {bool replace = true}) async {
    if (url.isEmpty || !RouteUtil.goGalleryByUrl(ref, url, replace: replace)) {
      0
          .milliseconds
          .delay()
          .then((value) => erosRouter.replaceNamed(NHRoutes.home));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _intentDataStreamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Eros-N',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
