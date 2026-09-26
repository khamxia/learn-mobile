import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/pages/cart/cart_page.dart';
import 'package:learn_app/pages/home/components/badges_product.dart';
import 'package:learn_app/widgets/my_text_style.dart';
import 'package:provider/provider.dart';

import '../../constants/app_image.dart';
import '../../constants/data_demo.dart';
import 'components/product_list.dart';
import 'provider/home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      context.read<HomeLogic>().getListProduct();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
        child: Column(
          children: [
            // ສະເເດງຂໍ້ມູນສ່ວນ profile , action
            Row(
              children: [
                Container(
                  
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(AppImage.logo),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('First name'), Text('ສະບາຍດີ...')],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CartPage()),
                      );
                  },
                  child: BadgesProduct()
                ),
                
              ],
            ),
            // ສະເເດງ slide ສິນຄ້າ,ໂຄສະນະ
            SizedBox(height: 10),
            CarouselSlider(
              items: slidePromotion.map((item) {
                return Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                     child: Image.asset(item, fit: BoxFit.cover),
                  ),
                 );
              }).toList(),
              options: CarouselOptions(
                height: 180,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 10),
              autoPlay: true,
              //autoplayAnimationDuration: Duration(seconds: 2),
              )
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ລາຍການສິນຄ້າ', 
                style: myTextStyle(fontWeight: FontWeight.w600)),
            ),

            // GridView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   itemCount: 30,
            //   shrinkWrap: true,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 10,
            //     crossAxisSpacing: 10,
            //   ),
            //   itemBuilder:(context, index) {
            //     return Container(
            //       color: Colors.green,
            //       child: Text('index: $index'),
            //     );
            //   },
            // ),
            ProductList(),
          ],
        ),
      ),
    );
  }
}