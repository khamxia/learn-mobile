import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:provider/provider.dart';
import '../provider/home_logic.dart';

class BadgesProduct extends StatelessWidget {
  const BadgesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeLogic>().homeState;
    return badges.Badge(
      badgeContent: Text('${(state.cartList ?? []).length}', style: TextStyle(color: AppColors.whiteColor)),
      child: Icon(Icons.shopping_cart_checkout_rounded),
    );
  }
}