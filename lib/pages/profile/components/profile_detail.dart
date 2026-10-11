import 'package:flutter/material.dart';
import 'package:learn_app/pages/login/provider/login_logic.dart';
import 'package:learn_app/pages/profile/components/title_list.dart';
import 'package:learn_app/pages/profile/components/update_profile.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_color.dart';
import '../../../widgets/my_text_style.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'ຂໍ້ມູນສ່ວນຕົວ',
          style: myTextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      body: Consumer<LoginLogic>(
        builder: (context, state, child) {
          final user = state.loginState.userModel;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        user?.image ?? "",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: AppColors.whiteColor),
                  child: Column(
                    children: [
                      TitleList(
                        title: 'ຊື່ ເເລະ ນາມສະກຸນ',
                        vaule: '${user?.firstName} ${user?.lastName}',
                      ),
                      SizedBox(height: 10),
                      TitleList(title: 'ຊື່ຜູ້ໃຊ້', vaule: '${user?.username}'),
                      SizedBox(height: 10),
                      TitleList(title: 'ອາຍຸ', vaule: '${user?.age}'),
                      SizedBox(height: 10),
                      TitleList(
                        title: 'ທີ່ຢູ່',
                        vaule:
                            '${user?.address?.country} ${user?.address?.city}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  width: 1,color: AppColors.primaryColor
                )
              ),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UpdateProfile()),
              // );
            },
            child: Text(
              'ເເກ້ໄຂຂໍ້ມູນສ່ວນຕົວ',
              style: myTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
