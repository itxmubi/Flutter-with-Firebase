import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:get/get.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
  LoginController loginController = Get.find();
  String errorText = "Email is not valid";
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child:
              //  Obx(
              //   () =>
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    // errorText: loginController.isValid.value ? errorText : "",
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
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: const Icon(Icons.remove_red_eye)),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
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
    // );
  }
}
