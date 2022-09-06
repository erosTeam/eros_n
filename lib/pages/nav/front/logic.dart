import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:get/get.dart';

import 'state.dart';

class FrontLogic extends GetxController {
  final FrontState state = FrontState();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getGalleryData() async {
    try {
      final r = await getGalleryList();
    } on BadServiceException catch (e) {
      logger.e('BadServiceException');
    }
  }
}
