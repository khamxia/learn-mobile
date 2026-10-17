import 'package:flutter/material.dart';
import 'package:learn_app/pages/login/provider/login_logic.dart';
import 'package:learn_app/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_color.dart';
import '../../../widgets/my_text_style.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _firstNameControl = TextEditingController();
  final TextEditingController _lastNameControl = TextEditingController();
  final TextEditingController _age = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() {
    final user = context.read<LoginLogic>().loginState.userModel;
    print('user ===>${user}');
    _firstNameControl.text = user?.firstName ?? "";
    _lastNameControl.text = user?.lastName ?? "";
    _age.text = user?.age.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'ອັບເດດຂໍ້ມູນສ່ວນຕົວ',
          style: myTextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ຊື່', style: myTextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            MyTextField(
              controller: _firstNameControl,
              keyboardType: TextInputType.number,
              hintText: 'ປ້ອນຊື່ຂອງທ່ານ',
              validator: (v) {
                if (v == null) {
                  return 'ກະລຸນາປ້ອນຊື່ຂອງທ່ານກ່ອນ';
                }
                return null;
              },
            ),


          ],
        ),
      ),
    );
  }
}
