import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/my_image_picker.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 100, left: 16, right: 16),
      child: Column(
        children: [
          if (file != null) Image.file(file!, width: 150, height: 150),

          TextButton(
            onPressed: () async {
              final _file = await myImagePicker(source: ImageSource.gallery);
              if (_file != null) {
                setState(() {
                  file = _file;
                });
              }
            },
            child: Text('ເລືອກຮູບ'),
          ),
          TextButton(
            onPressed: () {
              myImagePicker(source: ImageSource.camera);
            },
            child: Text('ຖ່າຍຮູບ'),
          ),
        ],
      ),
    );
  }
}
