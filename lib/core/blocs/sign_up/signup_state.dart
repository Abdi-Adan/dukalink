part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class LoadingSignupState extends SignupState {
  @override
  List<Object?> get props => [];
}

class ErrorSignupState extends SignupState {
  final String message;

  const ErrorSignupState(this.message);

  @override
  List<String> get props => [message];
}

class SuccessSignupState extends SignupState {
  final String message;

  const SuccessSignupState(this.message);

  @override
  List<String> get props => [message];
}
