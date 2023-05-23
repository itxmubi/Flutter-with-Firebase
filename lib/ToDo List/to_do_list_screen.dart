import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/todo_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String selectedRef = "";

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
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Cancel")),
                              const SizedBox(
                                width: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    todoController.addnewItem(
                                        titleController.text,
                                        messageController.text);
                                    titleController.clear();
                                    messageController.clear();
                                  },
                                  child: const Text("OK")),
                            ],
                          )
                        ],
                      ),
                    ));
              });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("ToDo List")),
      body: SingleChildScrollView(
        child: Column(children: [
          // const ListTile(
          //   title: Text("item 1"),
          // ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(user!.uid)
                  .collection("Todo")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return snapshot.data!.docs.isEmpty
                    ? const Center(
                        child: Text("You Do not have any Item in the list"))
                    : ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return Card(
                                child: ListTile(
                                    onTap: () {
                                      if (selectedRef ==
                                          document.reference.toString()) {
                                        setState(() {
                                          selectedRef = "";
                                        });
                                      }
                                    },
                                    onLongPress: () {
                                      setState(() {
                                        selectedRef =
                                            document.reference.toString();
                                      });
                                    },
                                    title: Text(data['task']),
                                    subtitle: Text(data['message']),
                                    trailing: selectedRef ==
                                            document.reference.toString()
                                        ? SizedBox(
                                            width: 20.w,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      // if (selectedRef ==
                                                      //     document.reference
                                                      //         .toString()) {
                                                      //   setState(() {
                                                      //     selectedRef = "";
                                                      //   });
                                                      // } else {
                                                      showDialog(
                                                          context: context,
                                                          builder: (ctx) {
                                                            return AlertDialog(
                                                                title: const Text(
                                                                    "Enter Item Details"),
                                                                content:
                                                                    SizedBox(
                                                                  height: 250,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Text(
                                                                          "Enter Title"),
                                                                      SizedBox(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              titleController,
                                                                        ),
                                                                      ),
                                                                      const Text(
                                                                          "Enter Message"),
                                                                      SizedBox(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              messageController,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            40,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                Get.back();
                                                                              },
                                                                              child: const Text("Cancel")),
                                                                          const SizedBox(
                                                                            width:
                                                                                50,
                                                                          ),
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                final docRef = document.reference;
                                                                                docRef.update({
                                                                                  "task": titleController.text,
                                                                                  "message": messageController.text
                                                                                });
                                                                                Get.back();

                                                                                titleController.clear();
                                                                                messageController.clear();
                                                                              },
                                                                              child: const Text("OK")),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ));
                                                          });
                                                      // }
                                                    },
                                                    child:
                                                        const Icon(Icons.edit)),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      document.reference
                                                          .delete();
                                                    },
                                                    child: const Icon(
                                                        Icons.delete))
                                              ],
                                            ),
                                          )
                                        : const SizedBox()),
                              );
                            })
                            .toList()
                            .cast(),
                      );
              })
        ]),
      ),
    );
  }
}
