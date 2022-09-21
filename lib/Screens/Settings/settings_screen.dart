import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = FirebaseAuth.instance.currentUser;

  getUserdata() {
    if (user != null) {
      for (final providerProfile in user!.providerData) {
        // ID of the provider (google.com, apple.com, etc.)
        final provider = providerProfile.providerId;

        // UID specific to the provider
        final uid = providerProfile.uid;

        // Name, email address, and profile photo URL
        final name = providerProfile.displayName;
        final emailAddress = providerProfile.email;
        final profilePhoto = providerProfile.photoURL;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 10),
        const Center(
          child: CircleAvatar(
            radius: 80,
            child: Icon(
              Icons.person,
              size: 100,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          user!.displayName ?? "null",
          style: const TextStyle(fontSize: 20),
        ),
        ListTile(
          title: const Text("Email"),
          subtitle: Text(user!.email.toString()),
          trailing: const Icon(Icons.edit),
        ),
        ListTile(
          title: const Text("Email Verified"),
          subtitle: Text(user!.emailVerified.toString()),
          trailing: const Icon(Icons.verified),
        ),
        Text("Annonymous:  ${user!.isAnonymous}"),
        Text("UID:  ${user!.uid}"),
      ]),
    );
  }
}
