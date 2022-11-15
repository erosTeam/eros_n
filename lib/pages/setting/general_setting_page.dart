import 'dart:ui';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_by_default/open_by_default.dart';

class GeneralSettingPage extends StatelessWidget {
  const GeneralSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context).general),
        ),
        body: ListView(
          children: [
            // switch language
            Consumer(builder: (context, ref, child) {
              final localeCode = ref.watch(
                  settingsProvider.select((settings) => settings.localeCode));

              final radioTitleMap = {'': Text(L10n.of(context).system)};

              final radioTitleMapFromSupported =
                  L10n.delegate.supportedLocales.asMap().map((key, value) {
                final code = '${value.languageCode}_${value.countryCode ?? ''}';
                return MapEntry(code, Text(NHConst.localeMap[code]!));
              });

              radioTitleMap.addAll(radioTitleMapFromSupported);

              return RadioDialogListTile<String>(
                title: Text(L10n.of(context).language),
                groupValue: localeCode,
                radioTitleMap: radioTitleMap,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setLocaleCode(value);
                },
              );
            }),
            // siwtch hideBottomNavigationOnScroll
            Consumer(builder: (context, ref, child) {
              final hideBottomNavigationOnScroll = ref.watch(settingsProvider
                  .select((settings) => settings.hideBottomNavigationOnScroll));

              return SwitchListTile(
                title: Text(L10n.of(context).hide_bottom_navigation_on_scroll),
                value: hideBottomNavigationOnScroll,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setHideBottomNavigationOnScroll(value);
                },
              );
            }),
            // switch clipboardDetection
            Consumer(builder: (context, ref, child) {
              final clipboardDetection = ref.watch(settingsProvider
                  .select((settings) => settings.clipboardDetection));

              return SwitchListTile(
                title: Text(L10n.of(context).clipboard_detection),
                value: clipboardDetection,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setClipboardDetection(value);
                },
              );
            }),

            // open_supported_links
            ListTile(
              title: Text(L10n.of(context).open_supported_links),
              subtitle: Text(L10n.of(context).open_supported_links_tip),
              onTap: OpenByDefault.open,
            ),
          ],
        ));
  }
}
