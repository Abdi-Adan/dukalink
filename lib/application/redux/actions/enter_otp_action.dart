import 'dart:async';
import 'package:dukalink/application/redux/misc/flags.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

class EnterOtpAction extends ReduxAction<AppState> {
  final String verificationId;
  final int? resendToken;
  final BuildContext context;

  EnterOtpAction({
    required this.verificationId,
    required this.resendToken,
    required this.context,
  });

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(phoneLoginStateFlag));
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginStateFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    // dispatch(
    //   UpdateUserStateAction(
    //     isSignedIn: false,
    //     pinCodeVerificationID: verificationId,
    //     hasDoneTour: true,
    //   ),
    // );

    dispatch(NavigateAction.pushNamed(verifyPhonePageRoute));

    return store.state;
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
