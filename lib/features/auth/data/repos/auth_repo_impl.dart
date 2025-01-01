import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/error/exception.dart';
import 'package:fruits/core/error/failure.dart';
import 'package:fruits/core/services/database_services.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/core/utils/backend_endpoints.dart';
import 'package:fruits/features/auth/data/models/auth_model.dart';

import 'package:fruits/features/auth/domain/entities/auth_entity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthServices firebaseAuthServices;
  DatabaseServices databaseServices;
  AuthRepoImpl({required this.firebaseAuthServices, required this.databaseServices});
  @override
  Future<Either<Failure, AuthEntity>> createUserWithEmailAndPassword(
      {
      required String name,
      required String email,
      required String password}) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name);
      AuthEntity authEntity = AuthEntity(user.uid, email, name);
      await addUserData(docId: user.uid, user: authEntity);
      return Right(authEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      User user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      AuthEntity authEntity = await getUserData(docId: user.uid);
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      AuthEntity authEntity = AuthModel.fromFirebaseAuth(user);
      bool isUserExist = await databaseServices.checkIfDataExist(path: EndPoints.addUser, documentId: user.uid);
      if(!isUserExist){
        await addUserData(docId: user.uid, user: authEntity);
      }else{
        authEntity = await getUserData(docId: user.uid);
      }
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signInWithFacebook() async {
    User? user;
    try{
      user = await firebaseAuthServices.signInWithFacebook();
      AuthEntity authEntity = AuthModel.fromFirebaseAuth(user);
      bool isUserExist = await databaseServices.checkIfDataExist(path: EndPoints.addUser, documentId: user.uid);
      if(!isUserExist){
        await addUserData(docId: user.uid, user: authEntity);
      }else{
        authEntity = await getUserData(docId: user.uid);
      }
      return Right(authEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure('حدث خطأ ما الرجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future addUserData({required String docId, required AuthEntity user}) {
    return databaseServices.addData(path: EndPoints.addUser, documentId: docId, data: user.toMap());
  }

  @override
  Future<AuthEntity> getUserData({required String docId}) async{
    var data = await databaseServices.getData(path: EndPoints.addUser, documentId: docId);
    return AuthModel.fromJson(data);
  }

}
