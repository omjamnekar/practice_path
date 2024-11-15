import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_path/logic/controller/auth_controller.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
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
                      Text("SignIn", style: GoogleFonts.poppins(fontSize: 30)),
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
                        child: Text("Sign In"),
                      ),
                      Gap(30),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
