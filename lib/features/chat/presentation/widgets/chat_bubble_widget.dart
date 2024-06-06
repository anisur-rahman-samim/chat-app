import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatBubbleWidget extends HookConsumerWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubbleWidget({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blueAccent.withOpacity(0.8) : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: isCurrentUser ?  Radius.circular(12) : Radius.circular(0) ,
            bottomRight: isCurrentUser ?  Radius.circular(0) : Radius.circular(12),
          )),
      child: Text(
        message,
        style:  TextStyle(color: isCurrentUser ?  Colors.white : Colors.black),
      ),
    );
  }
}
