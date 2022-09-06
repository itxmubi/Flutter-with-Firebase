import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginController loginController = Get.find();
  String errorText = "Email is not valid";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Obx(
        () => Padding(
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
                child: TextFormField(
                  onChanged: (s) {
                    loginController.validateEmail();
                    log(loginController.isValid.value.toString());
                  },
                  controller: loginController.signInemailController,
                  decoration: InputDecoration(
                    errorText: loginController.isValid.value ? errorText : "",
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
                  controller: loginController.signInpasswordController,
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
                        loginController.signInWithEmailandPassword();
                      },
                      child: const Text("Sign In")))
            ],
          ),
        ),
      ),
    );
  }
}
