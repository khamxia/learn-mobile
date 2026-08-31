import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/widgets/my_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Home page",
          style: myTextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Column(
        children: [
          Text("Welcome Back", style: myTextStyle(fontSize: 20)),
          Text("i am learning flutter", style: myTextStyle(fontSize: 20)),
          TextFormField(controller: _emailController),
          TextFormField(controller: _passwordController),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
            ),
            onPressed: () {},
            child: Text("Login", style: TextStyle()),
          ),
          Divider(color: AppColors.grayColor),
          Row(
            children: [
              Text('Don\'t have an account?'),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
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
    );
  }
}
