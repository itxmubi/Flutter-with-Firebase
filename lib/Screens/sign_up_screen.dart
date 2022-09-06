import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text("Enter Your Email"),
            SizedBox(
              width: 300,
              child: TextField(
                controller: loginController.emailController,
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Enter Your Password"),
            SizedBox(
              width: 300,
              child: TextField(
                controller: loginController.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      loginController.signupWithEmailandPassword();
                    },
                    child: const Text("Sign Up")))
          ],
        ),
      ),
    );
  }
}
