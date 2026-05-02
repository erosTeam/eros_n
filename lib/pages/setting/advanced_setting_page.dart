import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/setting/cache_size_provider.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AdvancedSettingPage extends ConsumerWidget {
  const AdvancedSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(L10n.of(context).advanced),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: <Widget>[
          SmallTitle(title: L10n.of(context).tag),
          Consumer(
            builder: (context, ref, child) {
              final allNhTag = ref.watch(allNhTagProvider);
              return ListTile(
                title: Text(L10n.of(context).tags_data),
                subtitle: allNhTag.when(
                  data: (data) => Text('cached: ${data.length}'),
                  loading: () => const Text('loading...'),
                  error: (error, stack) => Text('error: $error'),
                ),
              );
            },
          ),
          const _CacheTile(),
        ],
      ),
    );
  }
}

class _CacheTile extends ConsumerWidget {
  const _CacheTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeAsync = ref.watch(cacheSizeProvider);
    final l10n = L10n.of(context);

    final subtitle = sizeAsync.when(
      data: (bytes) {
        final text = formatCacheSize(bytes);
        return text != null ? Text(text) : null;
      },
      loading: () => Text(l10n.cache_calculating),
      error: (e, st) => null,
    );

    return ListTile(
      title: Text(l10n.clear_cache),
      subtitle: subtitle,
      onTap: sizeAsync.isLoading
          ? null
          : () => _confirmClear(context, ref, l10n),
    );
  }

  Future<void> _confirmClear(
    BuildContext context,
    WidgetRef ref,
    L10n l10n,
  ) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.clear_cache),
        content: Text(l10n.clear_cache_tip),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
    if (ok == true) {
      await ref.read(cacheSizeProvider.notifier).clearAll();
    }
  }
}
