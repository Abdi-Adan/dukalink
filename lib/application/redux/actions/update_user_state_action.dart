import 'package:async_redux/async_redux.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/application/redux/states/user_state.dart';

class UpdateUserStateAction extends ReduxAction<AppState> {
  String? uid;
  String? name;
  String? phoneNumber;
  bool? isSignedIn;
  String? pinCodeVerificationID;

  UpdateUserStateAction({
    this.uid,
    this.name,
    this.phoneNumber,
    this.isSignedIn,
    this.pinCodeVerificationID,
  });

  @override
  AppState reduce() {
    final UserState? newUserState = store.state.userState?.copyWith.call(
      uid: uid ?? state.userState?.uid,
      name: name ?? state.userState?.name,
      phoneNumber: phoneNumber ?? state.userState?.phoneNumber,
      isSignedIn: isSignedIn ?? state.userState?.isSignedIn,
      pinCodeVerificationID:
          pinCodeVerificationID ?? state.userState?.pinCodeVerificationID,
    );

    final AppState newState = state.copyWith(userState: newUserState);
    return newState;
  }
}
