import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_app/utils/my_image_picker.dart';
import 'package:learn_app/widgets/my_text_style.dart';

Future<File?> showImageSorceSheet(BuildContext context) async {
  final ImageSource? source = await showModalBottomSheet<ImageSource>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14)
    ),
    builder: (context) {
      return SafeArea(
        child: SizedBox(
          height:  500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(
                  'ກ້ອງຖ່າຍຮູບ',
                  style: myTextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () => Navigator.pop(context,ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  'ຄັງຮູບ',
                  style: myTextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        ),
      );
    },
  );
  if (source == null) return null;
  return myImagePicker(source: source);
}
