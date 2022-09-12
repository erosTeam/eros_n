import 'package:eros_n/routes/routes.dart';
import 'package:get/get.dart';

import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onInit() {
    super.onInit();
    800.milliseconds.delay().then((value) => Get.offNamed(NHRoutes.home));
  }
}
