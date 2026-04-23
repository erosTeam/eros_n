import 'package:collection/collection.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/network/webview_proxy/hidden_webview_proxy.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    // The Cloudflare-protected login page is no longer reachable directly
    // from the dart-side dio client (TLS fingerprint mismatch) and the new
    // SvelteKit form does not include a csrfmiddlewaretoken hidden field
    // anymore. Push the entire credential exchange into the hidden WebView
    // so it inherits a real browser TLS/cookie context.
    try {
      return await HiddenWebViewProxy.instance.loginNhentai(
        username: username,
        password: password,
      );
    } catch (e, st) {
      logger.e('login via webview failed', error: e, stackTrace: st);
      throw HttpException('login error: $e');
    }
  }

  Future<void> loginGetMore() async {
    logger.d('loginWithCookie');

    // Try Dio's cookie jar first (used by the legacy direct-dio path).
    final jarCookies = await Global.cookieJar.loadForRequest(
      Uri.parse(NHConst.baseUrl),
    );
    var sessionidValue = jarCookies
        .firstWhereOrNull((element) => element.name == 'sessionid')
        ?.value;

    // Then try the WebView's native cookie manager. The sessionid is
    // HttpOnly and lives in the WebView store after a webview-driven
    // login, but is invisible to the dart-side cookie jar.
    if (sessionidValue == null || sessionidValue.isEmpty) {
      try {
        final cm = CookieManager.instance();
        for (final url in [
          '${NHConst.baseUrl}/',
          NHConst.baseUrl,
          'https://nhentai.net/',
        ]) {
          final c = await cm.getCookie(
            url: WebUri(url),
            name: 'sessionid',
          );
          final v = c?.value?.toString();
          if (v != null && v.isNotEmpty) {
            sessionidValue = v;
            break;
          }
        }
      } catch (e) {
        logger.w('failed to read sessionid from CookieManager: $e');
      }
    }

    // As a last resort, mark the user as logged in with a sentinel value
    // so the UI flips to the logged-in state. Real auth still happens via
    // the WebView proxy which has the actual HttpOnly cookie.
    sessionidValue ??= 'webview-managed';
    if (sessionidValue.isEmpty) {
      sessionidValue = 'webview-managed';
    }

    state = state.copyWith(sessionid: sessionidValue);
    hiveHelper.setUser(state);

    late User userFromIndex;
    try {
      userFromIndex = await getInfoFromIndex(refresh: true);
    } on HttpException {
      rethrow;
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
        url: userFromIndex.userUrl ?? '',
        refresh: true,
      );
    } on HttpException {
      rethrow;
    }

    state = state.copyWith(avatarUrl: userFromProfile.avatarUrl);
    hiveHelper.setUser(state);
  }

  void logout() {
    Global.cookieJar.deleteAll();
    CookieManager.instance().deleteAllCookies();
    state = const User();
    hiveHelper.setUser(state);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(hiveHelper.getUser());
});
