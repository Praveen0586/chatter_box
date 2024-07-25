import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatmessages extends StatelessWidget {
  const Chatmessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final chatdata = chatSnapshots.data!.docs;
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            const Center(
              child: Text('Oopse no messages found '),
            );
          }

          return ListView.builder(
              itemCount: chatdata.length,
              reverse: true,
              itemBuilder: (ctx, index) {
                return Text('${chatdata[index].data()['message']}');
              });
        });
  }
}
