import 'package:flutter/material.dart';

class ChatscreenBubbles extends StatelessWidget {
  const ChatscreenBubbles.first(
      {required this.username,
      required this.image,
      required this.message,
      required this.isme,
      super.key})
      : isFirestSeq = true;

  const ChatscreenBubbles.follow(
      {required this.message, required this.isme, super.key})
      : image = null,
        isFirestSeq = false,
        username = null;

  final String? username;
  final String? image;
  final String message;
  final bool isme;
  final bool isFirestSeq;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        if (image != null)
          Positioned(
              top: 10,
              right: isme ? 0 : null,
              child: CircleAvatar(
                backgroundImage: NetworkImage(image!),
                backgroundColor: theme.colorScheme.primary.withAlpha(180),
                radius: 15,
              )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment:
                isme ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (isFirestSeq) const SizedBox(height: 10),
                  if (username != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                      ),
                      child: Text(
                       '${username}!',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  Container( 
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    decoration: BoxDecoration(color: isme
                          ? Colors.grey[300]
                          : theme.colorScheme.secondary.withAlpha(200),
                        borderRadius: BorderRadius.only(
                      topLeft: !isme && isFirestSeq
                          ? Radius.zero
                          : const Radius.circular(12),
                      topRight: isme && isFirestSeq
                          ? Radius.zero
                          : const Radius.circular(12), bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                    )),
                    child: Text(
                     ' $message',
                      style: TextStyle(
                        height: 1.3,
                        color: isme
                            ? Colors.black87
                            : theme.colorScheme.onSecondary,
                      ),
                      softWrap: true,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
