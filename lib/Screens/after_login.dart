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

  String name = "";
  getUserName() {
    try {
      var a =
          auth.collection("Users").doc(user!.uid).get().then((querySnapshot) {
        setState(() {
          name = querySnapshot.data()!["displayName"];
        });
      });

      log(a.toString());
    } catch (e) {
      log('messagee $e');
    }
  }

  @override
  void initState() {
    getUserName();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection("Users")
              .doc(user!.uid)
              .update({"task": "Hi this is my new task"});
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("Welcome")),
      body: Center(
        child: Column(children: [
          // Text(auth.doc(user!uid).id ?? "asdfsad"),
          Text("Welcome $name"),
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
