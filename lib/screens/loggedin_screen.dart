import 'package:chatter_box/widgets/chatmessages.dart';
import 'package:chatter_box/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chatter Box '),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ],
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body:const  Column(
          children: [Expanded(child: Chatmessages()) ,NewMessage()],
        ));
  }
}


// GestureDetector(
//           onTap: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (builder) => Chatscreen()));
//           },
//           child: Container(
//             height: 70,
//             width: double.infinity,
//             margin: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 1,
//             ),
//             child: const Card(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(Icons.nature_people_outlined),
//                   SizedBox(
//                     width: 25,
//                   ),
//                   Text('Community ')
//                 ],
//               ),
//             ),
//           ),
//         )