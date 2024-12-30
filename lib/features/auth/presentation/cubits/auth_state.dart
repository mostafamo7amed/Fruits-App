part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthEntity authEntity;
  AuthSuccess(this.authEntity);
}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
