import 'package:flutter/material.dart';

class ChatscreenBubbles extends StatelessWidget {
  const ChatscreenBubbles.first(
      {required this.uername,
      required this.image,
      required this.message,
      required this.isme,
      super.key})
      : isFirestSeq = true;

  const ChatscreenBubbles.follow(
      {required this.message, required this.isme, super.key})
      : image = null,
        isFirestSeq = false,
        uername = null;

  final String? uername;
  final String? image;
  final String message;
  final bool isme;
  final bool isFirestSeq;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
