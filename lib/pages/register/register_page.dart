import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/my_text_style.dart';

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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "ລົງທະບຽນ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ລົງທະບຽນ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "ສ້າງບັນຊີຂອງທ່ານ",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Text('ຊື່ຜູ້ໃຊ້', style: myTextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            MyTextField(
              controller: _usernameController,
              hintText: 'ປ້ອນຊື່ຜູ້ໃຊ້',
              prefixIcon: Icons.person,
            ),
            SizedBox(height: 10),
            Text('ອີເມວ', style: myTextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            MyTextField(
              controller: _emailController,
              hintText: 'ປ້ອນອີເມວ',
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 10),
            Text('ລະຫັດຜ່ານ', style: myTextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            MyTextField(
              controller: _passwordController,
              hintText: 'ປ້ອນລະຫັດຜ່ານ',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "ລົງທະບຽນ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
