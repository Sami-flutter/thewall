// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thewall/pages/components/text_field.dart';
import 'package:thewall/pages/components/wall_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // Text Controller
  final textController = TextEditingController();

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Delete post method
  void deletePost(String messageId) {
    // Delete the post from the database
    FirebaseFirestore.instance.collection("UserPosts").doc(messageId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: const Text(
            "F A F O R I T E ",
            style: TextStyle(fontSize: 25,
            //color: Colors.white
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        actions: [
          // Sign-out button
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // The wall fetch data
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("UserPosts")
                    .orderBy("TimeStamp", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // Get the message first
                        final post = snapshot.data!.docs[index];
                        return WallPost(
                          messageId: post.id,
                          message: post['Message'],
                          user: post['UserEmail'],
                          timestamp: (post['TimeStamp'] as Timestamp).toDate(),
                          deletePost: deletePost,
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            // Post Message
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: 'Text is here',
                      obscureText: false,
                    ),
                  ),
                  // Post button
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.arrow_circle_up),
                  ),
                ],
              ),
            ),

            // Show the current User
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(child: Text("Logged in as: ${currentUser.email}")),
            ),
          ],
        ),
      ),
    );
  }

  // Post message method
  void postMessage() {
    if (textController.text.isNotEmpty) {
      // Store to database
      FirebaseFirestore.instance.collection("UserPosts").add({
        'Message': textController.text,
        'UserEmail': currentUser.email,
        'TimeStamp': Timestamp.now(),
      });

      // Clear the text input after posting
      clearTextInput();
    }
  }

  // Clear text input
  void clearTextInput() {
    setState(() {
      textController.clear();
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
