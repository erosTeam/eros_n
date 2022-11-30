import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    10
        .milliseconds
        .delay()
        .then((value) => erosRouter.replaceNamed(NHRoutes.home));
  }

  @override
  void dispose() {
    super.dispose();
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
