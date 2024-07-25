import 'package:chatter_box/widgets/chatmessages.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chatter Box '),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: const Column(
          children: [Expanded(child: Chatmessages())],
        ));
  }
}
