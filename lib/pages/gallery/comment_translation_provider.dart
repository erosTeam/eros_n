import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/translate_helper.dart';
import 'package:eros_n/utils/translation/translation_cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_translation_provider.g.dart';

@Riverpod(keepAlive: true)
class CommentTranslationNotifier extends _$CommentTranslationNotifier {
  final Set<int> _loading = {};
  int _revision = 0;

  @override
  int build() => 0;

  bool isLoading(int commentId) => _loading.contains(commentId);

  String? getTranslation(String text, String targetLang) {
    return TranslationCacheService.instance.get(text, targetLang);
  }

  Future<void> translate(
    int commentId,
    String text, {
    bool force = false,
  }) async {
    final targetLang = getTargetLanguage(ref.read(settingsProvider).localeCode);
    if (!force &&
        TranslationCacheService.instance.get(text, targetLang) != null) {
      return;
    }
    if (_loading.contains(commentId)) {
      return;
    }

    _loading.add(commentId);
    state = ++_revision;

    try {
      await performTranslation(ref, text, targetLang, force: force);
    } catch (e) {
      logger.e('All translation layers failed: $e');
    } finally {
      _loading.remove(commentId);
      state = ++_revision;
    }
  }
}
