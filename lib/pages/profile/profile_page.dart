import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/pages/profile/components/profile_detail.dart';
import 'package:learn_app/widgets/my_text_style.dart';
import 'package:provider/provider.dart';

import '../login/login_page.dart';
import '../login/provider/login_logic.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginLogic>(
      builder: (context, state, child) {
        final user = state.loginState.userModel;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  user?.image ?? "",
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '${user?.firstName} ${user?.lastName}',
                style: myTextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                '${user?.username} ${user?.age}',
                style: myTextStyle(color: AppColors.textColor),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(width: 1, color: AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileDetail()),
                    );
                  },
                  child: Text('ຂໍ້ມູນສ່ວນຕົວ'),
                ),
              ),
              SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(width: 1, color: AppColors.primaryColor),
                  ),
                  onPressed: () {
                    context.read<LoginLogic>().clearToken();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  },
                  child: Text('ອອກຈາກລະບົບ'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
