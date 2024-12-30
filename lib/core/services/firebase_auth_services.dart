import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/error/exception.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.createUserWithEmailAndPassword ${e.toString()}');
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الالكتروني غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تعذر الاتصال بالانترنت');
      } else {
        throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
      }
    } catch (e) {
      log('Exception: in FirebaseAuthServices.createUserWithEmailAndPassword ${e.toString()}');
      throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithEmailAndPassword ${e.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomException('البريد الالكتروني غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomException('كلمة المرور او البريد الالكتروني غير صحيحة ');
      } else if (e.code == 'invalid-email') {
        throw CustomException('كلمة المرور او البريد الالكتروني غير صحيحة ');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('كلمة المرور او البريد الالكتروني غير صحيحة ');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تعذر الاتصال بالانترنت');
      } else {
        throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
      }
    } catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithEmailAndPassword ${e.toString()}');
      throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
    }
  }
}
