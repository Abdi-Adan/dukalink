// ignore_for_file: use_build_context_synchronously
import 'package:dukalink/application/core/utils.dart';
import 'package:dukalink/application/redux/actions/update_user_state_action.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/domain/models/users/user.dart';
import 'package:dukalink/domain/routes/routes.dart';
import 'package:dukalink/infrastructure/remote_repository/users/firestore_user.dart';
import 'package:dukalink/presentation/widgets/molecular/custom_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

FirebaseAuth globalFirebaseAuthInstance = FirebaseAuth.instance;

class DukalinkFirebaseAuth {
  void verifyOtp(String otpText, BuildContext ctx, AppState state,
      {bool? isSignedIn}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: state.userState!.pinCodeVerificationID ?? '',
      smsCode: otpText,
    );
    final User? user =
        (await globalFirebaseAuthInstance.signInWithCredential(credential))
            .user;

    final User? currentUser = globalFirebaseAuthInstance.currentUser;

    if (user != null && user.uid == currentUser!.uid) {
      var remoteUserRepoInstance = UserRepository();

      final DukalinkUser newUser = DukalinkUser(
        uid: user.uid,
        name: 'Merchant Store',
        phoneNumber: user.phoneNumber,
      );

      await remoteUserRepoInstance.addUser(newUser);

      StoreProvider.dispatch(
        ctx,
        UpdateUserStateAction(
          uid: user.uid,
          isSignedIn: true,
          phoneNumber: user.phoneNumber,
        ),
      );

      appInitialRoute.initialRoute.add(
        await getInitialRoute(state: state),
      );

      StoreProvider.dispatch<AppState>(
        ctx,
        NavigateAction.pushNamed(homePageRoute),
      );
    } else {
      launchSnackbar(
          context: ctx,
          message: 'Signin failed',
          type: SnackbarType.error,
          dismissText: 'Ok');
    }
  }
}
