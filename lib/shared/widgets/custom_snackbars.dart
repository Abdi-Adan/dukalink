import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';

ScaffoldMessengerState launchSnackbar({
  required BuildContext context,
  required String message,
  required Function okCallback,
  required SnackbarType type,
  required String dismissText,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: type.color,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: dismissText,
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        onPressed: () {
          okCallback();
        },
      ),
      onVisible: () {},
    ));
}

enum SnackbarType { info, success, error }

extension SnackbarColor on SnackbarType {
  Color get color {
    switch (this) {
      case SnackbarType.info:
        return Colors.orange;
      case SnackbarType.success:
        return Colors.green;
      case SnackbarType.error:
        return Colors.red;
      default:
        return Palette.dukalinkPrimary1;
    }
  }
}
