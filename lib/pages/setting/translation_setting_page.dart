import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/toast.dart';
import 'package:eros_n/utils/translation/bilingual_style_helper.dart';
import 'package:eros_n/utils/translation/llm_translator.dart';
import 'package:eros_n/utils/translation/translation_cache.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TranslationSettingPage extends ConsumerWidget {
  const TranslationSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(L10n.of(context).translation_settings),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final commentTranslation = ref.watch(
                settingsProvider.select((s) => s.commentTranslation),
              );
              return SwitchListTile(
                title: Text(L10n.of(context).comment_translation),
                value: commentTranslation,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setCommentTranslation(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final autoTranslate = ref.watch(
                settingsProvider.select((s) => s.autoTranslateComments),
              );
              return SwitchListTile(
                title: Text(L10n.of(context).auto_translate_comments),
                value: autoTranslate,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setAutoTranslateComments(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final displayMode = ref.watch(
                settingsProvider.select((s) => s.translationDisplayMode),
              );
              return RadioDialogListTile<TranslationDisplayMode>(
                title: Text(L10n.of(context).translation_display_mode),
                groupValue: displayMode,
                radioTitleMap: {
                  TranslationDisplayMode.replaceOriginal: Text(
                    L10n.of(context).replace_original,
                  ),
                  TranslationDisplayMode.bilingual: Text(
                    L10n.of(context).bilingual_display,
                  ),
                },
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setTranslationDisplayMode(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final displayMode = ref.watch(
                settingsProvider.select((s) => s.translationDisplayMode),
              );
              if (displayMode != TranslationDisplayMode.bilingual) {
                return const SizedBox.shrink();
              }
              final bilingualStyle = ref.watch(
                settingsProvider.select((s) => s.bilingualStyle),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(L10n.of(context).bilingual_style),
                    subtitle: _BilingualStyleName(style: bilingualStyle),
                    onTap: () =>
                        _showBilingualStylePicker(context, ref, bilingualStyle),
                  ),
                  _BilingualPreview(style: bilingualStyle),
                ],
              );
            },
          ),
          const Divider(),
          Consumer(
            builder: (context, ref, child) {
              final useGoogle = ref.watch(
                settingsProvider.select((s) => s.useGoogleTranslate),
              );
              return SwitchListTile(
                title: Text(L10n.of(context).use_google_translate),
                subtitle: Text(L10n.of(context).use_google_translate_tip),
                value: useGoogle,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setUseGoogleTranslate(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final useGoogle = ref.watch(
                settingsProvider.select((s) => s.useGoogleTranslate),
              );
              if (useGoogle) {
                return const SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallTitle(
                    title: L10n.of(context).translation_service_config,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      L10n.of(context).translation_hint,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _TranslationConfigFields(),
                ],
              );
            },
          ),
          const Divider(),
          _TranslationCacheTile(),
        ],
      ),
    );
  }
}

void _showBilingualStylePicker(
  BuildContext context,
  WidgetRef ref,
  BilingualStyle current,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.only(top: 16),
        title: Text(L10n.of(context).bilingual_style),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: BilingualStyle.values.map((style) {
            return RadioListTile<BilingualStyle>(
              title: _BilingualStyleName(style: style),
              value: style,
              groupValue: current,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (v) {
                if (v != null) {
                  ref.read(settingsProvider.notifier).setBilingualStyle(v);
                  Navigator.of(context).pop();
                }
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(L10n.of(context).cancel),
          ),
        ],
      );
    },
  );
}

class _BilingualStyleName extends StatelessWidget {
  const _BilingualStyleName({required this.style});
  final BilingualStyle style;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    switch (style) {
      case BilingualStyle.divider:
        return Text(l10n.bilingual_style_divider);
      case BilingualStyle.subtle:
        return Text(l10n.bilingual_style_subtle);
      case BilingualStyle.compact:
        return Text(l10n.bilingual_style_compact);
    }
  }
}

class _BilingualPreview extends StatelessWidget {
  const _BilingualPreview({required this.style});
  final BilingualStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = L10n.of(context);
    final original = l10n.bilingual_preview_original;
    final translated = l10n.bilingual_preview_translated;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              original,
              style: bilingualOriginalStyle(context),
              textScaler: const TextScaler.linear(bilingualTextScaleFactor),
            ),
            bilingualSeparator(context, style),
            Text(
              translated,
              style: bilingualTranslatedStyle(context, style),
              textScaler: const TextScaler.linear(bilingualTextScaleFactor),
            ),
          ],
        ),
      ),
    );
  }
}

class _TranslationCacheTile extends StatefulWidget {
  @override
  State<_TranslationCacheTile> createState() => _TranslationCacheTileState();
}

class _TranslationCacheTileState extends State<_TranslationCacheTile> {
  int _entryCount = 0;

  @override
  void initState() {
    super.initState();
    _entryCount = TranslationCacheService.instance.entryCount;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return ListTile(
      title: Text(l10n.clear_translation_cache),
      subtitle: Text(l10n.translation_cache_entries(_entryCount)),
      trailing: const Icon(Icons.delete_outline),
      onTap: () async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.clear_translation_cache),
            content: Text(l10n.clear_translation_cache_tip),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.ok),
              ),
            ],
          ),
        );
        if (confirmed == true) {
          await TranslationCacheService.instance.clear();
          if (mounted) {
            setState(() => _entryCount = 0);
            showBriefSnackBar(context, l10n.translation_cache_cleared);
          }
        }
      },
    );
  }
}

class _TranslationConfigFields extends ConsumerStatefulWidget {
  @override
  ConsumerState<_TranslationConfigFields> createState() =>
      _TranslationConfigFieldsState();
}

class _TranslationConfigFieldsState
    extends ConsumerState<_TranslationConfigFields> {
  late final TextEditingController _urlController;
  late final TextEditingController _keyController;
  late final TextEditingController _manualModelController;
  List<String> _modelList = [];
  bool _fetchingModels = false;
  bool _manualModelInput = false;
  bool _obscureKey = true;

  @override
  void initState() {
    super.initState();
    final settings = ref.read(settingsProvider);
    _urlController = TextEditingController(text: settings.translationApiUrl);
    _keyController = TextEditingController(text: settings.translationApiKey);
    _manualModelController = TextEditingController(
      text: settings.translationModel,
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    _keyController.dispose();
    _manualModelController.dispose();
    super.dispose();
  }

  String _resolveBaseUrl() {
    final settings = ref.read(settingsProvider);
    if (settings.translationProvider == TranslationProvider.custom) {
      return settings.translationApiUrl;
    }
    return settings.translationProvider.baseUrl;
  }

  Future<void> _fetchModels() async {
    final apiKey = ref.read(settingsProvider).translationApiKey;
    final baseUrl = _resolveBaseUrl();
    if (apiKey.isEmpty || baseUrl.isEmpty) {
      return;
    }

    setState(() => _fetchingModels = true);
    try {
      final models = await LlmTranslator.fetchModels(
        apiKey: apiKey,
        baseUrl: baseUrl,
      );
      if (mounted) {
        setState(() {
          _modelList = models;
          _manualModelInput = false;
        });
      }
    } catch (e) {
      logger.e('fetchModels error: $e');
      if (mounted) {
        showBriefSnackBar(context, L10n.of(context).fetch_models_failed);
      }
    } finally {
      if (mounted) {
        setState(() => _fetchingModels = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final settings = ref.watch(settingsProvider);
    final provider = settings.translationProvider;
    final currentModel = settings.translationModel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<TranslationProvider>(
            initialValue: provider,
            decoration: InputDecoration(
              labelText: l10n.translation_provider,
              isDense: true,
            ),
            items: TranslationProvider.values.map((p) {
              final label = p == TranslationProvider.custom
                  ? l10n.custom_provider
                  : p.label;
              return DropdownMenuItem(value: p, child: Text(label));
            }).toList(),
            onChanged: (v) {
              if (v == null) {
                return;
              }
              ref.read(settingsProvider.notifier).setTranslationProvider(v);
              if (v != TranslationProvider.custom && currentModel.isEmpty) {
                ref
                    .read(settingsProvider.notifier)
                    .setTranslationModel(v.defaultModel);
              }
              setState(() {
                _modelList = [];
                _manualModelInput = false;
              });
            },
          ),
          const SizedBox(height: 8),
          if (provider == TranslationProvider.custom) ...[
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: l10n.translation_api_url,
                hintText: 'https://api.example.com',
                isDense: true,
              ),
              onChanged: (v) {
                ref
                    .read(settingsProvider.notifier)
                    .setTranslationApiUrl(v.trim());
              },
            ),
            const SizedBox(height: 8),
          ],
          TextField(
            controller: _keyController,
            decoration: InputDecoration(
              labelText: l10n.translation_api_key,
              hintText: 'sk-...',
              isDense: true,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureKey ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                ),
                onPressed: () => setState(() => _obscureKey = !_obscureKey),
              ),
            ),
            obscureText: _obscureKey,
            onChanged: (v) {
              ref
                  .read(settingsProvider.notifier)
                  .setTranslationApiKey(v.trim());
            },
          ),
          const SizedBox(height: 8),
          if (_manualModelInput)
            TextField(
              controller: _manualModelController,
              decoration: InputDecoration(
                labelText: l10n.translation_model,
                isDense: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.list, size: 20),
                  onPressed: () {
                    setState(() => _manualModelInput = false);
                  },
                ),
              ),
              onChanged: (v) {
                ref
                    .read(settingsProvider.notifier)
                    .setTranslationModel(v.trim());
              },
            )
          else
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _modelList.contains(currentModel)
                        ? currentModel
                        : null,
                    decoration: InputDecoration(
                      labelText: l10n.translation_model,
                      isDense: true,
                      hintText: currentModel.isNotEmpty
                          ? currentModel
                          : provider.defaultModel,
                    ),
                    items: [
                      ..._modelList.map(
                        (m) => DropdownMenuItem(value: m, child: Text(m)),
                      ),
                      DropdownMenuItem<String>(
                        value: '\x00_manual',
                        child: Text(
                          l10n.manual_input,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (v) {
                      if (v == '\x00_manual') {
                        setState(() => _manualModelInput = true);
                        _manualModelController.text = currentModel;
                        return;
                      }
                      if (v != null) {
                        ref
                            .read(settingsProvider.notifier)
                            .setTranslationModel(v);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                if (_fetchingModels)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _fetchModels,
                    tooltip: l10n.fetch_models,
                  ),
              ],
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
