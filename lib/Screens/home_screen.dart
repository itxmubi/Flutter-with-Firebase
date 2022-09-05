import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter with Firebase Practice"),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("data"),
          ),
        ]),
      ),
    );
  }
}
