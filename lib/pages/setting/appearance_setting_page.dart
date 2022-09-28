import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppearanceSettingPage extends StatelessWidget {
  const AppearanceSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).appearance),
      ),
      body: ListView(
        children: <Widget>[
          Consumer(builder: (context, ref, child) {
            final isCoverBlur = ref.watch(
                settingsProvider.select((settings) => settings.coverBlur));
            return ListTile(
              title: Text('Cover blur'),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: isCoverBlur,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setCoverBlur(value);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
