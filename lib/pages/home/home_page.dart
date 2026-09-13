import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/constants/app_image.dart';
import 'package:learn_app/constants/data_demo.dart';
import 'package:learn_app/widgets/my_text_style.dart';

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
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('First name'), Text('ສະບາຍດີ...')],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
              ],
            ),
            // ສະເເດງ slide ສິນຄ້າ,ໂຄສະນະ
            SizedBox(height: 20),
            CarouselSlider(
              items: slidePromotion.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                viewportFraction:
                    0.8, // ສ່ວນຂອງ slide ທີ່ຈະເລີ່ມແລ້ວ ຫຼື ການສະແດງໃນຫນ້າຈໍ
                autoPlayAnimationDuration: Duration(seconds: 1),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Product List',
                style: myTextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context,index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Product ${index + 1}',
                      style: myTextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
