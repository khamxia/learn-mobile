import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> myImagePicker({required ImageSource source}) async {
  ImagePicker imagePicker = ImagePicker();
  try {
    final XFile? xfile = await imagePicker.pickImage(source: source);
    if (xfile != null) {
      final File file = File(xfile.path);
      print('path ---->${file.path}');
      return file;
    }
  } catch (e) {
    return null;
  }
  return null;
}
