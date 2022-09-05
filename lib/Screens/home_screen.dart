import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
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
              loginController.loginAnnonymously();
            },
            child: const Text("Login Annonymous"),
          ),
        ]),
      ),
    );
  }
}
