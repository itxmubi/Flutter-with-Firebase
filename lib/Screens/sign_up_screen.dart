import 'dart:developer';

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
  String errorText = "Email is not valid";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                  controller: loginController.signUpemailController,
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
                  controller: loginController.signUppasswordController,
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
      ),
    );
  }
}
