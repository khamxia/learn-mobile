import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/pages/category/category_page.dart';
import 'package:learn_app/pages/home/home_page.dart';
import 'package:learn_app/pages/order/order_page.dart';
import 'package:learn_app/pages/profile/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
<<<<<<< HEAD
  int selectIdex = 0;
=======
  int selectIndex = 0;
>>>>>>> 2053d0bbedeb7fc6076933f1c5cee4921c6619b9
  List<Widget> _widget = [];

  @override
  void initState() {
    _widget = [
      HomePage(),
      CategoryPage(),
      OrderPage(),
      ProfilePage(),
<<<<<<< HEAD
     
    ];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[selectIdex],
=======
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[selectIndex],
      // body:  selectIndex == 0 ? HomePage(): selectIndex,
>>>>>>> 2053d0bbedeb7fc6076933f1c5cee4921c6619b9
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textColor,
<<<<<<< HEAD
        // unselectedLabelStyle: TextStyle(
        //   color: AppColors.textColor,
        // ),
        // selectedLabelStyle: TextStyle(
        //   color: AppColors.primaryColor,
        // ),

        onTap: (index){
          setState(() {
            selectIdex=index;
          });
        },
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
           label: "ໜ້າຫຼັກ"),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
           label: "ປະເພດ"),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag), 
          label: "ອໍເດິ້"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
           label: "ໂປຣໄຟ")
      ]),
    );
  }
}
=======
        unselectedLabelStyle: TextStyle(color: AppColors.textColor),
        selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
        onTap: (index) {
          // index == 1
          setState(() {
            selectIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "ໜ້າຫຼັກ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "ປະເພດ",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "ອໍເດີ",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "ໂປຣໄພ"),
        ],
      ),
    );
  }
}
>>>>>>> 2053d0bbedeb7fc6076933f1c5cee4921c6619b9
