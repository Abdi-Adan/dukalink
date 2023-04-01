import 'package:dukalink/domain/value_objects/app_constants.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

ScaffoldMessengerState launchSnackbar({
  required BuildContext context,
  required String message,
  required SnackbarType type,
  required String dismissText,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: type.color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: kShortSnackBarDuration),
        action: SnackBarAction(
          label: dismissText,
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        onVisible: () {},
      ),
    );
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
        return DukalinkThemes.primaryColor;
    }
  }
}
