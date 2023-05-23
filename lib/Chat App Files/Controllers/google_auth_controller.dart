import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_with_firebase/Screens/after_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Constants/firestore_constants.dart';

class GoogleAuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  /* -------------------------------------------------------------------------- */
  /*                              LOGIN WITH GOOGLE                             */
  /* -------------------------------------------------------------------------- */

  // Future<UserCredential> signInWithGoogle() async {
  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        User? firebaseUser =
            (await firebaseAuth.signInWithCredential(credential)).user;

        if (firebaseUser != null) {
          final QuerySnapshot result = await firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
              .get();
          final List<DocumentSnapshot> documents = result.docs;
          if (documents.isEmpty) {
            // Writing data to server because here is a new user
            firebaseFirestore
                .collection(FirestoreConstants.pathUserCollection)
                .doc(firebaseUser.uid)
                .set({
              FirestoreConstants.nickname: firebaseUser.displayName,
              FirestoreConstants.photoUrl: firebaseUser.photoURL,
              FirestoreConstants.id: firebaseUser.uid,
              'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
              FirestoreConstants.chattingWith: null
            });

            // Write data to local storage
            // User? currentUser = firebaseUser;
            // await prefs.setString(FirestoreConstants.id, currentUser.uid);
            // await prefs.setString(
            //     FirestoreConstants.nickname, currentUser.displayName ?? "");
            // await prefs.setString(
            //     FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
            Get.to(() => const ChatHomeScreen());
          } else {
            Get.to(() => const ChatHomeScreen());
            // Already sign up, just get data from firestore
            // DocumentSnapshot documentSnapshot = documents[0];
            // UserChat userChat = UserChat.fromDocument(documentSnapshot);
            // // Write data to local
            // await prefs.setString(FirestoreConstants.id, userChat.id);
            // await prefs.setString(
            //     FirestoreConstants.nickname, userChat.nickname);
            // await prefs.setString(
            //     FirestoreConstants.photoUrl, userChat.photoUrl);
            // await prefs.setString(FirestoreConstants.aboutMe, userChat.aboutMe);
          }
          // _status = Status.authenticated;
          // notifyListeners();
          return true;
        } else {}
      }
      // Obtain the auth details from the request
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      // Create a new credential
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      // Once signed in, return the UserCredential
      // return await FirebaseAuth.instance
      //     .signInWithCredential(credential)
      //     .then((value) {
      //   Get.to(() => const ChatHomeScreen());
      //   return value;
      // });
    } catch (e) {
      log(e.toString());
    }
    update;
  }
}
