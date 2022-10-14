import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'setting_base.dart';

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
          SmallTitle(title: L10n.of(context).theme),
          // ThemeMode
          Consumer(builder: (context, ref, child) {
            final themeMode = ref.watch(
                settingsProvider.select((settings) => settings.themeMode));
            return RadioDialogListTile<ThemeMode>(
              title: Text(L10n.of(context).theme_mode),
              groupValue: themeMode,
              radioTitleMap: {
                ThemeMode.system: Text(L10n.of(context).system),
                ThemeMode.light: Text(L10n.of(context).light),
                ThemeMode.dark: Text(L10n.of(context).dark),
                // TagLayoutOnCard.row: Text('Row'),
              },
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setThemeMode(value);
              },
            );
          }),

          // Switch dynamic color
          Consumer(builder: (context, ref, child) {
            final dynamicColor = ref.watch(
                settingsProvider.select((settings) => settings.dynamicColor));
            return ListTile(
              title: Text(L10n.of(context).dynamic_color),
              subtitle: Text(L10n.of(context).dynamic_color_tip),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: dynamicColor,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setDynamicColor(value);
                },
              ),
            );
          }),
          Divider(height: 1.0),
          SmallTitle(title: L10n.of(context).list_style),
          // Switch tag translate
          Consumer(builder: (context, ref, child) {
            final isTagTranslate = ref.watch(
                settingsProvider.select((settings) => settings.isTagTranslate));
            final tagTranslateInfo = ref.watch(tagTranslateProvider);
            return ListTile(
              title: Text(L10n.of(context).tag_translation),
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
          // Switch show tags
          Consumer(builder: (context, ref, child) {
            final showTags = ref.watch(
                settingsProvider.select((settings) => settings.showTags));
            return ListTile(
              title: Text(L10n.of(context).show_tags),
              subtitle: Text(L10n.of(context).show_tags_tip),
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
              title: Text(L10n.of(context).tag_layout_on_card),
              groupValue: tagLayoutOnCard,
              radioTitleMap: {
                TagLayoutOnCard.wrap: Text(L10n.of(context).wrap),
                TagLayoutOnCard.singleLine: Text(L10n.of(context).single_line),
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
              title: Text(L10n.of(context).cover_blur),
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
