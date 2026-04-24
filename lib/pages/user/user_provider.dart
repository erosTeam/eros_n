import 'dart:io' as io;

import 'package:collection/collection.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/network/webview_proxy/hidden_webview_proxy.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

/// Cookie names that mark a logged-in nhentai session, in priority order.
/// `access_token` / `refresh_token` are the new JWT-style cookies issued by
/// `/auth/login`; `sessionid` is the legacy Django cookie still emitted on
/// some flows. Any one of them being present is enough to consider the user
/// authenticated.
const _authCookieNames = ['access_token', 'refresh_token', 'sessionid'];

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  User build() => hiveHelper.getUser();

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

    final tokenValue = await _syncAuthCookies();

    state = state.copyWith(sessionid: tokenValue ?? 'webview-managed');
    hiveHelper.setUser(state);

    late User userFromIndex;
    try {
      userFromIndex = await getInfoFromIndex(refresh: true);
    } on HttpException {
      rethrow;
    }
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

  /// Look for any auth cookie (access_token / refresh_token / sessionid)
  /// across both Dio's cookie jar and the WebView's native CookieManager,
  /// mirror visible ones into the Dio jar so direct API calls also carry
  /// them, and return the first non-empty value found (or null).
  Future<String?> _syncAuthCookies() async {
    final jarCookies = await Global.cookieJar.loadForRequest(
      Uri.parse(NHConst.baseUrl),
    );
    String? firstFound;
    for (final name in _authCookieNames) {
      final v = jarCookies.firstWhereOrNull((c) => c.name == name)?.value;
      if (v != null && v.isNotEmpty) {
        firstFound = v;
        break;
      }
    }

    final fromWebView = <io.Cookie>[];
    try {
      final cm = CookieManager.instance();
      for (final url in [
        '${NHConst.baseUrl}/',
        NHConst.baseUrl,
        'https://nhentai.net/',
      ]) {
        for (final name in _authCookieNames) {
          try {
            final c = await cm.getCookie(url: WebUri(url), name: name);
            final v = c?.value?.toString();
            if (v == null || v.isEmpty) {
              continue;
            }
            if (fromWebView.any((x) => x.name == name)) {
              continue;
            }
            fromWebView.add(io.Cookie(name, v));
          } catch (_) {}
        }
      }
    } catch (e) {
      logger.w('failed to read auth cookies from CookieManager: $e');
    }

    if (fromWebView.isNotEmpty) {
      try {
        await Global.setCookies(NHConst.baseUrl, fromWebView);
      } catch (e) {
        logger.w('failed to mirror auth cookies into cookieJar: $e');
      }
      firstFound ??= fromWebView.first.value;
    }

    return firstFound;
  }
}
