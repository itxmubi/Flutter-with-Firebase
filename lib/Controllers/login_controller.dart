import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_with_firebase/Screens/home_screen.dart';
import 'package:get/get.dart';

import '../Screens/after_login.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                              ANNONYMOUS LOGIN                              */
/* -------------------------------------------------------------------------- */

  loginAnnonymously() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInAnonymously().then((value) {
        Get.to(() => const AfterLoginScreen());
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          log("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          log("Unknown error.");
      }
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                  Sign out                                  */
  /* -------------------------------------------------------------------------- */

  signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(() => HomeScreen());
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                       SIGN UP WITH EMAIL AND PASSWORD                      */
  /* -------------------------------------------------------------------------- */

  signupWithEmailandPassword() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        log(value.toString());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  signInWithEmailandPassword() async {}
}
