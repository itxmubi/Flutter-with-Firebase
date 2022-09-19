import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/todo_controller.dart';
import 'package:get/get.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                    title: const Text("Enter Item Details"),
                    content: SizedBox(
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Enter Title"),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: titleController,
                            ),
                          ),
                          const Text("Enter Message"),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: messageController,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Cancel")),
                              const SizedBox(
                                width: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    todoController.addnewItem(
                                        titleController.text,
                                        messageController.text);
                                  },
                                  child: const Text("OK")),
                            ],
                          )
                        ],
                      ),
                    ));
              });
          // FirebaseFirestore.instance
          //     .collection("Users")
          //     .doc(user!.uid)
          //     .collection("Todo")
          //     .doc()
          //     .set({"task": "Hi this is my new task"}).then((value) {
          //   return Get.defaultDialog(
          //       title: "Success", middleText: "Your Item is updated");
          // });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("To Do:")),
      body: Column(children: [
        const ListTile(
          title: Text("item 1"),
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(user!.uid)
                .collection("Todo")
                .doc()
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              } else if (snapshot.hasData) {
                return const ListTile(
                  title: Text("task"),
                );
              }
              return const CircularProgressIndicator();
            })
      ]),
    );
  }
}
