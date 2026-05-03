import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DownloadSettingPage extends ConsumerWidget {
  const DownloadSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);
    final l = L10n.of(context);

    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(l.download_settings),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              l.concurrent_downloads,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          ListTile(
            title: Text(l.max_concurrent_galleries),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SegmentedButton<int>(
                segments: [
                  for (var i = 1; i <= 5; i++)
                    ButtonSegment<int>(value: i, label: Text('$i')),
                ],
                selected: {settings.maxConcurrentGalleries},
                onSelectionChanged: (v) =>
                    notifier.setMaxConcurrentGalleries(v.first),
                showSelectedIcon: false,
              ),
            ),
          ),
          ListTile(
            title: Text(l.max_concurrent_pages),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SegmentedButton<int>(
                segments: [
                  for (var i = 1; i <= 5; i++)
                    ButtonSegment<int>(value: i, label: Text('$i')),
                ],
                selected: {settings.maxConcurrentPages},
                onSelectionChanged: (v) =>
                    notifier.setMaxConcurrentPages(v.first),
                showSelectedIcon: false,
              ),
            ),
          ),
          _ConcurrencyWarning(
            galleries: settings.maxConcurrentGalleries,
            pages: settings.maxConcurrentPages,
          ),
          const Divider(height: 1),
          // Download path section — only on Android / HarmonyOS
          if (!Platform.isIOS) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Text(
                l.download_path,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ListTile(
              title: Text(l.current_path),
              subtitle: Text(
                settings.customDownloadPath.isNotEmpty
                    ? settings.customDownloadPath
                    : Global.downloadsPath,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  if (settings.customDownloadPath.isNotEmpty)
                    TextButton(
                      onPressed: () {
                        notifier.setCustomDownloadPath('');
                      },
                      child: Text(l.reset_to_default),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Concurrency warning banner
// ---------------------------------------------------------------------------

class _ConcurrencyWarning extends StatelessWidget {
  const _ConcurrencyWarning({required this.galleries, required this.pages});

  final int galleries;
  final int pages;

  @override
  Widget build(BuildContext context) {
    final total = galleries * pages;
    final scheme = Theme.of(context).colorScheme;
    final l = L10n.of(context);

    // total <= 4: safe (hidden)  5–8: warning  >= 9: error
    final Color bgColor;
    final Color fgColor;
    final IconData icon;
    final String message;

    if (total >= 9) {
      bgColor = scheme.errorContainer;
      fgColor = scheme.onErrorContainer;
      icon = Icons.warning_amber_rounded;
      message = l.cdn_warn_high(total, galleries, pages);
    } else if (total >= 5) {
      bgColor = scheme.tertiaryContainer;
      fgColor = scheme.onTertiaryContainer;
      icon = Icons.info_outline_rounded;
      message = l.cdn_warn_moderate(total, galleries, pages);
    } else {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: fgColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: fgColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
