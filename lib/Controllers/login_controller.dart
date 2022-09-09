import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_with_firebase/Screens/home_screen.dart';
import 'package:get/get.dart';

import '../Screens/after_login.dart';

class LoginController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                             SigN UP CONTROLLERS                            */
  /* -------------------------------------------------------------------------- */
  TextEditingController signUpemailController = TextEditingController();
  TextEditingController signUppasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();

  /* -------------------------------------------------------------------------- */
  /*                             SIGN IN CONTROLLERS                            */
  /* -------------------------------------------------------------------------- */

  TextEditingController signInemailController = TextEditingController();
  TextEditingController signInpasswordController = TextEditingController();
  RxBool isValid = false.obs;

/* -------------------------------------------------------------------------- */
/*                              ANNONYMOUS LOGIN                              */
/* -------------------------------------------------------------------------- */

  loginAnnonymously() async {
    try {
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
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: signUpemailController.text,
        password: signUppasswordController.text,
      )
          .then((value) {
        log(value.toString());
        userSetup();
        Get.back();
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

  /* -------------------------------------------------------------------------- */
  /*                       SIGN IN WITH EMAIL AND PASSWORD                      */
  /* -------------------------------------------------------------------------- */

  signInWithEmailandPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: signInemailController.text,
              password: signInpasswordController.text)
          .then((value) {
        Get.to(() => const AfterLoginScreen());
        // userSetup();
      });
    } on SocketException {
      log("No Internet connection");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                               VALIDATE EMAIL                               */
  /* -------------------------------------------------------------------------- */
  validateEmail() async {
    isValid = EmailValidator.validate(signUpemailController.text).obs;
    update();
  }

  /* -------------------------------------------------------------------------- */
  /*                              Storing USER DATA                             */
  /* -------------------------------------------------------------------------- */

  Future<void> userSetup() async {
    User? auth = FirebaseAuth.instance.currentUser;

    firestore.FirebaseFirestore.instance
        .collection('Users')
        .doc(auth!.uid)
        .set({
      'displayName': signUpNameController.text,
      'uid': auth.uid,
      'loginTime': "${DateTime.now().millisecondsSinceEpoch}",
    });

    return;
  }
}
