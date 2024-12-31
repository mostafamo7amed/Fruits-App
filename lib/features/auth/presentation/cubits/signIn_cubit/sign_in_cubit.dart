import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits/features/auth/domain/entities/auth_entity.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/repos/auth_repo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> loginWithEmailAndPassword({required String email, required String password}) async {
    emit(SignInLoading());
    Either<Failure, AuthEntity> either =
    await authRepo.loginWithEmailAndPassword(email: email, password: password);
    either.fold(
          (failure) {
        emit(SignInError(failure.message));
      },
          (authEntity) {
        emit(SignInSuccess(authEntity));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    Either<Failure, AuthEntity> either = await authRepo.signInWithGoogle();
    either.fold(
          (failure) {
        emit(SignInError(failure.message));
      },
          (authEntity) {
        emit(SignInSuccess(authEntity));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    Either<Failure, AuthEntity> either = await authRepo.signInWithFacebook();
    either.fold(
          (failure) {
        emit(SignInError(failure.message));
      },
          (authEntity) {
        emit(SignInSuccess(authEntity));
      },
    );
  }


}
