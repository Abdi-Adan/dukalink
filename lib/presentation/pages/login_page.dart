import 'package:dukalink/application/redux/actions/verify_phone_action.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/value_objects/app_spaces.dart';
import 'package:dukalink/domain/value_objects/app_strings.dart';
import 'package:dukalink/presentation/widgets/atomic/login_title.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_snackbars.dart';
import 'package:dukalink/presentation/widgets/molecular/keyboard_scaffold.dart';
import 'package:dukalink/presentation/widgets/molecular/login_phone_field.dart';
import 'package:dukalink/presentation/widgets/molecular/progressive_button.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  late TextEditingController phoneNumberController;

  String initialCountryCode = 'KE';

  String phone = "";
  String isoCode = "";
  late bool isValid;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    phoneNumberController.text = '';
    isValid = false;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardScaffold(
      trailingActionIcon: Icons.admin_panel_settings,
      isSecondary: false,
      keyboardController: phoneNumberController,
      childWidgets: [
        ...titles(
          context: context,
          extraHeading: 'We will send you a confirmation code to verify you.',
          subtitle: 'mobile number',
          title: 'Enter your \n',
        ),
        vSize10SizedBox,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Form(
            key: _formKey,
            child: PhoneLoginField(
              phoneNumberController: phoneNumberController,
              onChanged: (String v) {
                setState(() {
                  phoneNumberController.text = v;
                });
              },
            ),
          ),
        ),
        ProgressiveButton(
          onPressed: () {
            if (phoneNumberController.text.length >= 10 &&
                (phoneNumberController.text.startsWith('+254') ||
                    phoneNumberController.text.startsWith('07'))) {
              StoreProvider.dispatch<AppState>(
                context,
                VerifyPhoneAction(
                    phoneNumber: phoneNumberController.text, context: context),
              );
            } else {
              launchSnackbar(
                  context: context,
                  message: invalidPhoneNumberPrompt,
                  type: SnackbarType.error,
                  dismissText: 'Ok');
            }
          },
        ),
      ],
    );
  }
}
