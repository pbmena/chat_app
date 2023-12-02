import 'package:flutter/material.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:chat_app/ui/constants/app_constant.dart';

class SignUpConfirmPassField extends StatelessWidget {
  const SignUpConfirmPassField({
    super.key,
    required this.confirmPasswordController,
  });

  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: confirmPasswordController,
      hintText: TxtConstant.suConfirmPassTxt,
      obscureText: true,
      icon: const Icon(Icons.lock),
    );
  }
}
