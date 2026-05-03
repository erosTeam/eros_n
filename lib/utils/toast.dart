import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// Brief MD3 SnackBar for lightweight feedback (gesture hints, state changes).
void showBriefSnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(milliseconds: 1200),
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        behavior: SnackBarBehavior.fixed,
        showCloseIcon: false,
      ),
    );
}

void showSimpleToast(
  String msg, {
  Duration? displayTime,
  Future<bool> Function()? onBack,
}) {
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    useAnimation: true,
    displayTime: displayTime ?? 1500.milliseconds,
    usePenetrate: true,
    clickMaskDismiss: false,
    onBack: onBack,
    maskColor: Colors.transparent,
    builder: (context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(16),
        type: MaterialType.card,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            msg,
            textScaler: TextScaler.noScaling,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    ),
  );
}

void showActionToast(String msg, {IconData? icon, VoidCallback? onPressed}) {
  SmartDialog.show(
    alignment: Alignment.bottomCenter,
    useAnimation: true,
    displayTime: 5.seconds,
    // consumeEvent: true,
    usePenetrate: true,
    clickMaskDismiss: false,
    maskColor: Colors.transparent,
    builder: (context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(16),
        type: MaterialType.card,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    msg,
                    textScaler: TextScaler.noScaling,
                    style: Theme.of(context).textTheme.bodySmall,
                    softWrap: true,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(icon, size: 18),
                padding: const EdgeInsets.only(left: 28),
                onPressed: () {
                  SmartDialog.dismiss();
                  onPressed?.call();
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
