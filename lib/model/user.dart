import 'dart:convert';

import 'package:uuid/uuid.dart';

class UserManager {
  String id;

  String email;
  String password;

  UserManager({String? id, required this.email, required this.password})
      : id = id ?? Uuid().v4();

  factory UserManager.fromJson(Map<String, dynamic> json) {
    return UserManager(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  static UserManager fromString(String userData) {
    final json = Map<String, dynamic>.from(jsonDecode(userData));
    return UserManager.fromJson(json);
  }
}
