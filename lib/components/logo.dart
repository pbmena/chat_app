import 'package:flutter/material.dart';

class ChatLogo extends StatelessWidget {
  const ChatLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/chat_logo.png',
      fit: BoxFit.cover,
      scale: 2.5,
    );
  }
}
