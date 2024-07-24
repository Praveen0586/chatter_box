import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Chatter Box '),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout_outlined ,color: Theme.of(context).colorScheme.primary,))
        ],
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: Text('Hello '),
      ),
    );
  }
}
