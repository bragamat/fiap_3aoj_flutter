import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "LoginPage";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Login Page')));
  }
}
