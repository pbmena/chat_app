import 'package:flutter/material.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:chat_app/ui/constants/app_constant.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: emailController,
      hintText: TxtConstant.emailTxt,
      obscureText: false,
      icon: const Icon(Icons.email),
    );
  }
}
