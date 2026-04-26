import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage()
class NhWebViewPage extends StatelessWidget {
  const NhWebViewPage({super.key, required this.initialUrl, this.title});
  final String initialUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? '')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(initialUrl)),
        initialSettings: inAppWebViewSettings,
      ),
    );
  }
}

final InAppWebViewSettings inAppWebViewSettings = InAppWebViewSettings(
  useShouldOverrideUrlLoading: true,
  mediaPlaybackRequiresUserGesture: false,
  useHybridComposition: true,
  allowsInlineMediaPlayback: true,
  userAgent: NHConst.userAgent,
  // Required so the WebView accepts and persists Cloudflare's cookies
  // and we can read them via CookieManager / document.cookie.
  thirdPartyCookiesEnabled: true,
  databaseEnabled: true,
  domStorageEnabled: true,
  javaScriptEnabled: true,
  // Force a real network request so Cloudflare actually issues `cf_clearance`.
  // Without this the SvelteKit Service Worker may render the page from the
  // offline cache, no Set-Cookie ever happens, and we get an empty cookie jar.
  cacheMode: CacheMode.LOAD_NO_CACHE,
);
