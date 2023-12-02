import 'package:flutter/material.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:chat_app/ui/constants/app_constant.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: passwordController,
      hintText: TxtConstant.passwordTxt,
      obscureText: true,
      icon: const Icon(Icons.lock),
    );
  }
}
