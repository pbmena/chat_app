import 'package:flutter/material.dart';
import 'package:chat_app/ui/constants/app_color.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.icon});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kcNoBg),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kcPrimaryBtn),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          fillColor: AppColors.kcTextField,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.kcHintStyle),
          prefixIcon: icon,
          prefixIconColor: AppColors.kcPrefixColor,
        ),
      ),
    );
  }
}
