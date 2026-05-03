import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/store/db/entity/download_task.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_provider.g.dart';

@Riverpod(keepAlive: true)
class DownloadNotifier extends _$DownloadNotifier {
  final _pendingQueue = <int>[];
  final _activeGids = <int>{};

  @override
  Map<int, DownloadTask> build() {
    // React to gallery concurrency limit changes immediately.
    ref.listen(settingsProvider, (prev, next) {
      final prevMax = prev?.maxConcurrentGalleries;
      final nextMax = next.maxConcurrentGalleries;
      if (prevMax == null || prevMax == nextMax) return;
      if (nextMax > prevMax) {
        _processQueue();
      } else {
        _applyGalleryConcurrencyLimit(nextMax);
      }
    });
    _loadFromDb();
    return {};
  }

  /// Signals excess active galleries to stop and re-queues them at the front
  /// so they resume automatically when a slot opens.
  void _applyGalleryConcurrencyLimit(int maxGalleries) {
    while (_activeGids.length > maxGalleries) {
      final gid = _activeGids.last;
      _activeGids.remove(gid);
      final task = state[gid];
      if (task != null && task.status == DownloadStatus.downloading) {
        state = {...state, gid: task.copyWith(status: DownloadStatus.pending)};
        objectBoxHelper.updateDownloadProgress(
          gid,
          task.downloadedPages,
          DownloadStatus.pending,
        );
        if (!_pendingQueue.contains(gid)) {
          _pendingQueue.insert(0, gid);
        }
      }
    }
  }

  Future<void> _loadFromDb() async {
    final tasks = await objectBoxHelper.getAllDownloadTasks();
    final map = <int, DownloadTask>{};
    for (final t in tasks) {
      // Tasks that were mid-download when app was killed are treated as paused.
      if (t.status == DownloadStatus.downloading) {
        await objectBoxHelper.updateDownloadProgress(
          t.gid,
          t.downloadedPages,
          DownloadStatus.paused,
        );
        map[t.gid] = t.copyWith(status: DownloadStatus.paused);
      } else {
        map[t.gid] = t;
        // Re-queue tasks that were pending before the app was killed.
        if (t.status == DownloadStatus.pending) {
          _pendingQueue.add(t.gid);
        }
      }
    }
    state = map;
    if (_pendingQueue.isNotEmpty) {
      _processQueue();
    }
  }

  Future<void> addDownload(Gallery gallery) async {
    if (state.containsKey(gallery.gid)) return;

    final settings = ref.read(settingsProvider);
    final savedDir = await Global.resolveDownloadsPath(
      settings.customDownloadPath,
    );
    final dir = '$savedDir/${gallery.gid}';

    final pages = gallery.images.pages;
    final pageExts = pages.map((p) {
      return NHConst.extMap[p.type] ?? 'jpg';
    }).toList();

    final task = DownloadTask(
      gid: gallery.gid,
      title:
          gallery.title.prettyTitle ??
          gallery.title.englishTitle ??
          gallery.gid.toString(),
      thumbUrl: gallery.thumbUrl ?? '',
      mediaId: gallery.mediaId ?? '',
      totalPages: pages.isNotEmpty ? pages.length : (gallery.numPages ?? 0),
      savedDir: dir,
    );
    task.pageExts = pageExts;

    await objectBoxHelper.upsertDownloadTask(task);
    state = {...state, task.gid: task};

    _pendingQueue.add(task.gid);
    _processQueue();
  }

  Future<void> pauseDownload(int gid) async {
    final task = state[gid];
    if (task == null) return;
    _pendingQueue.remove(gid);
    _activeGids.remove(gid);
    await objectBoxHelper.updateDownloadProgress(
      gid,
      task.downloadedPages,
      DownloadStatus.paused,
    );
    state = {...state, gid: task.copyWith(status: DownloadStatus.paused)};
  }

  Future<void> resumeDownload(int gid) async {
    final task = state[gid];
    if (task == null) return;
    if (_pendingQueue.contains(gid) || _activeGids.contains(gid)) return;

    await objectBoxHelper.updateDownloadProgress(
      gid,
      task.downloadedPages,
      DownloadStatus.pending,
    );
    state = {...state, gid: task.copyWith(status: DownloadStatus.pending)};

    _pendingQueue.add(gid);
    _processQueue();
  }

  /// Removes all downloaded files and re-queues the gallery for download.
  /// If the task has no page extension data (e.g. was created from partial
  /// gallery info), fetches the full gallery detail first.
  Future<void> redownloadGallery(int gid) async {
    final task = state[gid];
    if (task == null) return;
    _pendingQueue.remove(gid);
    _activeGids.remove(gid);
    try {
      final dir = Directory(task.savedDir);
      if (dir.existsSync()) dir.deleteSync(recursive: true);
    } catch (e) {
      logger.e('redownloadGallery dir error: $e');
    }

    // If page extension list is empty or totalPages is 0, re-fetch page data.
    String resolvedMediaId = task.mediaId;
    int resolvedTotalPages = task.totalPages;
    List<String> resolvedExts = List.from(task.pageExts);

    if (task.pageExts.isEmpty || task.totalPages == 0) {
      try {
        final gallery = await getGalleryDetail(
          url: 'https://nhentai.net/g/$gid/',
        );
        final pages = gallery.images.pages;
        if (pages.isNotEmpty) {
          resolvedExts = pages
              .map((p) => NHConst.extMap[p.type] ?? 'jpg')
              .toList();
          resolvedTotalPages = pages.length;
          resolvedMediaId = gallery.mediaId ?? task.mediaId;
        }
      } catch (e) {
        logger.e('redownloadGallery: failed to fetch detail for $gid: $e');
      }
    }

    final updated = DownloadTask(
      gid: task.gid,
      title: task.title,
      thumbUrl: task.thumbUrl,
      mediaId: resolvedMediaId,
      totalPages: resolvedTotalPages,
      savedDir: task.savedDir,
      downloadedPages: 0,
      status: DownloadStatus.pending,
    );
    updated.pageExts = resolvedExts;

    await objectBoxHelper.upsertDownloadTask(updated);
    await objectBoxHelper.updateDownloadProgress(
      gid,
      0,
      DownloadStatus.pending,
    );
    state = {...state, gid: updated};
    _pendingQueue.add(gid);
    _processQueue();
  }

  Future<void> deleteDownload(int gid) async {
    _pendingQueue.remove(gid);
    _activeGids.remove(gid);
    final task = state[gid];
    if (task != null) {
      try {
        final dir = Directory(task.savedDir);
        if (dir.existsSync()) {
          dir.deleteSync(recursive: true);
        }
      } catch (e) {
        logger.e('deleteDownload dir error: $e');
      }
    }
    await objectBoxHelper.deleteDownloadTask(gid);
    final newState = Map<int, DownloadTask>.from(state)..remove(gid);
    state = newState;
  }

  bool isDownloaded(int gid) => state[gid]?.status == DownloadStatus.completed;

  void _processQueue() {
    final maxGalleries = ref.read(settingsProvider).maxConcurrentGalleries;
    while (_activeGids.length < maxGalleries && _pendingQueue.isNotEmpty) {
      final gid = _pendingQueue.removeAt(0);
      if (state.containsKey(gid) &&
          state[gid]!.status != DownloadStatus.completed) {
        _activeGids.add(gid);
        _downloadGallery(gid);
      }
    }
  }

  Future<void> _downloadGallery(int gid) async {
    final task = state[gid];
    if (task == null) {
      _activeGids.remove(gid);
      _processQueue();
      return;
    }

    task.status = DownloadStatus.downloading;
    await objectBoxHelper.updateDownloadProgress(
      gid,
      task.downloadedPages,
      DownloadStatus.downloading,
    );
    state = {...state, gid: task.copyWith(status: DownloadStatus.downloading)};

    try {
      await Directory(task.savedDir).create(recursive: true);

      final total = task.totalPages;

      // Build list of pages that still need downloading (resume support).
      final pending = <int>[];
      for (var i = 0; i < total; i++) {
        if (task.pageExts.isEmpty || i >= task.pageExts.length) continue;
        final localPath = '${task.savedDir}/${i + 1}.${task.pageExts[i]}';
        if (!File(localPath).existsSync()) {
          pending.add(i);
        }
      }

      // Sync the real already-downloaded count to state so the progress bar
      // starts at the correct position (important on resume after restart).
      final alreadyDone = total - pending.length;
      if (alreadyDone != task.downloadedPages) {
        await objectBoxHelper.updateDownloadProgress(
          gid,
          alreadyDone,
          DownloadStatus.downloading,
        );
        state = {
          ...state,
          gid: (state[gid] ?? task).copyWith(downloadedPages: alreadyDone),
        };
      }

      // Sliding-window pool: keeps maxConcurrentPages slots filled at all times.
      await _runPagePool(gid, pending);

      // If task was paused/cancelled mid-pool, exit without marking failed.
      final taskAfterPool = state[gid];
      if (taskAfterPool == null ||
          taskAfterPool.status != DownloadStatus.downloading) {
        _activeGids.remove(gid);
        return;
      }

      // Final check: count actual files.
      final taskDone = state[gid];
      if (taskDone == null) {
        _activeGids.remove(gid);
        _processQueue();
        return;
      }
      final downloaded = _countDownloaded(taskDone);
      final newStatus = downloaded >= total
          ? DownloadStatus.completed
          : DownloadStatus.failed;

      await objectBoxHelper.updateDownloadProgress(gid, downloaded, newStatus);
      state = {
        ...state,
        gid: taskDone.copyWith(downloadedPages: downloaded, status: newStatus),
      };
    } catch (e) {
      logger.e('_downloadGallery $gid error: $e');
      final taskErr = state[gid];
      if (taskErr != null) {
        await objectBoxHelper.updateDownloadProgress(
          gid,
          taskErr.downloadedPages,
          DownloadStatus.failed,
        );
        state = {
          ...state,
          gid: taskErr.copyWith(status: DownloadStatus.failed),
        };
      }
    } finally {
      _activeGids.remove(gid);
      _processQueue();
    }
  }

  /// Sliding-window concurrent page download pool.
  /// Keeps up to [maxConcurrentPages] slots busy at all times.
  /// Re-reads the setting on every slot refill so limit changes take effect
  /// without restarting the gallery.
  Future<void> _runPagePool(int gid, List<int> pending) {
    if (pending.isEmpty) return Future.value();

    final completer = Completer<void>();
    var active = 0;
    var queueIdx = 0;

    void fill() {
      final cur = state[gid];
      if (cur == null || cur.status != DownloadStatus.downloading) {
        if (active == 0 && !completer.isCompleted) completer.complete();
        return;
      }

      final maxSlots = ref.read(settingsProvider).maxConcurrentPages;
      while (active < maxSlots && queueIdx < pending.length) {
        final idx = pending[queueIdx++];
        active++;
        _downloadPage(gid, idx).then((ok) {
          active--;
          if (ok) _incrementProgress(gid);
          fill();
        });
      }

      if (queueIdx >= pending.length && active == 0 && !completer.isCompleted) {
        completer.complete();
      }
    }

    fill();
    return completer.future;
  }

  /// Increments the downloaded page counter by 1 and notifies UI.
  /// O(1) — avoids scanning the filesystem on every page completion.
  void _incrementProgress(int gid) {
    final task = state[gid];
    if (task == null) return;
    final newCount = task.downloadedPages + 1;
    objectBoxHelper.updateDownloadProgress(
      gid,
      newCount,
      DownloadStatus.downloading,
    );
    state = {...state, gid: task.copyWith(downloadedPages: newCount)};
  }

  int _countDownloaded(DownloadTask task) {
    var count = 0;
    for (var i = 0; i < task.totalPages; i++) {
      if (i < task.pageExts.length) {
        final path = '${task.savedDir}/${i + 1}.${task.pageExts[i]}';
        if (File(path).existsSync()) count++;
      }
    }
    return count;
  }

  /// Downloads a single page with exponential-backoff retry.
  /// Returns true on success, false if all retries are exhausted.
  /// Never throws — all errors are caught internally.
  Future<bool> _downloadPage(int gid, int index) async {
    final task = state[gid];
    if (task == null || index >= task.pageExts.length) return false;

    final ext = task.pageExts[index];
    final localPath = '${task.savedDir}/${index + 1}.$ext';
    if (File(localPath).existsSync()) return true;

    final url = getGalleryImageUrl(task.mediaId, index, ext);

    const maxRetries = 2;
    for (var attempt = 0; attempt <= maxRetries; attempt++) {
      // Abort if task was paused or deleted.
      final cur = state[gid];
      if (cur == null || cur.status != DownloadStatus.downloading) return false;

      try {
        await nhDownload(url: url, savePath: localPath);
        return true;
      } catch (e) {
        if (attempt == maxRetries) {
          logger.e(
            '_downloadPage gid=$gid idx=$index failed after $maxRetries retries: $e',
          );
          return false;
        }
        // 429 via HTTP response header.
        final is429 = e is DioException && e.response?.statusCode == 429;
        // CDN bans often manifest as connection drops (unknown/null response)
        // or timeouts rather than a proper 429 reply — treat them the same.
        final isConnectionDrop =
            e is DioException &&
            (e.type == DioExceptionType.unknown ||
                e.type == DioExceptionType.connectionTimeout ||
                e.type == DioExceptionType.receiveTimeout);
        final isRateLimited = is429 || isConnectionDrop;
        // Rate-limited / connection drop: 10 s → 30 s.  Other errors: 3 s → 9 s.
        final delay = isRateLimited
            ? Duration(seconds: 10 * (1 << attempt))
            : Duration(seconds: 3 * (1 << attempt));
        logger.w(
          '_downloadPage gid=$gid idx=$index attempt=$attempt '
          '${is429
              ? "[429]"
              : isConnectionDrop
              ? "[cdn-drop]"
              : "[error]"} '
          'retrying in ${delay.inSeconds}s: ${e.runtimeType}',
        );
        await Future.delayed(delay);
      }
    }
    return false;
  }
}
