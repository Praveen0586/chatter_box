import 'package:chatter_box/widgets/chatbubblesown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final currentuser = FirebaseAuth.instance.currentUser!.uid;

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
                final currentmessage = chatdata[index].data();
                final istherenextmessage = index + 1 < chatdata.length
                    ? chatdata[index + 1].data()
                    : null;

                final currentmessageuserid = currentmessage['user_id'];
                final nextmessageuserid = istherenextmessage != null
                    ? istherenextmessage['user_id']
                    : null;

                if (currentmessageuserid == nextmessageuserid) {
                  ChatscreenBubbles.follow(
                      message: currentmessage['message'],
                      isme: currentuser == currentmessageuserid);
                } else {
                  ChatscreenBubbles.first(
                      uername: currentmessage['username'],
                      image: currentmessage['userimg'],
                      message: currentmessage['message'],
                      isme: currentuser == currentmessageuserid);
                }

                //Text('${chatdata[index].data()['message']}');
              });
        });
  }
}
