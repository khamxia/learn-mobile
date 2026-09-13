
import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/pages/home/home_page.dart';

import '../category/category_page.dart';
import '../order/order_page.dart';
import '../profile/profile_page.dart';

class DashbosrdPage extends StatefulWidget {
  const DashbosrdPage({super.key});

  @override
  State<DashbosrdPage> createState() => _DashbosrdPageState();
}

class _DashbosrdPageState extends State<DashbosrdPage> {
  int selectedIndex = 0;
  List<Widget> _Widget = [];


  @override
  void initState() {
    _Widget = [
      HomePage(),
      CategoryPage(),
      OrderPage(),
      ProfilePage(), 
    ] ;
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_Widget[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(color:AppColors.textColor),
        selectedLabelStyle: TextStyle(color:AppColors.primaryColor),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.textColor,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },

        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
        label: "ໜ້າຫຼັກ"),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: "ປະເພດ"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),
          label: "ອໍເດີ"),
        BottomNavigationBarItem(icon: Icon(Icons.person),
          label: "ໂປຣໄຟ"),
        ]
      ) ,
    );
  }
}