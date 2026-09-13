import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/widgets/my_text_style.dart';

import '../../constants/app_image.dart';
import '../../constants/data_demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('First name'), Text('ສະບາຍດີ...')],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
              ],
            ),
            SizedBox(height: 10,),
            // ສະເເດງ slide ສິນຄ້າ,ໂຄສະນະ
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
                    child: Image.asset(item, fit: BoxFit.cover,))
                  );
              }).toList(),
              options: CarouselOptions(height: 180,
              viewportFraction : 1,
              autoPlay: true,),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text("ລາຍການສິນຄ້າ",style: myTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 30,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
                ),
                itemBuilder: (context,indwx){
                  return Container(
                    color: Colors.green,
                    child: Text(""),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}