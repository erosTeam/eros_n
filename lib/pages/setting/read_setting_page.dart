import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/read/read_provider.dart';
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
          const FullScreenListTile(),
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
          // switch volumeKeyTurnPage
          const VolumeKeyTurnPageListTile(),
          const AutoReadIntervalListTile(),
          const PreloadPagesCountListTile(),
        ],
      ),
    );
  }
}

class VolumeKeyTurnPageListTile extends StatelessWidget {
  const VolumeKeyTurnPageListTile({
    Key? key,
    this.onReadView = false,
  }) : super(key: key);
  final bool onReadView;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final volumeKeyTurnPage = ref.watch(
          settingsProvider.select((settings) => settings.volumeKeyTurnPage));
      return ListTile(
        title: Text(L10n.of(context).volume_key_turn_page),
        trailing: Switch(
          activeColor: Theme.of(context).colorScheme.primary,
          value: volumeKeyTurnPage,
          onChanged: (value) {
            ref.read(settingsProvider.notifier).setVolumeKeyTurnPage(value);

            if (onReadView) {
              if (value) {
                ref.read(readProvider.notifier).addVolumeKeydownListen();
              } else {
                ref.read(readProvider.notifier).closeVolumeKeydownListen();
              }
            }
          },
        ),
      );
    });
  }
}

class FullScreenListTile extends HookConsumerWidget {
  const FullScreenListTile({
    Key? key,
    this.onReadView = false,
  }) : super(key: key);
  final bool onReadView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullScreenReader = ref.watch(
        settingsProvider.select((settings) => settings.fullScreenReader));
    return ListTile(
      title: Text(L10n.of(context).full_screen),
      trailing: Switch(
        activeColor: Theme.of(context).colorScheme.primary,
        value: fullScreenReader,
        onChanged: (value) {
          ref.read(settingsProvider.notifier).setFullScreenReader(value);

          if (onReadView) {
            if (value) {
              ref.read(readProvider.notifier).setFullscreen();
            } else {
              ref.read(readProvider.notifier).unFullscreen();
            }
          }
        },
      ),
    );
  }
}

class PreloadPagesCountListTile extends HookConsumerWidget {
  const PreloadPagesCountListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preloadPageCount = ref.watch(
        settingsProvider.select((settings) => settings.preloadPagesCount));
    return ListTile(
      title: Text(L10n.of(context).preload_pages_count),
      subtitle: Row(
        children: [
          Container(
            width: 36,
            alignment: Alignment.center,
            child: Text('$preloadPageCount'),
          ),
          Expanded(
            child: Slider(
              value: preloadPageCount.toDouble(),
              min: 0,
              max: 7,
              divisions: 7,
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .setPreloadPagesCount(value.round());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AutoReadIntervalListTile extends HookConsumerWidget {
  const AutoReadIntervalListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoReadInterval = ref.watch(
        settingsProvider.select((settings) => settings.autoReadInterval));

    return ListTile(
      title: Text(L10n.of(context).auto_read_interval),
      subtitle: Row(
        children: [
          Container(
            width: 36,
            alignment: Alignment.center,
            child: Text('${autoReadInterval}s'),
          ),
          Expanded(
            child: Slider(
              value: autoReadInterval.toDouble(),
              min: 0.5,
              max: 10,
              divisions: 19,
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setAutoReadInterval(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
