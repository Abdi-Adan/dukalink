import 'dart:async';
import 'package:dukalink/application/redux/actions/enter_otp_action.dart';
import 'package:dukalink/application/redux/actions/update_user_state_action.dart';
import 'package:dukalink/application/redux/misc/flags.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/value_objects/app_constants.dart';
import 'package:dukalink/domain/value_objects/app_error_strings.dart';
import 'package:dukalink/infrastructure/remote_repository/users/firebase_auth.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhoneAction extends ReduxAction<AppState> {
  VerifyPhoneAction({
    required this.context,
    required this.phoneNumber,
  });

  final BuildContext context;
  final String phoneNumber;

  @override
  Future<void> before() async {
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
    // todo: check internet connectivity
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    await globalFirebaseAuthInstance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        launchSnackbar(
            context: context,
            message: e.message.toString(),
            type: SnackbarType.error,
            dismissText: 'Ok');
      },
      codeSent: (String verificationId, int? resendToken) async {
        await dispatch(
          EnterOtpAction(
            context: context,
            resendToken: resendToken,
            verificationId: verificationId,
          ),
        );
        Future.delayed(const Duration(milliseconds: 600));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        launchSnackbar(
            context: context,
            message: autoCodeResolutionError,
            type: SnackbarType.error,
            dismissText: 'Ok');
      },
      timeout: thirtySeconds,
    );

    dispatch(
      UpdateUserStateAction(
        isSignedIn: false,
        phoneNumber: phoneNumber,
      ),
    );

    return null;
  }

  // @override
  // Object wrapError(dynamic error) async {
  //   if (error.runtimeType == UserException) {
  //     launchSnackbar(
  //         context: context,
  //         message: error.message.toString(),
  //         type: SnackbarType.error,
  //         dismissText: 'Ok');
  //     return error;
  //   }
  //   return error;
  // }
}
