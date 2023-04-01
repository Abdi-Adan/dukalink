import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class ProgressiveButton extends StatelessWidget {
  final Function onPressed;

  const ProgressiveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ProgressButton.icon(
          iconedButtons: const {
            ButtonState.idle: IconedButton(
              text: "Verify",
              icon: Icon(Icons.send, color: Colors.white),
              color: DukalinkThemes.primaryColor,
            ),
            ButtonState.loading: IconedButton(
              text: "Loading",
              color: DukalinkThemes.primaryColor,
            ),
            ButtonState.fail: IconedButton(
              text: "Failed",
              icon: Icon(Icons.cancel, color: Colors.white),
              color: Colors.red,
            ),
            ButtonState.success: IconedButton(
              text: "Success",
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green,
            )
          },
          onPressed: onPressed,
          state: ButtonState.idle,
          radius: 5.0,
        ),
      ),
    );
  }
}
