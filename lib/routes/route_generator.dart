import 'package:flutter/material.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/services/auth/app_auth.dart';
import 'package:chat_app/ui/view/chat/chat_page.dart';
import 'package:chat_app/ui/view/home/home_page.dart';
import 'package:chat_app/ui/view/signin/signin_page.dart';
import 'package:chat_app/ui/view/signup/signup_page.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.initial:
        return PageTransition(
          child: const AppAuth(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.loginPage:
        return PageTransition(
          child: const SignInPage(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.homePage:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.registerPage:
        return PageTransition(
          child: const SignUpPage(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.chatPage:
        ChatPage argument = args as ChatPage;
        return PageTransition(
          child: ChatPage(
            receiverUserEmail: argument.receiverUserEmail,
            receiverUserID: argument.receiverUserID,
          ),
          type: PageTransitionType.fade,
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(
              'Route not found!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}
