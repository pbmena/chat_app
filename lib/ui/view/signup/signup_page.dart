import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/components/w_components.dart';
import 'package:chat_app/services/auth/service_auth.dart';
import 'package:chat_app/ui/constants/app_constant.dart';
import 'package:chat_app/ui/utils/spacings.dart';
import 'package:chat_app/ui/view/signup/components/su_components.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    final authService = Provider.of<ServiceAuth>(context, listen: false);

    if (passwordController.text != confirmPasswordController.text) {
      MyCustomSnackBar.buildErrorSnackbar(context, TxtConstant.suNotMatchTxt);
      return;
    }

    try {
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      MyCustomSnackBar.buildErrorSnackbar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: keSymLarge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ChatLogo(),
                ksVerticalMedium,
                const HeaderTxt(),
                ksVerticalXLarge,
                SignUpEmailField(emailController: emailController),
                ksVerticalSmall,
                SignUpPasswordField(passwordController: passwordController),
                ksVerticalSmall,
                SignUpConfirmPassField(
                  confirmPasswordController: confirmPasswordController,
                ),
                ksVerticalSmall,
                MyCustomButton(onTap: signUp, text: TxtConstant.signupbtnTxt),
                ksVerticalXLarge,
                SignUpSmallTxtRow(widget: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
