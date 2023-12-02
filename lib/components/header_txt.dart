import 'package:flutter/material.dart';
import 'package:chat_app/ui/constants/constants.dart';

class HeaderTxt extends StatelessWidget {
  const HeaderTxt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      TxtConstant.headerTxt,
      style: TextStyle(
        color: AppColors.kcHeaderText,
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
