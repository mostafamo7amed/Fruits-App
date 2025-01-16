import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/auth_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoading());
    Either<Failure, AuthEntity> either =
        await authRepo.createUserWithEmailAndPassword(
            email: email, password: password, name: name);
    either.fold(
      (failure) {
        emit(SignupError(failure.message));
      },
      (authEntity) {
        authRepo.getUserData(docId: authEntity.userId!);
        emit(SignupSuccess(authEntity));
      },
    );
  }
}
