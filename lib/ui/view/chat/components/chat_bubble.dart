import 'package:flutter/material.dart';
import 'package:chat_app/ui/constants/app_color.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, this.color});

  final String message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: AppColors.kcWhiteBg),
      ),
    );
  }
}
