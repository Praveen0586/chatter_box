import 'package:flutter/material.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatter Box '),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: Text('Hello '),
      ),
    );
  }
}
