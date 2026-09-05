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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool _isShowPassword = false;
  bool isShowpassword = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Welcome Back", style: myTextStyle(fontSize: 20)),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "i am learning flutter",
                    style: myTextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Text('ອີເມວ', style: myTextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintText: 'ປ້ອນອີເມວ',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ກະລຸນາປ້ອນອີເມວ';
                    }
                    if (!value.contains('@')) {
                      return 'ອີເມວບໍ່ຖືກຕ້ອງ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'ລະຫັດຜ່ານ',
                  style: myTextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isShowpassword,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintText: 'ປ້ອນລະຫັດຜ່ານ',
                    prefixIcon: Icon(Icons.lock_clock_sharp),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowpassword = !(isShowpassword);
                          // if (_isShowPassword == true) {
                          //   _isShowPassword = false;
                          // } else {
                          //   _isShowPassword = true;
                          // }
                          print('Show password $isShowpassword');
                        });
                      },
                      child: Icon(
                        // isShowpassword ? Icons.visibility : Icons.visibility_off,
                        isShowpassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      //   if (_emailController.text.isNotEmpty ||
                      //       _passwordController.text.isNotEmpty) {
                      //     print('ກະລຸນາປ້ອນຂໍ້ມູນ');
                      //   } else {
                      //     print('ມີຂໍ້ມູນເເລ້ວ');
                      //   }
                      if (_formKey.currentState!.validate()) {
                        print('ມີຂໍ້ມູນເເລ້ວ');
                      }
                    },
                    child: Text("Login", style: TextStyle()),
                  ),
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
                            builder: (_) => const RegisterPage(),
                          ),
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const RegisterPage(),
                        //   ),
                        // );
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
        ),
      ),
    );
  }
}
