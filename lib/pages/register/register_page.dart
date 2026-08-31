import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Register Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [Text("Welcome Back"), Text("create your account")],
      ),
    );
  }
}
