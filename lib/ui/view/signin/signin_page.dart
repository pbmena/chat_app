import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/components/w_components.dart';
import 'package:chat_app/services/auth/service_auth.dart';
import 'package:chat_app/ui/constants/app_constant.dart';
import 'package:chat_app/ui/utils/spacings.dart';
import 'package:chat_app/ui/view/signin/components/sn_components.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<ServiceAuth>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
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
                SignInEmailField(emailController: emailController),
                ksVerticalSmall,
                SignInPasswordField(passwordController: passwordController),
                ksVerticalSmall,
                MyCustomButton(onTap: signIn, text: TxtConstant.signinbtnTxt),
                ksVerticalXLarge,
                SignInSmallTxtRow(widget: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
