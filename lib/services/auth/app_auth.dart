import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/services/auth/login_auth.dart';
import 'package:chat_app/ui/view/home/home_page.dart';

class AppAuth extends StatelessWidget {
  const AppAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginAuth();
          }
        },
      ),
    );
  }
}
