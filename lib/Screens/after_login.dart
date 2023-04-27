import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:flutter_with_firebase/Screens/Settings/settings_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  LoginController loginController = Get.find();
  final auth = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  // final SharedPreferences prefs;

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
          InkWell(
              onTap: () {
                loginController.signOut();
              },
              child: const Icon(Icons.logout)),
        ],
      ),
      body: Column(children: [
        // ListTile(
        //   title: const Text("To Do List"),
        //   onTap: () {
        //     Get.to(() => const ToDoListScreen());
        //   },
        // ),
        SizedBox(height: 40.h),
      ]),
    );
  }
}
