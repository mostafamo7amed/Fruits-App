import 'package:dartz/dartz.dart';
import 'package:fruits/core/error/failure.dart';
import 'package:fruits/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> loginWithEmailAndPassword({required String email, required String password});
  Future<Either<Failure, AuthEntity>> createUserWithEmailAndPassword({required String name, required String email, required String password});
  Future<Either<Failure, AuthEntity>> signInWithGoogle();
  Future<Either<Failure, AuthEntity>> signInWithFacebook();
  Future addUserData({required String docId, required AuthEntity user});
  Future<AuthEntity> getUserData({required String docId});

}