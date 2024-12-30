import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {

  AuthModel(String super.userId, String super.email, String super.name);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(json['userId'], json['email'],json['name']);
  }

  factory AuthModel.fromFirebaseAuth(User user) {
    return AuthModel(user.uid, user.email?? '', user.displayName?? '');
  }

}