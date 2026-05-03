import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/translation_service.dart';
import 'package:translator/translator.dart' as gt;

class GoogleTranslateService implements TranslationService {
  final _translator = gt.GoogleTranslator();

  static const _langMapping = {'zh': 'zh-cn'};

  @override
  Future<String> translate(
    String text, {
    String from = 'auto',
    String to = 'zh',
  }) async {
    try {
      final mappedTo = _langMapping[to] ?? to;
      final mappedFrom = _langMapping[from] ?? from;
      final result = await _translator.translate(
        text,
        from: mappedFrom,
        to: mappedTo,
      );
      return result.text;
    } catch (e) {
      logger.e('GoogleTranslateService error: $e');
      rethrow;
    }
  }
}
