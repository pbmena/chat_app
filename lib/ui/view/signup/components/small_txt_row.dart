import 'package:flutter/material.dart';
import 'package:chat_app/ui/constants/constants.dart';
import 'package:chat_app/ui/utils/spacings.dart';
import 'package:chat_app/ui/view/signup/signup_page.dart';

class SignUpSmallTxtRow extends StatelessWidget {
  const SignUpSmallTxtRow({
    super.key,
    required this.widget,
  });

  final SignUpPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          TxtConstant.suSmallTxt,
          style: TextStyle(color: AppColors.kcSmallText),
        ),
        ksHorizontalXSmall,
        GestureDetector(
          onTap: widget.onTap,
          child: const Text(
            TxtConstant.signinbtnTxt,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
