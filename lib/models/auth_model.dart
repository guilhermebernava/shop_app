import 'dart:convert';

class AuthModel {
  String token;
  String userId;

  AuthModel({
    required this.token,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      "userId": userId,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      token: map['token'],
      userId: map['userId'],
    );
  }

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
