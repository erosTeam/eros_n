import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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

  @override
  void initState() {
    super.initState();
    0
        .milliseconds
        .delay()
        .then((value) => erosRouter.replaceNamed(NHRoutes.home));
  }
}
