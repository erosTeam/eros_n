import 'package:eros_n/generated/l10n.dart';
import 'package:flutter/material.dart';

class SmallTitle extends StatelessWidget {
  const SmallTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 6),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class RadioDialogListTile<T> extends StatelessWidget {
  const RadioDialogListTile(
      {Key? key,
      this.title,
      this.subtitle,
      this.onChanged,
      this.dialogTitle,
      this.groupValue,
      required this.radioTitleMap})
      : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final ValueChanged<T>? onChanged;
  final Widget? dialogTitle;
  final T? groupValue;
  final Map<T, Widget> radioTitleMap;

  @override
  Widget build(BuildContext context) {
    void onChanged(T? value) {
      if (value != null) {
        this.onChanged?.call(value);
        Navigator.of(context).pop();
      }
    }

    final children = radioTitleMap.entries
        .map((e) => RadioListTile<T>(
              title: e.value,
              value: e.key,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Theme.of(context).colorScheme.primary,
            ))
        .toList();

    return ListTile(
      title: title,
      subtitle: subtitle ?? radioTitleMap[groupValue],
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.only(top: 16),
              title: dialogTitle ?? title,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(L10n.of(context).cancel),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
