import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';
import 'package:practice_path/logic/bloc/splash_logic/splash_bloc.dart';
import 'package:practice_path/logic/provider/store/user_store.dart';
import 'package:practice_path/model/user.dart';

class AuthController extends GetxController {
  BuildContext context;
  WidgetRef ref;
  AuthController({required this.context, required this.ref});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String username, String password) async {
    try {
      if (username.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: username, password: password);
        await varification();

        await UserStore.saveUser(
            UserManager(email: username, password: password));

        context.read<InitialBloc>().onSumbitAuth();
      } else {
        showSnackBar("provide correct email and password");
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message.toString());
    }
  }

  Future<void> signIn(String username, String pass) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: username, password: pass);
      await UserStore.saveUser(UserManager(email: username, password: pass));
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        showSnackBar("Sign In successfully");
        await UserStore.saveUser(UserManager(email: username, password: pass));
        context.read<InitialBloc>().onSumbitAuth();
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message.toString());
    }
  }

  Future<void> varification() async {
    User? user = firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      showSnackBar(
          "Verification email has been sent. Please verify your email before continuing.");

      // Wait until the user verifies their email
      while (user != null && !user.emailVerified) {
        await Future.delayed(Duration(seconds: 3));
        await user.reload();
        user = firebaseAuth.currentUser;
      }

      showSnackBar("Email verified successfully.");
    }
  }

  void showSnackBar(
    String msg,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
