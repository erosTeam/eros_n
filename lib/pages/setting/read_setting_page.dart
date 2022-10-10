import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'setting_base.dart';

class ReadSettingPage extends StatelessWidget {
  const ReadSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).read),
      ),
      body: ListView(
        children: <Widget>[
          SmallTitle(title: 'Display'),
          // Switch full screen reader
          Consumer(builder: (context, ref, child) {
            final fullScreenReader = ref.watch(settingsProvider
                .select((settings) => settings.fullScreenReader));
            return ListTile(
              title: Text('Full screen'),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: fullScreenReader,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setFullScreenReader(value);
                },
              ),
            );
          }),
          const Divider(height: 1.0),
        ],
      ),
    );
  }
}
