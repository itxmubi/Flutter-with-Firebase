import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_with_firebase/Screens/home_screen.dart';
import 'package:get/get.dart';

import '../Screens/after_login.dart';

class LoginController extends GetxController {
/* -------------------------------------------------------------------------- */
/*                              ANNONYMOUS LOGIN                              */
/* -------------------------------------------------------------------------- */

  loginAnnonymously() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInAnonymously().then((value) {
        Get.to(() => const AfterLoginScreen());
        log(value.credential!.token.toString());
        log(value.additionalUserInfo!.profile.toString());
      });
      // log("Signed in with temporary account.");
      log(userCredential);
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
}
