import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_path/logic/bloc/splash_logic/splash_bloc.dart';
import 'package:practice_path/logic/bloc/splash_logic/splash_state.dart';
import 'package:practice_path/page/auth/sign_up.dart';
import 'package:practice_path/page/home/home.dart';
import 'package:practice_path/page/splash/splash.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InitialBloc, InitialState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeState) {
            return HomePage();
          } else if (state is AuthState) {
            return Auth();
          } else if (state is SplashState) {
            return SplashPage();
          }

          return SplashPage();
        },
      ),
    );
  }
}
