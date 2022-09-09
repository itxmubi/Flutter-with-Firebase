import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AfterLoginScreen extends StatefulWidget {
  const AfterLoginScreen({super.key});

  @override
  State<AfterLoginScreen> createState() => _AfterLoginScreenState();
}

class _AfterLoginScreenState extends State<AfterLoginScreen> {
  LoginController loginController = Get.find();
  final auth = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  getUserName() {
    try {
      var a = auth.doc(user!.uid).get();
      log(a.toString());
    } catch (e) {
      log('messageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserName();
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: Center(
        child: Column(children: [
          const Text("Welcome"),
          // Text(auth.doc(user!.uid).id ?? "asdfsad"),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () {
              loginController.signOut();
            },
            child: const Text("Log Out"),
          ),
        ]),
      ),
    );
  }
}
