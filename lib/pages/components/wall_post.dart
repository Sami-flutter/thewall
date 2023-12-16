// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WallPost extends StatefulWidget {
  final String messageId;
  final String message;
  final String user;
  final DateTime timestamp;
  final Function(String) deletePost;

  WallPost({
    Key? key,
    required this.messageId,
    required this.message,
    required this.user,
    required this.timestamp,
    required this.deletePost,
  }) : super(key: key);

  @override
  _WallPostState createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // message
                const SizedBox(height: 10),
                Text(
                  widget.message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                //User info
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: widget.user,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 62, 60, 60),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Text(
                      '  - ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${widget.timestamp.day}/${widget.timestamp.month}/${widget.timestamp.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Delete Icon
          GestureDetector(
            onTap: () {
              // Implement your delete logic here
              widget.deletePost(widget.messageId);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
