import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_app/constants/app_color.dart';
import 'package:learn_app/pages/order/provider/order_logic.dart';
import 'package:learn_app/utils/date_picker.dart';
import 'package:learn_app/utils/modal_sheet.dart';
import 'package:learn_app/widgets/my_text_field.dart';
import 'package:learn_app/widgets/my_text_style.dart';
import 'package:provider/provider.dart';

import '../../utils/date_format.dart';
import '../../utils/my_image_picker.dart';
import '../../utils/price_format.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _titleControll = TextEditingController();
  final TextEditingController _desControll = TextEditingController();
  final TextEditingController _percentControll = TextEditingController();
  final TextEditingController _priceControll = TextEditingController();
  final TextEditingController _stokeControll = TextEditingController();
  final TextEditingController _dateControll = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  File? file;
  final List<String> brands = [
    "Essence",
    "Glamour Beauty",
    "Velvet Touch",
    "Chic Cosmetics",
    "Nail Couture",
  ];

  @override
  void dispose() {
    super.dispose();
    _titleControll.dispose();
    _percentControll.dispose();
    _priceControll.dispose();
    _desControll.dispose();
    _stokeControll.dispose();
    _dateControll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
      child: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ຊື່ສິນຄ້າ', style: myTextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            MyTextField(
              controller: _titleControll,
              hintText: 'ປ້ອນຊື່ສິນຄ້າ',
              validator: (v) {
                if (v!.isEmpty) {
                  return "ກະລຸນາປ້ອນຊື້ສິນຄ້າ";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Text('ລາຄາ', style: myTextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            MyTextField(
              controller: _priceControll,
              hintText: 'ປ້ອນລາຄາ',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PriceInputFormatter(),
              ],
              validator: (v) {
                if (v!.isEmpty) {
                  return "ກະລຸນາປ້ອນລາຄາ";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Text(
              'ຈຳນວນສິນຄ້າ',
              style: myTextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: _stokeControll,
              hintText: 'ປ້ອນຈຳນວນສິນຄ້າ...',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PriceInputFormatter(),
              ],
              validator: (v) {
                if (v!.isEmpty) {
                  return "ກະລຸນາປ້ອນຈຳນວນ";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Text(
              'ເປີເຊັນສ່ວນຫຼຸດ',
              style: myTextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: _percentControll,
              hintText: 'ປ້ອນເປີເຊັນສ່ວນຫຼຸດ...',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PriceInputFormatter(),
              ],
              validator: (v) {
                if (v!.isEmpty) {
                  return "ກະລຸນາປ້ອນສ່ວນຫຼຸດ";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Text(
              'ວັນທີເພີ່ມສິນຄ້າ',
              style: myTextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: _dateControll,
              readOnly: true,
              hintText: 'ເລືອກວັນທີ...',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PriceInputFormatter(),
              ],
              onTap: () async {
                print('onTap');
                final DateTime? date = await myDatePicker(
                  context,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2050),
                );
                if (date != null) {
                  final String? convertDate = DateFormatter.dateFormatter(date);
                  if (convertDate != null) {
                    _dateControll.text = convertDate;
                  }
                }
              },
              validator: (v) {
                if (v!.isEmpty) {
                  return "ກະລຸນາເລືອກວັນທີກ່ອນ";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Text('ລາຍລະອຽດ', style: myTextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            MyTextField(
              controller: _desControll,
              hintText: 'ປ້ອນລາຍລະອຽດ...',
              maxLine: 3,
            ),
            SizedBox(height: 10),
            Text('ຮູບສິນຄ້າ', style: myTextStyle(fontWeight: FontWeight.w600)),
            GestureDetector(
              onTap: () async {
                final _file = await showImageSorceSheet(context);
                if (_file != null) {
                  setState(() {
                    file = _file;
                  });
                }
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: AppColors.grayColor),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Text(
                      'ເລືອກຮູບສິນຄ້າ PNG,JPG,JPEG',
                      style: myTextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            if (file != null) Image.file(file!, width: 100, height: 100),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // ບ່ອນເພີ່ມສິນຄ້າ
                  if (_globalKey.currentState!.validate()) {
                    //
                    context.read<OrderLogic>().addProduct(
                      context: context,
                      producName: _titleControll.text,
                      price: _priceControll.text,
                      stock: _stokeControll.text,
                      discount: _percentControll.text,
                      brand: "Brand",
                      desc: _desControll.text,
                    );
                  }
                },
                child: Text(
                  "ເພີ່ມສິນຄ້າ",
                  style: myTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
