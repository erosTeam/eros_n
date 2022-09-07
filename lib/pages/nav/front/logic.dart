import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'state.dart';

class FrontLogic extends GetxController {
  final FrontState state = FrontState();

  @override
  void onInit() {
    super.onInit();
    getGalleryData();
  }

  Future<void> testWeb() async {
    var headers = {
      'cookie':
          'cf_clearance=6dsrFOlTMeE8iDVcta_FDAUPs466BtRi2VTLoy4Wuz0-1662493545-0-150; csrftoken=tPal8XhvGycU22LwiOhLZ4KRqBndr519zLORNMpOTJpw8pEBbw7TEdkXZipHYDXZ',
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27'
    };
    var request = http.Request('GET', Uri.parse('https://nhentai.net/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      logger.d(await response.stream.bytesToString());
    } else {
      logger.d(response.reasonPhrase);
    }
  }

  Future<void> getGalleryData({
    bool refresh = false,
    bool showWebViewDialogOnFail = true,
  }) async {
    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    try {
      final galleryList = await getGalleryList(refresh: refresh, page: 1);
      if (refresh) {
        state.galleryProviders.assignAll(galleryList);
      } else {
        state.galleryProviders.addAll(galleryList);
      }
    } on HttpException catch (e) {
      if (showWebViewDialogOnFail && (e.code == 403 || e.code == 503)) {
        logger.e('code ${e.code}');
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await getGalleryData(
            refresh: refresh,
            showWebViewDialogOnFail: false,
          ),
        );
      } else {
        rethrow;
      }
    }
  }

  Future<void> reloadData() async {
    await getGalleryData(refresh: true);
  }
}
