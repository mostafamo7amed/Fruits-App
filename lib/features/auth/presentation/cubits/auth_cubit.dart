import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/auth_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(AuthLoading());
    Either<Failure, AuthEntity> either =
        await authRepo.createUserWithEmailAndPassword(
            email: email, password: password, uid: '', name: '');
    either.fold(
      (failure) {
        emit(AuthError(failure.message));
      },
      (authEntity) {
        emit(AuthSuccess(authEntity));
      },
    );
  }

  Future<void> loginWithEmailAndPassword({required String email, required String password}) async {
    emit(AuthLoading());
    Either<Failure, AuthEntity> either =
        await authRepo.loginWithEmailAndPassword(email: email, password: password);
    either.fold(
      (failure) {
        emit(AuthError(failure.message));
      },
      (authEntity) {
        emit(AuthSuccess(authEntity));
      },
    );
  }
}
