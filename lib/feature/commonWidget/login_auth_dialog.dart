import 'package:dukalink_app/feature/commonWidget/auth_login.dart';
import 'package:flutter/material.dart';

Future loginDialog(BuildContext context) async {
  return showDialog<bool>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return
            // AlertDialog(
            // content:
            const LoginDialogScreen();
        // );
      });
}
