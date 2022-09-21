import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:flutter_with_firebase/Screens/Settings/settings_screen.dart';
import 'package:flutter_with_firebase/ToDo%20List/to_do_list_screen.dart';
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
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: [
          InkWell(
              onTap: () {
                Get.to(() => const SettingsScreen());
              },
              child: const Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(children: [
         
          // Text(auth.doc(user!uid).id ?? "asdfsad"),
          Text("Welcome $name"),
          ListTile(
            title: const Text("To Do List"),
            onTap: () {
              Get.to(() => const ToDoListScreen());
            },
          ),
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
