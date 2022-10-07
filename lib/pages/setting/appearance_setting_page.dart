import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'setting_base.dart';
import 'settings_page.dart';

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
          SmallTitle(title: 'Theme'),
          // Switch dynamic color
          if (GetPlatform.isAndroid)
            Consumer(builder: (context, ref, child) {
              final dynamicColor = ref.watch(
                  settingsProvider.select((settings) => settings.dynamicColor));
              return ListTile(
                title: Text('Dynamic color'),
                subtitle: Text('Only works on Android 12+'),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: dynamicColor,
                  onChanged: (value) {
                    ref.read(settingsProvider.notifier).setDynamicColor(value);
                  },
                ),
              );
            }),
          Divider(thickness: 1.0, height: 1.0),
          SmallTitle(title: 'List style'),
          // Switch tag translate
          Consumer(builder: (context, ref, child) {
            final isTagTranslate = ref.watch(
                settingsProvider.select((settings) => settings.isTagTranslate));
            final tagTranslateInfo = ref.watch(tagTranslateProvider);
            return ListTile(
              title: Text('Tag translate'),
              subtitle: Text('Version: ${tagTranslateInfo.version ?? ''}'),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: isTagTranslate,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setTagTranslate(value);
                },
              ),
              onLongPress: () {
                ref.read(tagTranslateProvider.notifier).updateDb(force: true);
              },
            );
          }),
          // Switch show tags
          Consumer(builder: (context, ref, child) {
            final showTags = ref.watch(
                settingsProvider.select((settings) => settings.showTags));
            return ListTile(
              title: Text('Show tags'),
              subtitle: Text('Show tags in list'),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: showTags,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setShowTags(value);
                },
              ),
              onLongPress: () {
                ref.read(tagTranslateProvider.notifier).updateNhTags();
              },
            );
          }),
          Consumer(builder: (context, ref, child) {
            final tagLayoutOnCard = ref.watch(settingsProvider
                .select((settings) => settings.tagLayoutOnCard));
            return RadioDialogListTile<TagLayoutOnCard>(
              title: Text('Tag layout on card'),
              groupValue: tagLayoutOnCard,
              radioTitleMap: {
                TagLayoutOnCard.wrap: Text('Wrap'),
                TagLayoutOnCard.horizontal: Text('Horizontal'),
                // TagLayoutOnCard.row: Text('Row'),
              },
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setTagLayoutOnCard(value);
              },
            );
          }),

          Consumer(builder: (context, ref, child) {
            final isCoverBlur = ref.watch(
                settingsProvider.select((settings) => settings.isCoverBlur));
            return ListTile(
              title: Text('Cover blur'),
              subtitle: Text('Blur cover image in list'),
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
