class AuthEntity {
  final String? userId;
  final String? name;
  final String? email;
  AuthEntity(this.userId,this.email, this.name);

  toMap() => {'userId': userId, 'email': email, 'name': name};
}