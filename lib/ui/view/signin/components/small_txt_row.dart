import 'package:flutter/material.dart';
import 'package:chat_app/ui/constants/constants.dart';
import 'package:chat_app/ui/utils/spacings.dart';
import 'package:chat_app/ui/view/signin/signin_page.dart';

class SignInSmallTxtRow extends StatelessWidget {
  const SignInSmallTxtRow({
    super.key,
    required this.widget,
  });

  final SignInPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          TxtConstant.siSmallTxt,
          style: TextStyle(color: AppColors.kcSmallText),
        ),
        ksHorizontalXSmall,
        GestureDetector(
          onTap: widget.onTap,
          child: const Text(
            TxtConstant.signupbtnTxt,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
