import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(L10n.of(context).settings),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: <Widget>[
          ListTile(
            iconColor: Theme.of(context).colorScheme.primary,
            leading: const Icon(Icons.tune_outlined),
            title: Text(L10n.of(context).general),
            onTap: () {
              erosRouter.push(const GeneralSettingRoute());
            },
          ),
          ListTile(
            iconColor: Theme.of(context).colorScheme.primary,
            leading: const Icon(Icons.color_lens_outlined),
            title: Text(L10n.of(context).appearance),
            onTap: () {
              erosRouter.push(const AppearanceSettingRoute());
            },
          ),
          // read setting
          ListTile(
            iconColor: Theme.of(context).colorScheme.primary,
            leading: const Icon(Icons.chrome_reader_mode_outlined),
            title: Text(L10n.of(context).read),
            onTap: () {
              erosRouter.push(const ReadSettingRoute());
            },
          ),
          // advance setting
          ListTile(
            iconColor: Theme.of(context).colorScheme.primary,
            leading: const Icon(Icons.data_object_outlined),
            title: Text(L10n.of(context).advanced),
            onTap: () {
              erosRouter.push(const AdvancedSettingRoute());
            },
          ),
          ListTile(
            iconColor: Theme.of(context).colorScheme.primary,
            leading: const Icon(Icons.download_outlined),
            title: Text(L10n.of(context).download),
            onTap: () {
              erosRouter.push(const DownloadSettingRoute());
            },
          ),
        ],
      ),
    );
  }
}
