part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLoginState extends LoginState {
  @override
  List<Object?> get props => [];
}

class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState(this.message);

  @override
  List<String> get props => [message];
}

class SuccessLoginState extends LoginState {
  final String message;

  const SuccessLoginState(this.message);

  @override
  List<String> get props => [message];
}
