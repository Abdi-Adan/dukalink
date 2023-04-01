import 'dart:async';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/value_objects/app_spaces.dart';
import 'package:dukalink/domain/value_objects/app_strings.dart';
import 'package:dukalink/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:dukalink/presentation/widgets/atomic/login_title.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_snackbars.dart';
import 'package:dukalink/presentation/widgets/molecular/keyboard_scaffold.dart';
import 'package:dukalink/presentation/widgets/molecular/progressive_button.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerifyPage extends StatefulWidget {
  const PhoneVerifyPage({super.key});

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  TextEditingController otpPinCodeFieldController = TextEditingController();
  StreamController errorAnimationController = StreamController();
  FocusNode otpPinCodeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dukalinkFirebaseAuth = DukalinkFirebaseAuth();

    return StoreConnector(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState state) {
          return KeyboardScaffold(
            isSecondary: true,
            trailingActionIcon: Icons.textsms,
            keyboardController: otpPinCodeFieldController,
            childWidgets: [
              ...titles(
                context: context,
                title: 'Enter code sent \n',
                subtitle: 'to your number.',
                extraHeading: 'We sent it to ${state.userState!.phoneNumber}',
              ),
              vSize20SizedBox,
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Text(
                    "Enter 6 digits code",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: PinCodeTextField(
                    autoFocus: true,
                    focusNode: otpPinCodeFocusNode,
                    useHapticFeedback: true,
                    hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: DukalinkThemes.primaryColor,
                      inactiveColor: DukalinkThemes.orange,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      errorBorderColor: Colors.red,
                      selectedColor: DukalinkThemes.orange,
                    ),
                    cursorColor: DukalinkThemes.orange,
                    keyboardType: TextInputType.none,
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    controller: otpPinCodeFieldController,
                    onCompleted: (v) async {
                      if (otpPinCodeFieldController.text.length >= 6) {
                        dukalinkFirebaseAuth.verifyOtp(
                            otpPinCodeFieldController.text, context, state,
                            isSignedIn: state.userState!.isSignedIn);
                      } else {
                        launchSnackbar(
                            context: context,
                            message: invalidOTPPrompt,
                            type: SnackbarType.error,
                            dismissText: 'Ok');
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        otpPinCodeFieldController.text = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      // ignore: avoid_print
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),
              ),
              vSize20SizedBox,
              ProgressiveButton(
                onPressed: () {
                  if (otpPinCodeFieldController.text.length >= 6) {
                    dukalinkFirebaseAuth.verifyOtp(
                        otpPinCodeFieldController.text, context, state,
                        isSignedIn: state.userState!.isSignedIn);
                  } else {
                    launchSnackbar(
                        context: context,
                        message: invalidOTPPrompt,
                        type: SnackbarType.error,
                        dismissText: 'Ok');
                  }
                },
              ),
            ],
          );
        });
  }
}
