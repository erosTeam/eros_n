import 'dart:convert';
import 'dart:io' show File;

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/store/db/entity/tag_translate.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_translate_provider.g.dart';

const String kReleaseUrl =
    'https://api.github.com/repos/EhTagTranslation/Database/releases/latest';

/// CDN-hosted copy of the latest tag database, served from the default
/// branch of `EhTagTranslation/DatabaseReleases` via jsDelivr. The
/// upstream repo doesn't tag its releases, so we always pull from
/// master and use the response ETag as a synthetic version string.
const String kJsdelivrAssetUrl =
    'https://fastly.jsdelivr.net/gh/EhTagTranslation/DatabaseReleases/db.raw.json.gz';

@Riverpod(keepAlive: true)
class TagTranslateNotifier extends _$TagTranslateNotifier {
  @override
  TagTranslateInfo build() => hiveHelper.getTagTranslateInfo();

  /// Probe the upstream registry for a newer database version.
  Future<void> getUpdateInfo({bool force = false}) async {
    String? remoteVer;
    String? lastReleaseUrl;

    try {
      final releaseInfoMap = await getGithubApi(kReleaseUrl);

      remoteVer = (releaseInfoMap['published_at'] as String?)?.trim();

      final assList = releaseInfoMap['assets'] as List<dynamic>?;
      if (assList != null) {
        for (final dynamic assets in assList) {
          final name = assets['name'] as String? ?? '';
          if (name == 'db.raw.json.gz') {
            lastReleaseUrl = assets['browser_download_url'] as String?;
            break;
          }
        }
      }
    } catch (e) {
      logger.w('GitHub release lookup failed, falling back to jsDelivr: $e');
    }

    // Fallback: pull the database directly from jsDelivr's CDN (which
    // mirrors the default branch of `DatabaseReleases`). The upstream
    // repo doesn't tag its commits, so we use the CDN-supplied ETag as
    // a synthetic version identifier. This avoids GitHub's anonymous
    // rate limit and works in regions where api.github.com is blocked.
    if (remoteVer == null || lastReleaseUrl == null || lastReleaseUrl.isEmpty) {
      try {
        final etag = await _headEtag(kJsdelivrAssetUrl);
        // Even if HEAD fails or returns no ETag we can still download
        // from the CDN; just use today's date so the user can re-trigger
        // the update later without `force`.
        remoteVer = etag ?? 'cdn-${DateTime.now().toIso8601String()}';
        lastReleaseUrl = kJsdelivrAssetUrl;
        logger.d('jsDelivr fallback: version=$remoteVer url=$lastReleaseUrl');
      } catch (e) {
        logger.e('jsDelivr fallback also failed: $e');
      }
    }

    if (remoteVer == null || lastReleaseUrl == null || lastReleaseUrl.isEmpty) {
      logger.w('getUpdateInfo: no usable release URL found');
      return;
    }

    if (remoteVer == state.version && force == false) {
      return;
    }

    state = state.copyWith(
      remoteVersion: remoteVer,
      lastReleaseUrl: lastReleaseUrl,
    );
    hiveHelper.setTagTranslateInfo(state);
  }

  /// Issue a HEAD request to retrieve the response ETag without
  /// downloading the body. Used as a cheap version probe for the
  /// jsDelivr CDN fallback. Returns null if the request fails or no
  /// ETag is present.
  Future<String?> _headEtag(String url) async {
    try {
      final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 8)));
      final resp = await dio.head<dynamic>(
        url,
        options: Options(
          followRedirects: true,
          validateStatus: (s) => s != null && s < 500,
        ),
      );
      final etag = resp.headers.value('etag');
      logger.d('HEAD $url -> ${resp.statusCode} etag=$etag');
      return etag;
    } catch (e) {
      logger.w('HEAD $url failed: $e');
      return null;
    }
  }

  Future<void> updateDb({bool check = true, bool force = false}) async {
    state = state.copyWith(isUpdating: true);
    try {
      if (check) {
        await getUpdateInfo(force: force);
      }

      logger.d('state $state');

      final parsed = await _fetchAndDecodeLastVersion(force: force);
      if (parsed == null) {
        return;
      }

      if (parsed.prettyVersion != null) {
        state = state.copyWith(remoteVersion: parsed.prettyVersion);
      }

      final tagTranslates = parsed.translates;
      logger.d('tagTranslates len: ${tagTranslates.length}');

      await objectBoxHelper.putAllTagTranslate(tagTranslates);

      state = state.copyWith(version: state.remoteVersion);
      hiveHelper.setTagTranslateInfo(state);
    } catch (e, st) {
      logger.e('updateDb failed: $e\n$st');
      rethrow;
    } finally {
      state = state.copyWith(isUpdating: false);
    }
  }

  Future<_ParsedTagDb?> _fetchAndDecodeLastVersion({bool force = false}) async {
    logger.t('_fetchData start');
    if (state.remoteVersion == null ||
        (!force && state.remoteVersion == state.version) ||
        state.lastReleaseUrl == null) {
      return null;
    }

    final gzFilePath = path.join(Global.appDocPath, 'db.raw.json.gz');
    await nhDownload(url: state.lastReleaseUrl!, savePath: gzFilePath);

    // The expensive part: ~5 MB gzip → ~25 MB JSON → ~40k TagTranslate
    // rows. Doing this on the platform isolate stalled the UI for several
    // seconds on mid-range Android. Hand it off to a worker isolate via
    // `compute`; only the path crosses the boundary, the worker reads the
    // file itself so we don't have to ship the bytes through the channel.
    return compute(_decodeTagDbInIsolate, gzFilePath);
  }
}

/// Worker-isolate entry point. Reads the gzipped JSON dump from disk,
/// inflates it, parses it, and walks the namespace map to produce the
/// concrete `TagTranslate` rows. All of this is CPU-bound, so keeping it
/// off the platform isolate is what fixes the ANR.
_ParsedTagDb _decodeTagDbInIsolate(String gzFilePath) {
  final bytes = File(gzFilePath).readAsBytesSync();
  final data = const GZipDecoder().decodeBytes(bytes);
  final dbJson = utf8.decode(data);
  final dataMap = jsonDecode(dbJson) as Map<String, dynamic>;

  String? prettyVersion;
  // The downloaded payload carries upstream commit info, which is far more
  // readable than GitHub `published_at` or a jsDelivr ETag. Promote it to
  // the canonical version string so the settings page shows e.g.
  // `2026-04-23 (a1b2c3d)` instead of `W/"19cf8e-..."`.
  final head = dataMap['head'];
  if (head is Map) {
    final shaFull = head['sha'] as String?;
    final sha = (shaFull != null && shaFull.length >= 7)
        ? shaFull.substring(0, 7)
        : null;
    final dateStr =
        (head['committer']?['when'] as String?) ??
        (head['author']?['when'] as String?) ??
        (head['date'] as String?);
    String? prettyDate;
    if (dateStr != null && dateStr.isNotEmpty) {
      prettyDate = dateStr.split('T').first;
    }
    final pretty = [
      ?prettyDate,
      if (sha != null) '($sha)',
    ].join(' ');
    if (pretty.isNotEmpty) {
      prettyVersion = pretty;
    }
  }

  final dataList = dataMap['data'] as List;
  final translates = <TagTranslate>[];
  for (final item in dataList) {
    final namespace = item['namespace'] as String;
    final inner = item['data'] as Map;
    inner.forEach((name, value) {
      translates.add(
        TagTranslate(
          namespace: namespace,
          name: name as String,
          translateName: (value['name'] ?? '') as String,
          intro: (value['intro'] ?? '') as String,
          links: (value['links'] ?? '') as String,
        ),
      );
    });
  }

  return _ParsedTagDb(translates: translates, prettyVersion: prettyVersion);
}

/// Result bundle returned from the worker isolate.
class _ParsedTagDb {
  const _ParsedTagDb({required this.translates, this.prettyVersion});
  final List<TagTranslate> translates;
  final String? prettyVersion;
}

@riverpod
Future<List<NhTag>> allNhTag(Ref ref) async {
  await Future<void>.delayed(const Duration(milliseconds: 500));
  return objectBoxHelper.getAllNhTag();
}
