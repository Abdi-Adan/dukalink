import 'package:dukalink_app/core/data/local/shared_preference_helper.dart';
import 'package:dukalink_app/core/data/model/login/email_pss_login_req.dart';
import 'package:dukalink_app/core/data/repository/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SharedHelper sharedHelper;
  final LoginRepository loginRepository;

  LoginCubit({required this.sharedHelper, required this.loginRepository})
      : super(LoginInitial());

  void loginUser(EmailPssLoginReq params) async {
    try {
      emit(LoadingLoginState());

      final res = await loginRepository.loginUser(params);

      emit(SuccessLoginState('${res?.message}'));
    } catch (e) {
      emit(ErrorLoginState(e.toString()));
    }
  }
}
