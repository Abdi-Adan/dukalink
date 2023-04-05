import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/sign_up/signup_check_request.dart';
import '../../data/repository/signup_repository.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SharedHelper sharedHelper;
  final SignUpRepository signupRepository;

  SignUpCubit({required this.sharedHelper, required this.signupRepository})
      : super(SignupInitial());

  void signupUser(SignUpCheckRequest params) async {
    try {
      emit(LoadingSignupState());

      final res = await signupRepository.signupUser(params);

      emit(SuccessSignupState('${res?.message}'));
    } catch (e) {
      emit(ErrorSignupState(e.toString()));
    }
  }
}
