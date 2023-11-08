import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter_socks_proxy/socks_proxy.dart';

class HttpProxyAdapter extends IOHttpClientAdapter {
  HttpProxyAdapter({required this.proxy, bool? skipCertificate}) {
    createHttpClient = () {
      final _client = createProxyHttpClient();
      if (proxy.isNotEmpty) {
        // logger.d('set proxy $proxy');
        _client.findProxy = (url) => proxy;
      }
      if (proxy != 'DIRECT' || (skipCertificate ?? false)) {
        _client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      }
      return _client;
    };
  }

  final String proxy;
}
