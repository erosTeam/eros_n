import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/download_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/store/db/entity/download_task.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';

// ---------------------------------------------------------------------------
// Sort mode
// ---------------------------------------------------------------------------

enum _SortMode { dateNewest, dateOldest, titleAz, titleZa }

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------

@RoutePage()
class DownloadsPage extends HookConsumerWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    final tasks = ref.watch(downloadProvider);
    final l = L10n.of(context);

    final searchActive = useState(false);
    final searchQuery = useState('');
    final searchController = useTextEditingController();
    final sortMode = useState(_SortMode.dateNewest);

    bool matchesQuery(DownloadTask t) {
      final q = searchQuery.value.toLowerCase();
      if (q.isEmpty) return true;
      if (t.title.toLowerCase().contains(q)) return true;
      if (t.gid.toString().contains(q)) return true;
      return false;
    }

    List<DownloadTask> sorted(Iterable<DownloadTask> src) {
      final list = src.toList();
      switch (sortMode.value) {
        case _SortMode.dateNewest:
          list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        case _SortMode.dateOldest:
          list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        case _SortMode.titleAz:
          list.sort((a, b) => a.title.compareTo(b.title));
        case _SortMode.titleZa:
          list.sort((a, b) => b.title.compareTo(a.title));
      }
      // Within the active section, put actually-downloading tasks before pending.
      list.sort((a, b) {
        final aScore = a.status == DownloadStatus.downloading ? 0 : 1;
        final bScore = b.status == DownloadStatus.downloading ? 0 : 1;
        return aScore.compareTo(bScore);
      });
      return list;
    }

    final downloading = sorted(tasks.values.where((t) =>
        (t.status == DownloadStatus.downloading ||
            t.status == DownloadStatus.pending) &&
        matchesQuery(t)));
    final paused = sorted(tasks.values
        .where((t) => t.status == DownloadStatus.paused && matchesQuery(t)));
    final completed = sorted(tasks.values
        .where((t) => t.status == DownloadStatus.completed && matchesQuery(t)));
    final failed = sorted(tasks.values
        .where((t) => t.status == DownloadStatus.failed && matchesQuery(t)));

    final hasResults = downloading.isNotEmpty ||
        paused.isNotEmpty ||
        completed.isNotEmpty ||
        failed.isNotEmpty;

    void activateSearch() => searchActive.value = true;

    void deactivateSearch() {
      searchActive.value = false;
      searchQuery.value = '';
      searchController.clear();
    }

    String sortLabel(_SortMode mode) => switch (mode) {
          _SortMode.dateNewest => l.sort_date_newest,
          _SortMode.dateOldest => l.sort_date_oldest,
          _SortMode.titleAz => l.sort_title_az,
          _SortMode.titleZa => l.sort_title_za,
        };

    final appBar = adaptiveAppBar(
      context: context,
      ref: ref,
      automaticallyImplyLeading: !searchActive.value,
      leading: searchActive.value
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: deactivateSearch,
            )
          : null,
      title: searchActive.value
          ? TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: l.search,
                border: InputBorder.none,
              ),
              onChanged: (v) => searchQuery.value = v,
            )
          : Text(l.download_management),
      actions: searchActive.value
          ? null
          : [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: activateSearch,
              ),
              PopupMenuButton<_SortMode>(
                icon: const Icon(Icons.sort),
                tooltip: l.sort_by,
                initialValue: sortMode.value,
                onSelected: (mode) => sortMode.value = mode,
                itemBuilder: (context) => _SortMode.values
                    .map(
                      (mode) => PopupMenuItem<_SortMode>(
                        value: mode,
                        child: Row(
                          children: [
                            if (sortMode.value == mode)
                              Icon(Icons.check,
                                  size: 16,
                                  color:
                                      Theme.of(context).colorScheme.primary)
                            else
                              const SizedBox(width: 16),
                            const SizedBox(width: 8),
                            Text(sortLabel(mode)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () => erosRouter.push(const DownloadSettingRoute()),
              ),
              const SizedBox(width: 8),
            ],
    );

    Widget buildSection(String label, int count, List<DownloadTask> list) {
      return MultiSliver(
        pushPinnedChildren: true,
        children: [
          SliverPinnedHeader(
            child: _SectionHeader(label: label, count: count),
          ),
          _TaskList(tasks: list),
        ],
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: appBar,
      body: tasks.isEmpty
          ? const _EmptyState()
          : !hasResults
              ? const _NoResultsState()
              : CustomScrollView(
                  slivers: [
                    if (glass)
                      SliverToBoxAdapter(
                        child: SizedBox(height: glassBodyPadding(context).top),
                      ),
                    if (downloading.isNotEmpty)
                      buildSection(
                          l.downloading, downloading.length, downloading),
                    if (paused.isNotEmpty)
                      buildSection(l.download_paused, paused.length, paused),
                    if (completed.isNotEmpty)
                      buildSection(
                          l.download_completed, completed.length, completed),
                    if (failed.isNotEmpty)
                      buildSection(l.download_failed, failed.length, failed),
                    const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  ],
                ),
    );
  }
}

// ---------------------------------------------------------------------------
// Empty state
// ---------------------------------------------------------------------------

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.download_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          const SizedBox(height: 16),
          Text(
            L10n.of(context).no_downloads,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// No search results state
// ---------------------------------------------------------------------------

class _NoResultsState extends StatelessWidget {
  const _NoResultsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          const SizedBox(height: 16),
          Text(
            L10n.of(context).no_result,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Section header — regular widget (wrapped in SliverPinnedHeader by parent)
// ---------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label, required this.count});

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: scheme.primary,
                  ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: scheme.onPrimaryContainer,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Task list
// ---------------------------------------------------------------------------

class _TaskList extends StatelessWidget {
  const _TaskList({required this.tasks});

  final List<DownloadTask> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: _TaskCard(task: tasks[index]),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Task card — thumbnail is edge-to-edge on left/top/bottom
// ---------------------------------------------------------------------------

class _TaskCard extends ConsumerWidget {
  const _TaskCard({required this.task});

  final DownloadTask task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final notifier = ref.read(downloadProvider.notifier);
    final l = L10n.of(context);

    final progress = task.totalPages > 0
        ? (task.downloadedPages / task.totalPages).clamp(0.0, 1.0)
        : 0.0;

    final isDownloading = task.status == DownloadStatus.downloading;
    final isPending = task.status == DownloadStatus.pending;
    final isPaused = task.status == DownloadStatus.paused;
    final isCompleted = task.status == DownloadStatus.completed;
    final isFailed = task.status == DownloadStatus.failed;
    final isActive = isDownloading || isPending;

    // Status text
    final String statusText;
    if (isCompleted) {
      statusText = l.download_total_pages(task.totalPages);
    } else if (isPending) {
      statusText = l.download_pending;
    } else {
      statusText = l.download_progress(task.downloadedPages, task.totalPages);
    }

    // Date label — skip for legacy tasks with createdAt == 0
    final String? dateText = task.createdAt > 0
        ? l.added_on(
            DateFormat('yyyy-MM-dd').format(
              DateTime.fromMillisecondsSinceEpoch(task.createdAt),
            ),
          )
        : null;

    // Primary action
    Widget? primaryActionIcon;
    VoidCallback? primaryAction;
    if (isDownloading) {
      primaryActionIcon = Icon(Icons.pause, size: 28, color: scheme.primary);
      primaryAction = () => notifier.pauseDownload(task.gid);
    } else if (isPaused) {
      primaryActionIcon =
          Icon(Icons.play_arrow, size: 28, color: scheme.primary);
      primaryAction = () => notifier.resumeDownload(task.gid);
    } else if (isFailed) {
      primaryActionIcon = Icon(Icons.refresh, size: 28, color: scheme.primary);
      primaryAction = () => notifier.resumeDownload(task.gid);
    }

    final String overflowLabel = isActive ? l.cancel : l.delete;

    void openReader() {
      logger.d('openReader gid=${task.gid}');
      pushGalleryPage(task.gid);
      erosRouter.push(ReadRoute(colorScheme: Theme.of(context).colorScheme));
    }

    void openGallery() {
      logger.d('openGallery gid=${task.gid}');
      RouteUtil.goGalleryByGid(ref, task.gid);
    }

    // Thumbnail: for completed tasks, prefer the local first page file.
    Widget buildThumb() {
      if (isCompleted &&
          task.pageExts.isNotEmpty &&
          task.savedDir.isNotEmpty) {
        final localPath = '${task.savedDir}/1.${task.pageExts[0]}';
        final localFile = File(localPath);
        if (localFile.existsSync()) {
          return Image.file(
            localFile,
            fit: BoxFit.cover,
            width: 60,
            height: double.infinity,
            errorBuilder: (_, __, ___) => _networkThumb(task, scheme),
          );
        }
      }
      return _networkThumb(task, scheme);
    }

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: scheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: isCompleted ? openReader : null,
        child: SizedBox(
          height: 88,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Thumbnail — touches card edges on left/top/bottom
              InkWell(
                onTap: openGallery,
                child: SizedBox(width: 60, child: buildThumb()),
              ),
              // Info column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        task.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(height: 1.3),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            statusText,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: isFailed
                                      ? scheme.error
                                      : scheme.onSurfaceVariant,
                                ),
                          ),
                          if (dateText != null) ...[
                            Text(
                              ' · ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: scheme.onSurfaceVariant
                                        .withValues(alpha: 0.7),
                                  ),
                            ),
                            Text(
                              dateText,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: scheme.onSurfaceVariant
                                        .withValues(alpha: 0.7),
                                  ),
                            ),
                          ],
                        ],
                      ),
                      if (!isCompleted) ...[
                        const SizedBox(height: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 3,
                            backgroundColor: scheme.surfaceContainerHighest,
                            color: isFailed
                                ? scheme.error
                                : isActive
                                    ? scheme.primary
                                    : scheme.outline,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              // Action buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (primaryActionIcon != null)
                      IconButton(
                        icon: primaryActionIcon,
                        onPressed: primaryAction,
                        visualDensity: VisualDensity.compact,
                      ),
                    PopupMenuButton<String>(
                      iconSize: 28,
                      iconColor: scheme.primary,
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) async {
                        if (value == 'redownload') {
                          notifier.redownloadGallery(task.gid);
                        } else if (value == 'delete') {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(l.download_delete_confirm_title),
                              content:
                                  Text(l.download_delete_confirm_message),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(ctx, false),
                                  child: Text(l.cancel),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(ctx, true),
                                  child: Text(
                                    l.delete,
                                    style:
                                        TextStyle(color: scheme.error),
                                  ),
                                ),
                              ],
                            ),
                          );
                          if (confirmed == true) {
                            notifier.deleteDownload(task.gid);
                          }
                        }
                      },
                      itemBuilder: (context) => [
                        if (isCompleted)
                          PopupMenuItem<String>(
                            value: 'redownload',
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.refresh,
                                    size: 18, color: scheme.primary),
                                const SizedBox(width: 8),
                                Text(l.download_redownload),
                              ],
                            ),
                          ),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isActive
                                    ? Icons.cancel_outlined
                                    : Icons.delete_outline,
                                size: 18,
                                color: scheme.error,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                overflowLabel,
                                style: TextStyle(color: scheme.error),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _networkThumb(DownloadTask task, ColorScheme scheme) {
  return task.thumbUrl.isNotEmpty
      ? ErosCachedNetworkImage(
          imageUrl: task.thumbUrl,
          fit: BoxFit.cover,
          width: 60,
          height: double.infinity,
        )
      : ColoredBox(color: scheme.surfaceContainerHighest);
}
