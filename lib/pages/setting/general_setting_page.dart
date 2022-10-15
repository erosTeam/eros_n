import 'dart:ui';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          ],
        ));
  }
}
