import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Screens/sign_in_page.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBHYAQUBoN92gkRqNXGIA4-fCG6tZU95cQ',
      appId: '1:771109987987:android:fe9e3f1b410811b086cf66',
      messagingSenderId: '448618578101',
      projectId: 'flutter-with-firebase-1ac57',
      storageBucket: 'flutter-with-firebase-1ac57.appspot.com',
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter With Firebase',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: SignInPage());
    });
  }
}
