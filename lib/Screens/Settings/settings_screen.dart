import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(children: const [
        Text("Name"),
        Text("Name Here"),
        Text("UID"),
        Text("uid here"),
        Text("email"),
        Text("email Here"),
        Text("photo url"),
        Text("photo url here"),
      ]),
    );
  }
}
