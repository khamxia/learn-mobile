import 'package:flutter/material.dart';
import 'package:learn_app/pages/register/register_page.dart';

import '../../constants/app_color.dart';
import '../../widgets/my_text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Text("Welcome Back", style: myTextStyle(fontSize: 20)),
            Text("i am learning flutter", style: myTextStyle(fontSize: 14)),
            SizedBox(height: 20),
            TextFormField(controller: _emailController, decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),),
            SizedBox(height: 10),
            TextFormField(controller: _passwordController, decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),),
            SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
              ),
              onPressed: () {},
              child: Text("Login", style: TextStyle()),
            ),
            Divider(color: AppColors.grayColor),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: myTextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
