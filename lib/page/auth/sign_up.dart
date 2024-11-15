import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_path/logic/controller/auth_controller.dart';
import 'package:practice_path/page/auth/sign_in.dart';

class Auth extends ConsumerStatefulWidget {
  const Auth({super.key});

  @override
  ConsumerState<Auth> createState() => _AuthState();
}

class _AuthState extends ConsumerState<Auth> {
  final _globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthController? _authController;

  @override
  void initState() {
    super.initState();

    _authController = AuthController(context: context, ref: ref);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: GetBuilder<AuthController>(
          init: _authController,
          builder: (ctrl) {
            return SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 90),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Signup", style: GoogleFonts.poppins(fontSize: 30)),
                      Gap(40),
                      TextFormField(
                        controller: emailController,
                      ),
                      Gap(30),
                      TextFormField(
                        controller: passwordController,
                      ),
                      Gap(30),
                      TextButton(
                        onPressed: () async {
                          await ctrl.signUp(
                              emailController.text, passwordController.text);
                        },
                        child: Text("signup"),
                      ),
                      Gap(30),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 40,
                            child: Text("Sign In")),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
