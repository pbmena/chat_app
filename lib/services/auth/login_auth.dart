import 'package:flutter/material.dart';
import 'package:chat_app/ui/view/signin/signin_page.dart';
import 'package:chat_app/ui/view/signup/signup_page.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  bool isLogin = true;

  void toggleScreen() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return SignInPage(onTap: toggleScreen);
    } else {
      return SignUpPage(onTap: toggleScreen);
    }
  }
}
