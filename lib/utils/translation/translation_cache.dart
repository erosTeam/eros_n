import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

const String _boxName = 'translation_cache';
const Duration _defaultTtl = Duration(days: 7);

class TranslationCacheService {
  TranslationCacheService._();
  static final TranslationCacheService instance = TranslationCacheService._();

  late Box<String> _box;
  final Map<String, _CacheEntry> _mem = {};

  Future<void> init() async {
    _box = await Hive.openBox<String>(
      _boxName,
      compactionStrategy: (int entries, int deletedEntries) {
        return deletedEntries > 100;
      },
    );
  }

  static String _key(String text, String lang) {
    return '${text.hashCode.toRadixString(36)}_$lang';
  }

  String? get(String text, String targetLang) {
    final key = _key(text, targetLang);

    final memEntry = _mem[key];
    if (memEntry != null) {
      if (!memEntry.isExpired) {
        return memEntry.result;
      }
      _mem.remove(key);
    }

    final raw = _box.get(key);
    if (raw != null) {
      try {
        final map = jsonDecode(raw) as Map<String, dynamic>;
        final entry = _CacheEntry(
          result: map['r'] as String,
          timestamp: map['t'] as int,
        );
        if (!entry.isExpired) {
          _mem[key] = entry;
          return entry.result;
        }
      } catch (_) {}
      _box.delete(key);
    }

    return null;
  }

  Future<void> put(String text, String targetLang, String result) async {
    final key = _key(text, targetLang);
    final entry = _CacheEntry(
      result: result,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );
    _mem[key] = entry;
    await _box.put(key, jsonEncode({'r': entry.result, 't': entry.timestamp}));
  }

  Future<void> clear() async {
    _mem.clear();
    await _box.clear();
  }

  int get entryCount => _box.length;
}

class _CacheEntry {
  _CacheEntry({required this.result, required this.timestamp});
  final String result;
  final int timestamp;

  bool get isExpired {
    final age = DateTime.now().millisecondsSinceEpoch - timestamp;
    return age > _defaultTtl.inMilliseconds;
  }
}
