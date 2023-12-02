import 'package:flutter/material.dart';
import 'package:chat_app/ui/constants/app_color.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({super.key, this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        elevation: 1,
        fixedSize: const Size(double.infinity, 55),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: AppColors.kcPrimaryBtn,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.kcWhiteBg,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
