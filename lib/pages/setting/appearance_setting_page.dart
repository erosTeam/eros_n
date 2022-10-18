import 'package:dynamic_color/dynamic_color.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/common/provider/tag_translate_provider.dart';
import 'package:eros_n/component/theme/theme.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';

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
          /// Theme
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
          // Consumer(builder: (context, ref, child) {
          //   final dynamicColor = ref.watch(
          //       settingsProvider.select((settings) => settings.dynamicColor));
          //   return ListTile(
          //     title: Text(L10n.of(context).dynamic_color),
          //     subtitle: Text(L10n.of(context).dynamic_color_tip),
          //     trailing: Switch(
          //       activeColor: Theme.of(context).colorScheme.primary,
          //       value: dynamicColor,
          //       onChanged: (value) {
          //         ref.read(settingsProvider.notifier).setDynamicColor(value);
          //       },
          //     ),
          //   );
          // }),

          Consumer(builder: (context, ref, child) {
            final supportDynamicColors = ref.watch(settingsProvider
                .select((settings) => settings.supportDynamicColors));
            final themeColorLabel = ref.watch(settingsProvider
                .select((settings) => settings.themeColorLabel));

            final colorMap = <String, Color?>{};
            if (supportDynamicColors) {
              colorMap.addAll({ThemeConfig.dynamicThemeColorLabel: null});
            }
            colorMap.addAll(ThemeConfig.colorMap);

            if (!supportDynamicColors &&
                themeColorLabel == ThemeConfig.dynamicThemeColorLabel) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref
                    .read(settingsProvider.notifier)
                    .setThemeColorLabel(ThemeConfig.defaultThemeColorLabel);
              });
            }

            return ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(L10n.of(context).theme),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              subtitle: SizedBox(
                height: 200,
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final color = colorMap.entries.toList()[index];

                    Widget selector = ThemeSelector(
                      seedColor: color.value,
                      selected: color.key ==
                          ref.watch(settingsProvider
                              .select((settings) => settings.themeColorLabel)),
                      name: color.key,
                      onTap: () {
                        ref
                            .read(settingsProvider.notifier)
                            .setThemeColorLabel(color.key);
                      },
                    );

                    return selector;

                    return FrameSeparateWidget(
                      index: index,
                      placeHolder: const ThemeSelector(
                        seedColor: Colors.black,
                        selected: false,
                        name: '',
                      ),
                      child: selector,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: ThemeConfig.colorMap.length,
                ),
              ),
            );
          }),

          // switch useGalleryTint
          Consumer(builder: (context, ref, child) {
            final useGalleryTint = ref.watch(
                settingsProvider.select((settings) => settings.useGalleryTint));
            return ListTile(
              title: Text(L10n.of(context).use_gallery_tint),
              subtitle: Text(L10n.of(context).use_gallery_tint_tip),
              trailing: Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: useGalleryTint,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).setUseGalleryTint(value);
                },
              ),
            );
          }),

          const Divider(height: 1.0),

          /// List Style
          SmallTitle(title: L10n.of(context).list_style),
          // switch list model
          Consumer(builder: (context, ref, child) {
            final listModel = ref.watch(
                settingsProvider.select((settings) => settings.listModel));
            return RadioDialogListTile<ListModel>(
              title: Text(L10n.of(context).list_model),
              groupValue: listModel,
              radioTitleMap: {
                ListModel.list: Text(L10n.of(context).list),
                ListModel.grid: Text(L10n.of(context).grid),
                ListModel.waterfall: Text(L10n.of(context).waterfall),
                ListModel.waterfallCompact:
                    Text(L10n.of(context).waterfall_compact),
              },
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setListModel(value);
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
            final tagLayoutOnItem = ref.watch(settingsProvider
                .select((settings) => settings.tagLayoutOnItem));
            return RadioDialogListTile<TagLayoutOnItem>(
              title: Text(L10n.of(context).tag_layout_on_item),
              groupValue: tagLayoutOnItem,
              radioTitleMap: {
                TagLayoutOnItem.wrap: Text(L10n.of(context).wrap),
                TagLayoutOnItem.singleLine: Text(L10n.of(context).single_line),
                // TagLayoutOnCard.row: Text('Row'),
              },
              onChanged: (value) {
                ref.read(settingsProvider.notifier).setTagLayoutOnItem(value);
              },
            );
          }),

          // Switch tag translate
          Consumer(builder: (context, ref, child) {
            final isTagTranslate = ref.watch(
                settingsProvider.select((settings) => settings.isTagTranslate));
            final tagTranslateInfo = ref.watch(tagTranslateProvider);
            return ListTile(
              title: Text(L10n.of(context).tag_translation),
              subtitle: Text(L10n.of(context)
                  .tag_translation_tip(tagTranslateInfo.version ?? '')),
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

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    Key? key,
    required this.seedColor,
    required this.selected,
    required this.name,
    this.dynamic = false,
    this.onTap,
  }) : super(key: key);
  final Color? seedColor;
  final bool selected;
  final bool dynamic;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    late ColorScheme lightColorScheme;
    late ColorScheme darkColorScheme;

    if (dynamic || seedColor == null) {
      return DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) {
          if (lightDynamic != null && darkDynamic != null) {
            lightColorScheme = lightDynamic.harmonized();
            darkColorScheme = darkDynamic.harmonized();
          } else {
            return const SizedBox();
          }

          return ColorSelector(
            lightColorScheme: lightColorScheme,
            darkColorScheme: darkColorScheme,
            selected: selected,
            name: name,
            onTap: onTap,
          );
        },
      );
    } else {
      lightColorScheme = ColorScheme.fromSeed(
        seedColor: seedColor!,
      );

      darkColorScheme = ColorScheme.fromSeed(
        seedColor: seedColor!,
        brightness: Brightness.dark,
      );

      return ColorSelector(
        lightColorScheme: lightColorScheme,
        darkColorScheme: darkColorScheme,
        selected: selected,
        name: name,
        onTap: onTap,
      );
    }
  }
}

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.lightColorScheme,
    required this.darkColorScheme,
    required this.selected,
    required this.onTap,
    required this.name,
  });

  final ColorScheme lightColorScheme;
  final ColorScheme darkColorScheme;
  final bool selected;
  final VoidCallback? onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    final lightTheme =
        ThemeData.from(colorScheme: lightColorScheme, useMaterial3: true);

    final darkTheme =
        ThemeData.from(colorScheme: darkColorScheme, useMaterial3: true);

    final theme = Theme.of(context).brightness == Brightness.light
        ? lightTheme
        : darkTheme;

    return Theme(
      data: theme,
      child: Builder(builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.12),
                      width: 4,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: onTap,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 36,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    padding: const EdgeInsets.all(2),
                                    margin: const EdgeInsets.all(4),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(selected ? 1 : 0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary
                                          .withOpacity(selected ? 1 : 0),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 50,
                                width: 46,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 20,
                                    width: 24,
                                    margin: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                                    right: Radius.circular(6)),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            height: 36,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 21,
                                  height: 21,
                                  margin: const EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(name),
            ],
          ),
        );
      }),
    );
  }
}
