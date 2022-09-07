import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 400,
        ),
        LoginCardWidget(
          title: "Sign In with Email",
          icon: const Icon(Icons.login),
          onpressed: () {},
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset("assets/images/google.png"),
            )
          ],
        )
      ]),
    );
  }
}

class LoginCardWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function() onpressed;
  const LoginCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onpressed,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 320,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
