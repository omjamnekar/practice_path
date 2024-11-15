import 'dart:convert';

import 'package:practice_path/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  static Future<void> saveUser(UserManager user) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('userDetail', jsonEncode(user.toJson()));
  }

  static Future<UserManager?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('userDetail');
    if (userString != null) {
      return UserManager.fromString(userString);
    }
    return null;
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userDetail');
  }
}
