import 'dart:convert';

import 'package:eros_n/store/kv/hive.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_history_provider.g.dart';

const int _kMaxHistory = 50;
const String _kSearchHistoryKey = 'search_history';

class SearchHistoryEntry {
  const SearchHistoryEntry({required this.query, required this.usedAt});

  factory SearchHistoryEntry.fromJson(Map<String, dynamic> json) =>
      SearchHistoryEntry(
        query: json['q'] as String? ?? '',
        usedAt: json['t'] as int? ?? 0,
      );

  final String query;
  final int usedAt;

  Map<String, dynamic> toJson() => {'q': query, 't': usedAt};
}

@Riverpod(keepAlive: true)
class SearchHistory extends _$SearchHistory {
  final HiveHelper _hive = HiveHelper();

  @override
  List<SearchHistoryEntry> build() => _read();

  List<SearchHistoryEntry> _read() {
    try {
      final raw = _hive.getString(_kSearchHistoryKey) ?? '';
      if (raw.isEmpty) {
        return const [];
      }
      return (jsonDecode(raw) as List)
          .whereType<Map>()
          .map((e) => SearchHistoryEntry.fromJson(e.cast<String, dynamic>()))
          .where((e) => e.query.trim().isNotEmpty)
          .toList();
    } catch (e) {
      logger.w('load search history failed: $e');
      return const [];
    }
  }

  Future<void> _persist() async {
    try {
      final encoded = jsonEncode(state.map((e) => e.toJson()).toList());
      await _hive.setString(_kSearchHistoryKey, encoded);
    } catch (e) {
      logger.w('persist search history failed: $e');
    }
  }

  Future<void> add(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return;
    }
    final lower = trimmed.toLowerCase();
    final now = DateTime.now().millisecondsSinceEpoch;
    final next = <SearchHistoryEntry>[
      SearchHistoryEntry(query: trimmed, usedAt: now),
      ...state.where((e) => e.query.toLowerCase() != lower),
    ];
    if (next.length > _kMaxHistory) {
      next.removeRange(_kMaxHistory, next.length);
    }
    state = next;
    await _persist();
  }

  Future<void> remove(String query) async {
    state = state.where((e) => e.query != query).toList();
    await _persist();
  }

  Future<void> clear() async {
    state = const [];
    await _persist();
  }
}
