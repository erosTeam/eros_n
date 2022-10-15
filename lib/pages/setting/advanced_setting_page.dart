import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'setting_base.dart';

class AdvancedSettingPage extends StatelessWidget {
  const AdvancedSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).advanced),
      ),
      body: ListView(
        children: <Widget>[
          SmallTitle(title: L10n.of(context).tag),
          Consumer(builder: (context, ref, child) {
            final allNhTag = ref.watch(allNhTagProvider);
            return ListTile(
              title: Text(L10n.of(context).tags_data),
              // subtitle: Text('total: ${ref.watch(tagTranslateProvider).total}, long press to update'),
              subtitle: allNhTag.when(
                data: (data) =>
                    Text('total: ${data.length}, long press to update'),
                loading: () => Text('loading...'),
                error: (error, stack) => Text('error: $error'),
              ),
              onLongPress: () {
                ref.read(tagTranslateProvider.notifier).updateNhTags();
              },
            );
          }),
        ],
      ),
    );
  }
}
