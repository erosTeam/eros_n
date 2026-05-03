import 'package:dart_openai/dart_openai.dart';
import 'package:eros_n/utils/logger.dart';

import 'package:eros_n/utils/translation/translation_service.dart';

String _stripVersionSuffix(String url) {
  final stripped = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  if (stripped.endsWith('/v1')) {
    return stripped.substring(0, stripped.length - 3);
  }
  return stripped;
}

class LlmTranslator implements TranslationService {
  LlmTranslator({
    required this.apiKey,
    required this.baseUrl,
    required this.model,
  });
  final String apiKey;
  final String baseUrl;
  final String model;

  static Future<List<String>> fetchModels({
    required String apiKey,
    required String baseUrl,
  }) async {
    final savedBaseUrl = OpenAI.baseUrl;
    try {
      OpenAI.apiKey = apiKey;
      if (baseUrl.isNotEmpty) {
        OpenAI.baseUrl = _stripVersionSuffix(baseUrl);
      }
      OpenAI.showLogs = false;

      final models = await OpenAI.instance.model.list();
      return models.map((m) => m.id).toList()..sort();
    } finally {
      OpenAI.baseUrl = savedBaseUrl;
    }
  }

  static const _langNames = {
    'zh-CN': 'Simplified Chinese',
    'zh-TW': 'Traditional Chinese',
  };

  @override
  Future<String> translate(
    String text, {
    String from = 'auto',
    String to = 'zh-CN',
  }) async {
    final savedBaseUrl = OpenAI.baseUrl;
    try {
      OpenAI.apiKey = apiKey;
      if (baseUrl.isNotEmpty) {
        OpenAI.baseUrl = _stripVersionSuffix(baseUrl);
      }
      OpenAI.showLogs = false;

      final langName = _langNames[to] ?? to;
      final systemPrompt =
          'You are a translator. Translate the following text to $langName. '
          'Output ONLY the translated text, no explanations.';

      final response = await OpenAI.instance.chat.create(
        model: model,
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.system,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                systemPrompt,
              ),
            ],
          ),
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(text),
            ],
          ),
        ],
        temperature: 0.3,
        maxTokens: 2048,
      );

      final result = response.choices.first.message.content?.first.text;
      if (result == null || result.isEmpty) {
        throw Exception('LLM returned empty response');
      }
      return result.trim();
    } catch (e) {
      logger.e('LlmTranslator error: $e');
      rethrow;
    } finally {
      OpenAI.baseUrl = savedBaseUrl;
    }
  }
}
