import 'package:flutter/material.dart';

class MyCustomSnackBar {
  MyCustomSnackBar._();
  static buildErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
