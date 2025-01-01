import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits/core/error/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user!;
      return user;
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

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithGoogle ${e.toString()}');
      if (e.code == 'network-request-failed') {
        throw CustomException('تعذر الاتصال بالانترنت');
      } else {
        throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
      }
    } catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithGoogle ${e.toString()}');
      throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider
          .credential(loginResult.accessToken!.tokenString);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithFacebook ${e.toString()}');
      if (e.code == 'network-request-failed') {
        throw CustomException('تعذر الاتصال بالانترنت');
      } else if (e.code == 'account-exists-with-different-credential') {
        throw CustomException('الحساب موجود بالفعل بمعلومات اخرى حاول التسجيل بطريقة اخرى');
      }
      else {
        throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
      }
    } catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithFacebook ${e.toString()}');
      throw CustomException('حدث خطأ ما الرجاء المحاولة في وقت لاحق');
    }

  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }


}
