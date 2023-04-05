import 'package:dukalink_app/shared/utils/toast_utils.dart';
import 'package:dukalink_app/shared/widgets/custom_snackbars.dart';
import 'package:flutter/material.dart';

DateTime? backButtonPressTime;
Future<bool> handleWillPop(context) async {
  final now = DateTime.now();
  final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
      backButtonPressTime == null ||
          now.difference(backButtonPressTime!) > const Duration(seconds: 3);

  if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
    backButtonPressTime = now;
    launchSnackbar(
      context: context,
      message: 'Press again to exit app',
      okCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      type: SnackbarType.info,
      dismissText: 'OKAY',
    );

    return false;
  }
  return true;
}
