import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quick_chat/utils/api/api.dart';
import 'package:quick_chat/view/auth/login_screen.dart';
import 'package:quick_chat/view/home.dart';

class SplashService {
  void isLogin(BuildContext context) {
    final user = API.auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 9),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeView())));
    } else {
      Timer(
          const Duration(seconds: 9),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
  }
}
