import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/config/builtin_config.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/google_translator.dart';
import 'package:eros_n/utils/translation/llm_translator.dart';
import 'package:eros_n/utils/translation/translation_cache.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

String getTargetLanguage() {
  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  final code = locale.languageCode;
  if (code == 'zh') {
    return 'zh';
  }
  return code;
}

/// Three-layer fallback translation with two-tier cache (memory + Hive).
Future<String> performTranslation(
  Ref ref,
  String text,
  String targetLang, {
  bool force = false,
}) async {
  final cache = TranslationCacheService.instance;
  if (!force) {
    final cached = cache.get(text, targetLang);
    if (cached != null) {
      return cached;
    }
  }

  final result = await _callTranslationApi(ref, text, targetLang);
  await cache.put(text, targetLang, result);
  return result;
}

Future<String> _callTranslationApi(
  Ref ref,
  String text,
  String targetLang,
) async {
  final settings = ref.read(settingsProvider);

  // Skip LLM layers when user prefers Google Translate
  if (settings.useGoogleTranslate) {
    final translator = GoogleTranslateService();
    return await translator.translate(text, to: targetLang);
  }

  final provider = settings.translationProvider;
  final baseUrl = provider == TranslationProvider.custom
      ? settings.translationApiUrl
      : provider.baseUrl;
  final model = settings.translationModel.isNotEmpty
      ? settings.translationModel
      : provider.defaultModel;

  final hasUserApi =
      baseUrl.isNotEmpty &&
      settings.translationApiKey.isNotEmpty &&
      model.isNotEmpty;

  final hasBuiltinKey =
      builtinLlmApiKey.isNotEmpty &&
      builtinLlmApiUrl.isNotEmpty &&
      builtinLlmModel.isNotEmpty;

  // Layer 1: User-configured LLM API
  if (hasUserApi) {
    try {
      final translator = LlmTranslator(
        apiKey: settings.translationApiKey,
        baseUrl: baseUrl,
        model: model,
      );
      return await translator.translate(text, to: targetLang);
    } catch (e) {
      logger.w('User LLM translation failed, trying next layer: $e');
    }
  }

  // Layer 2: Built-in LLM key
  if (hasBuiltinKey) {
    try {
      final translator = LlmTranslator(
        apiKey: builtinLlmApiKey,
        baseUrl: builtinLlmApiUrl,
        model: builtinLlmModel,
      );
      return await translator.translate(text, to: targetLang);
    } catch (e) {
      logger.w('Built-in LLM translation failed, falling back to Google: $e');
    }
  }

  // Layer 3: Google Translate fallback
  final translator = GoogleTranslateService();
  return await translator.translate(text, to: targetLang);
}
