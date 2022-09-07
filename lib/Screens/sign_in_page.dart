import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

import '../Widgets/login_button_widget.dart';
import 'sign_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        /* -------------------------------------------------------------------------- */
        /*                         ANIMATED TEXT KIT FOR Text                         */
        /* -------------------------------------------------------------------------- */
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Welcome To \n Flutter With Firebase',
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 150),
            ),
          ],
          totalRepeatCount: 4,
          // pause: const Duration(milliseconds: 100),
          displayFullTextOnTap: true,
          // stopPauseOnTap: true,
        ),
        const SizedBox(
          height: 250,
        ),
        LoginCardWidget(
          title: "Sign In with Email",
          icon: const Icon(Icons.login),
          onpressed: () {
            Get.to(() => const SignInWithEmailScreen());
          },
        ),
        const SizedBox(
          height: 20,
        ),
        LoginCardWidget(
          title: "Sign Up with Email",
          icon: const Icon(Icons.login),
          onpressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        LoginCardWidget(
          title: "Sign In Annonymously",
          icon: const Icon(Icons.login),
          onpressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Didn't have account? "),
            InkWell(
              onTap: () {},
              child: const Text(
                " Sign Up",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/google.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/twitterlogo.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/facebook.png"),
            )
          ],
        )
      ]),
    );
  }
}
