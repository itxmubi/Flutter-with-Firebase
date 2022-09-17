import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  addnewItem(String title, String message) async {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .collection("Todo")
        .doc()
        .set({
      "task": title,
      "message": message,
    }).then((value) {
      return Get.defaultDialog(
          title: "Success", middleText: "Your Item is updated");
    });
  }

  getAllTasks() {
 var tasks =    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .collection("Todo")
        .doc()
        .get();

        
  }
}
