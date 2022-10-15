import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
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
          SmallTitle(title: L10n.of(context).display),
          // Switch full screen reader
          Consumer(builder: (context, ref, child) {
            final fullScreenReader = ref.watch(settingsProvider
                .select((settings) => settings.fullScreenReader));
            return ListTile(
              title: Text(L10n.of(context).full_screen),
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
          // switch read model
          Consumer(builder: (context, ref, child) {
            final readModel = ref.watch(
                settingsProvider.select((settings) => settings.readModel));
            return RadioDialogListTile<ReadModel>(
              title: Text(L10n.of(context).read_model),
              groupValue: readModel,
              radioTitleMap: {
                ReadModel.leftToRight: Text(L10n.of(context).left_to_right),
                ReadModel.rightToLeft: Text(L10n.of(context).right_to_left),
                ReadModel.webtoon: Text(L10n.of(context).webtoon),
                ReadModel.curlVertical: Text(L10n.of(context).curl_vertical),
                ReadModel.vertical: Text(L10n.of(context).vertical),
              },
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setReadModel(value);
              },
            );
          }),
          const Divider(height: 1.0),
        ],
      ),
    );
  }
}
