import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/translation/translate_helper.dart';
import 'package:eros_n/utils/translation/translation_cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'title_translation_provider.g.dart';

@Riverpod(keepAlive: true)
class TitleTranslationNotifier extends _$TitleTranslationNotifier {
  final Set<String> _loading = {};
  int _revision = 0;

  @override
  int build() => 0;

  bool isLoading(String key) => _loading.contains(key);

  String? getTranslation(String text, String targetLang) {
    return TranslationCacheService.instance.get(text, targetLang);
  }

  static String mainKey(int gid) => '$gid';
  static String subKey(int gid) => '${gid}_sub';

  Future<void> translate(String key, String text, {bool force = false}) async {
    final targetLang = getTargetLanguage();
    if (!force &&
        TranslationCacheService.instance.get(text, targetLang) != null) {
      return;
    }
    if (_loading.contains(key)) {
      return;
    }

    _loading.add(key);
    state = ++_revision;

    try {
      await performTranslation(ref, text, targetLang, force: force);
    } catch (e) {
      logger.e('Title translation failed: $e');
    } finally {
      _loading.remove(key);
      state = ++_revision;
    }
  }
}
