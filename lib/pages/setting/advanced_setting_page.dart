import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AdvancedSettingPage extends StatelessWidget {
  const AdvancedSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).advanced)),
      body: ListView(
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
        ],
      ),
    );
  }
}
