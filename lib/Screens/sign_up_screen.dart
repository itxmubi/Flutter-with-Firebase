import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LoginController loginController = Get.find();
  String errorText = "Email is not valid";
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body:
          // Obx(
          //   () =>
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              const Text("Enter Your Name"),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 90.w,
                child: TextFormField(
                  controller: loginController.signUpNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    // errorText: loginController.isValid.value ? errorText : "",
                    hintText: "Enter Name",
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text("Enter Your Email"),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 90.w,
                child: TextFormField(
                  onChanged: (s) {
                    loginController.validateEmail();
                    log(loginController.isValid.value.toString());
                  },
                  controller: loginController.signUpemailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    // errorText: loginController.isValid.value ? errorText : "",
                    hintText: "Enter Email",
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text("Enter Your Password"),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 90.w,
                child: TextField(
                  controller: loginController.signUppasswordController,
                  obscureText: true,
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
                        loginController.signupWithEmailandPassword();
                      },
                      child: const Text("Sign Up")))
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
