import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/setting/setting_base.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/llm_translator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_by_default/open_by_default.dart';

@RoutePage()
class GeneralSettingPage extends ConsumerWidget {
  const GeneralSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glass = isLiquidGlass(ref);
    return Scaffold(
      extendBodyBehindAppBar: glass,
      appBar: adaptiveAppBar(
        context: context,
        ref: ref,
        title: Text(L10n.of(context).general),
      ),
      body: ListView(
        padding: glass ? glassBodyPadding(context) : null,
        children: [
          // switch language
          Consumer(
            builder: (context, ref, child) {
              final localeCode = ref.watch(
                settingsProvider.select((settings) => settings.localeCode),
              );

              final radioTitleMap = {'': Text(L10n.of(context).system)};

              final radioTitleMapFromSupported = L10n.delegate.supportedLocales
                  .asMap()
                  .map((key, value) {
                    final code =
                        '${value.languageCode}_${value.countryCode ?? ''}';
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
            },
          ),
          // siwtch hideBottomNavigationOnScroll
          Consumer(
            builder: (context, ref, child) {
              final hideBottomNavigationOnScroll = ref.watch(
                settingsProvider.select(
                  (settings) => settings.hideBottomNavigationOnScroll,
                ),
              );

              return SwitchListTile(
                title: Text(L10n.of(context).hide_bottom_navigation_on_scroll),
                value: hideBottomNavigationOnScroll,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setHideBottomNavigationOnScroll(value);
                },
              );
            },
          ),
          // switch clipboardDetection
          Consumer(
            builder: (context, ref, child) {
              final clipboardDetection = ref.watch(
                settingsProvider.select(
                  (settings) => settings.clipboardDetection,
                ),
              );

              return SwitchListTile(
                title: Text(L10n.of(context).clipboard_detection),
                value: clipboardDetection,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setClipboardDetection(value);
                },
              );
            },
          ),

          // switch doubleBackToExit
          Consumer(
            builder: (context, ref, child) {
              final doubleBackToExit = ref.watch(
                settingsProvider.select(
                  (settings) => settings.doubleBackToExit,
                ),
              );

              return SwitchListTile(
                title: Text(L10n.of(context).double_back_to_exit),
                value: doubleBackToExit,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setDoubleBackToExit(value);
                },
              );
            },
          ),

          const Divider(),

          Consumer(
            builder: (context, ref, child) {
              final commentTranslation = ref.watch(
                settingsProvider.select(
                  (settings) => settings.commentTranslation,
                ),
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: Text(L10n.of(context).comment_translation),
                    value: commentTranslation,
                    onChanged: (value) {
                      ref
                          .read(settingsProvider.notifier)
                          .setCommentTranslation(value);
                    },
                  ),
                  if (commentTranslation) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        L10n.of(context).translation_service_config,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        L10n.of(context).translation_hint,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _TranslationConfigFields(),
                  ],
                ],
              );
            },
          ),

          // open_supported_links (Android only)
          if (defaultTargetPlatform == TargetPlatform.android)
            ListTile(
              title: Text(L10n.of(context).open_supported_links),
              subtitle: Text(L10n.of(context).open_supported_links_tip),
              onTap: OpenByDefault.open,
            ),
        ],
      ),
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(L10n.of(context).fetch_models_failed)),
        );
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
              return DropdownMenuItem(value: p, child: Text(p.label));
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
