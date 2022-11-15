import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

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
                    textScaleFactor: 1.0,
                    style: Theme.of(context).textTheme.bodySmall,
                    softWrap: true,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  icon,
                  size: 18,
                ),
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
