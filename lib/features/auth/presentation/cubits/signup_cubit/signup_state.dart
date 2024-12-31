part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final AuthEntity authEntity;
  SignupSuccess(this.authEntity);
}

final class SignupError extends SignupState {
  final String message;
  SignupError(this.message);
}
