import 'package:flutter/material.dart';
import 'package:learn_app/widgets/my_text_style.dart';

import '../../constants/app_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
                  child: Text("Welcome Back", style: myTextStyle(fontSize: 20)),
                ),
                 Center(
                  child: Text("create your account", style: myTextStyle(fontSize: 20)),
                ),
            // Text("Welcome Back"),
            // Text("create your account"),
            SizedBox(height: 20),
            Text(
                  'ຊື່ຜູ້ໃຊ້',
                  style: myTextStyle(fontWeight: FontWeight.w600),
                ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'username',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),
             Text('ອີເມວ', style: myTextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
                  'ລະຫັດຜ່ານ',
                  style: myTextStyle(fontWeight: FontWeight.w600),
                ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
    
                SizedBox(height: 20),
                Center(
                  
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle registration logic here
                      backgroundColor: AppColors.primaryColor;
                    },
                    child: Text('Register', style: TextStyle()),
                  ),
                ),
            
          ],
        ),
        
      ),
    );
  }
}
