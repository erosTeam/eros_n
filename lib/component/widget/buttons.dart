import 'package:eros_n/common/enum.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../utils/logger.dart';

typedef AsyncValueChanged<T> = Future<void> Function(T value);

class SortPopupButton extends StatefulWidget {
  const SortPopupButton({
    super.key,
    required this.onSelected,
    this.initValue = SearchSort.recent,
    this.iconSize,
  });

  final AsyncValueChanged<SearchSort> onSelected;
  final SearchSort initValue;
  final double? iconSize;

  @override
  State<SortPopupButton> createState() => _SortPopupButtonState();
}

class _SortPopupButtonState extends State<SortPopupButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final sortMap = {
      SearchSort.recent: L10n.of(context).recent,
      SearchSort.popularToday: L10n.of(context).popular_today,
      SearchSort.popularWeek: L10n.of(context).popular_week,
      SearchSort.popularMonth: L10n.of(context).popular_month,
      SearchSort.popular: L10n.of(context).popular,
    };

    logger.d('loading $loading');

    final indicatorSize =
        (widget.iconSize ?? Theme.of(context).iconTheme.size ?? 24.0) * 0.8;

    return PopupMenuButton<SearchSort>(
      onSelected: (val) async {
        try {
          setState(() {
            loading = true;
          });
          await widget.onSelected(val);
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      enabled: !loading,
      padding: EdgeInsets.zero,
      icon: loading
          ? SizedBox(
              width: indicatorSize,
              height: indicatorSize,
              child: const CircularProgressIndicator(strokeWidth: 3),
            )
          : const Icon(Icons.sort),
      iconSize: widget.iconSize,
      offset: const Offset(0, kToolbarHeight),
      color: Theme.of(context).colorScheme.onInverseSurface,
      initialValue: widget.initValue,
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
class LanguagesFilterPopupButton extends StatefulWidget {
  const LanguagesFilterPopupButton({
    super.key,
    required this.onSelected,
    this.initValue = LanguagesFilter.all,
    this.iconSize,
  });

  final AsyncValueChanged<LanguagesFilter> onSelected;
  final LanguagesFilter initValue;
  final double? iconSize;

  @override
  State<LanguagesFilterPopupButton> createState() =>
      _LanguagesFilterPopupButtonState();
}

class _LanguagesFilterPopupButtonState
    extends State<LanguagesFilterPopupButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final languagesMap = {
      LanguagesFilter.all: L10n.of(context).all,
      LanguagesFilter.japanese: L10n.of(context).japanese,
      LanguagesFilter.chinese: L10n.of(context).chinese,
      LanguagesFilter.english: L10n.of(context).english,
      LanguagesFilter.translated: L10n.of(context).translated,
    };

    final indicatorSize =
        (widget.iconSize ?? Theme.of(context).iconTheme.size ?? 24.0) * 0.8;

    return PopupMenuButton<LanguagesFilter>(
      onSelected: (val) async {
        try {
          setState(() {
            loading = true;
          });
          await widget.onSelected(val);
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      padding: EdgeInsets.zero,
      icon: loading
          ? SizedBox(
              width: indicatorSize,
              height: indicatorSize,
              child: const CircularProgressIndicator(strokeWidth: 3),
            )
          : const Icon(Icons.language),
      iconSize: widget.iconSize,
      offset: const Offset(0, kToolbarHeight),
      color: Theme.of(context).colorScheme.onInverseSurface,
      initialValue: widget.initValue,
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
