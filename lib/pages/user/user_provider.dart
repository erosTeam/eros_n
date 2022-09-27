import 'dart:io';

import 'package:collection/collection.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  Future<void> login({
    required String username,
    required String password,
  }) async {
    late final String csrfToken;

    try {
      csrfToken = await getLoginToken() ?? '';
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return;
        }
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async {
            csrfToken = await getLoginToken() ?? '';
          },
        );
      } else {
        rethrow;
      }
    }

    logger.d('csrfToken $csrfToken');
    await loginNhentai(
        username: username, password: password, csrfToken: csrfToken);
  }

  Future<void> loginWithWeb() async {
    logger.d('loginWithCookie');

    final cookie =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    final sessionid =
        cookie.firstWhereOrNull((element) => element.name == 'sessionid');

    state = state.copyWith(sessionid: sessionid?.value);
    hiveHelper.setUser(state);

    late User userFromIndex;
    try {
      userFromIndex = await getInfoFromIndex(refresh: true);
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');

        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async {
            userFromIndex = await getInfoFromIndex(refresh: true);
          },
        );
      } else {
        rethrow;
      }
    }
    // log userFromIndex
    logger.d('userFromIndex $userFromIndex');

    state = state.copyWith(
      userUrl: userFromIndex.userUrl,
      userName: userFromIndex.userName,
      userId: userFromIndex.userId,
    );
    hiveHelper.setUser(state);

    if (userFromIndex.userUrl == null) {
      return;
    }
    late User userFromProfile;
    try {
      userFromProfile = await getInfoFromUserPage(
          url: userFromIndex.userUrl ?? '', refresh: true);
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');

        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async {
            userFromProfile = await getInfoFromUserPage(
                url: userFromIndex.userUrl ?? '', refresh: true);
          },
        );
      } else {
        rethrow;
      }
    }

    state = state.copyWith(
      avatarUrl: userFromProfile.avatarUrl,
    );
    hiveHelper.setUser(state);
  }

  void logout() {
    Global.cookieJar.deleteAll();
    state = const User();
    hiveHelper.setUser(state);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(hiveHelper.getUser() ?? const User());
});
