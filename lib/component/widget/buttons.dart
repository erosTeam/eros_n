import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/enum.dart';
import 'package:flutter/material.dart';

class SortPopupButton extends StatelessWidget {
  const SortPopupButton({
    super.key,
    required this.onSelected,
    this.initValue = SearchSort.recent,
    this.iconSize,
  });

  final ValueChanged<SearchSort> onSelected;
  final SearchSort initValue;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final sortMap = {
      SearchSort.recent: L10n.of(context).recent,
      SearchSort.popularToday: L10n.of(context).popular_today,
      SearchSort.popularWeek: L10n.of(context).popular_week,
      SearchSort.popular: L10n.of(context).popular,
    };

    return PopupMenuButton<SearchSort>(
      onSelected: onSelected,
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.sort),
      iconSize: iconSize,
      offset: const Offset(0, kToolbarHeight),
      color: Theme.of(context).colorScheme.onInverseSurface,
      initialValue: initValue,
      itemBuilder: (context) => sortMap.entries
          .map(
            (e) => PopupMenuItem<SearchSort>(
              value: e.key,
              child: Text(
                e.value,
              ),
            ),
          )
          .toList(),
    );
  }
}

// LanguagesFilterPopupButton
class LanguagesFilterPopupButton extends StatelessWidget {
  const LanguagesFilterPopupButton({
    super.key,
    required this.onSelected,
    this.initValue = LanguagesFilter.all,
    this.iconSize,
  });

  final ValueChanged<LanguagesFilter> onSelected;
  final LanguagesFilter initValue;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final languagesMap = {
      LanguagesFilter.all: L10n.of(context).all,
      LanguagesFilter.japanese: L10n.of(context).japanese,
      LanguagesFilter.chinese: L10n.of(context).chinese,
      LanguagesFilter.english: L10n.of(context).english,
      LanguagesFilter.translated: L10n.of(context).translated,
    };

    return PopupMenuButton<LanguagesFilter>(
      onSelected: onSelected,
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.language),
      iconSize: iconSize,
      offset: const Offset(0, kToolbarHeight),
      color: Theme.of(context).colorScheme.onInverseSurface,
      initialValue: initValue,
      itemBuilder: (context) => languagesMap.entries
          .map(
            (e) => PopupMenuItem<LanguagesFilter>(
              value: e.key,
              child: Text(
                e.value,
              ),
            ),
          )
          .toList(),
    );
  }
}
