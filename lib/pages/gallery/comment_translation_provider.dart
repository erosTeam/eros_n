import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/config/builtin_config.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/google_translator.dart';
import 'package:eros_n/utils/translation/llm_translator.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_translation_provider.g.dart';

@riverpod
class CommentTranslationNotifier extends _$CommentTranslationNotifier {
  final Map<int, String> _cache = {};
  final Set<int> _loading = {};

  @override
  Map<int, String> build() => {};

  String _targetLanguage() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final code = locale.languageCode;
    if (code == 'zh') {
      return 'zh';
    }
    return code;
  }

  bool isLoading(int commentId) => _loading.contains(commentId);

  String? getTranslation(int commentId) => _cache[commentId];

  Future<void> translate(int commentId, String text) async {
    if (_cache.containsKey(commentId) || _loading.contains(commentId)) {
      return;
    }

    _loading.add(commentId);
    state = Map.of(_cache);

    final settings = ref.read(settingsProvider);
    final targetLang = _targetLanguage();

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
        final result = await translator.translate(text, to: targetLang);
        _cache[commentId] = result;
        _loading.remove(commentId);
        state = Map.of(_cache);
        return;
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
        final result = await translator.translate(text, to: targetLang);
        _cache[commentId] = result;
        _loading.remove(commentId);
        state = Map.of(_cache);
        return;
      } catch (e) {
        logger.w('Built-in LLM translation failed, falling back to Google: $e');
      }
    }

    // Layer 3: Google Translate fallback
    try {
      final translator = GoogleTranslateService();
      final result = await translator.translate(text, to: targetLang);
      _cache[commentId] = result;
    } catch (e) {
      logger.e('All translation layers failed: $e');
    } finally {
      _loading.remove(commentId);
      state = Map.of(_cache);
    }
  }
}
