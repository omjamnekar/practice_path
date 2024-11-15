import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_path/logic/bloc/splash_logic/splash_state.dart';
import 'package:practice_path/logic/provider/store/user_store.dart';

class InitialBloc extends Cubit<InitialState> {
  InitialBloc() : super(SplashState());

  Future<void> appStart() async {
    await Future.delayed(Duration(seconds: 2));
    final user = await UserStore.loadUser();
    if (user != null && user.id.isNotEmpty) {
      emit(HomeState());
    } else {
      emit(AuthState());
    }
  }

  void onSumbitAuth() {
    emit(HomeState());
  }
}
