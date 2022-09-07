import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:flutter_with_firebase/Screens/sign_in_page.dart';
import 'package:flutter_with_firebase/Screens/sign_screen.dart';
import 'package:flutter_with_firebase/Screens/sign_up_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter with Firebase Practice"),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SignInPage());
            },
            child: const Text("Sign In "),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            child: const Text("Sign In With Email and Password"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SignUpScreen());
            },
            child: const Text("Sign up"),
          ),
          ElevatedButton(
            onPressed: () {
              loginController.loginAnnonymously();
            },
            child: const Text("Login Annonymous"),
          ),
        ]),
      ),
    );
  }
}
