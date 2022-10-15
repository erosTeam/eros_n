import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NhWebViewPage extends StatelessWidget {
  const NhWebViewPage({Key? key, required this.initialUrl, this.title})
      : super(key: key);
  final String initialUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(initialUrl),
        ),
        initialOptions: inAppWebViewOptions,
      ),
    );
  }
}

final InAppWebViewGroupOptions inAppWebViewOptions = InAppWebViewGroupOptions(
  crossPlatform: InAppWebViewOptions(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    // clearCache: true,
    // userAgent: NHConst.userAgent,
  ),
  android: AndroidInAppWebViewOptions(
    useHybridComposition: true,
  ),
  ios: IOSInAppWebViewOptions(
    allowsInlineMediaPlayback: true,
  ),
);
