import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_path/model/user.dart';

class UserProvider extends StateNotifier<UserManager> {
  UserProvider() : super(UserManager(email: "", password: ""));

  void setData(String username, String password) {
    state = UserManager(email: username, password: password);
  }

  UserManager loadData() {
    return state;
  }
}

final userProvider = StateNotifierProvider<UserProvider, UserManager>(
  (ref) => UserProvider(),
);
