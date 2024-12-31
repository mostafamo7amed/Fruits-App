import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/error/exception.dart';

import 'package:fruits/core/error/failure.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/features/auth/data/models/auth_model.dart';

import 'package:fruits/features/auth/domain/entities/auth_entity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthServices firebaseAuthServices;
  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, AuthEntity>> createUserWithEmailAndPassword(
      {required String uid,
      required String name,
      required String email,
      required String password}) async {
    try {
      User user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name);
      AuthEntity authEntity = AuthModel.fromFirebaseAuth(user);
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      User user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      AuthEntity authEntity = AuthModel.fromFirebaseAuth(user);
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    try {
      User user = await firebaseAuthServices.signInWithGoogle();
      AuthEntity authEntity = AuthModel.fromFirebaseAuth(user);
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithFacebook() async {
    try{
      User user = await firebaseAuthServices.signInWithFacebook();
      AuthEntity authEntity = AuthModel.fromFirebaseAuth(user);
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }
}
