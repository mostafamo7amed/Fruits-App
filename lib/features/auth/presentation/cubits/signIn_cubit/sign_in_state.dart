part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final AuthEntity authEntity;

  SignInSuccess( this.authEntity);
}

final class SignInError extends SignInState {
  final String message;

  SignInError(this.message);
}
