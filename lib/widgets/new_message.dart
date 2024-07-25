import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  bool istyping = false;
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _loadmessage() async {
      final enteredText = messageController.text;
      if (enteredText.trim().isEmpty) {
        return;
      }
      messageController.clear();
      final currentuser = FirebaseAuth.instance.currentUser;
      final user = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentuser!.uid)
          .get();
      await FirebaseFirestore.instance.collection('chats').add({
        'message': enteredText,
        'time': Timestamp.now(),
        'user_id': currentuser.uid,
        'username': user.data()!['username'],
        'userimg': user.data()!['user_Image']
      });
      print(enteredText);
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextField(
                controller: messageController,
                onChanged: (value) {
                  setState(() {
                    istyping = !false;
                  });
                },
                autocorrect: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(500),
                    ),

                    // enabledBorder:
                    //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    label: const Text(
                      'Message',
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
            ),
          ),
          IconButton(
              onPressed: _loadmessage,
              icon: istyping
                  ? const Icon(Icons.rocket_launch_outlined)
                  : const Icon(Icons.mode_edit_outline_sharp))
        ],
      ),
    );
  }
}
