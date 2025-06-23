import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_nest/utils/toast_utils.dart';

class AddProfileImageProvider with ChangeNotifier {
  File? selectedImage;

  void pickerFromGallery(BuildContext context) async {
    try {
      final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (returnedImage != null) {
        selectedImage = File(returnedImage.path);
        notifyListeners();
        print('**********************************${selectedImage?.path}');
      }
    } catch (_e) {
      print(_e.toString());
      ToastUtil.showToast(
        context,
        message: _e.toString(),
        type: ToastType.error,
      );
    }
  }

  void pickerFromCamera(BuildContext context) async {
    try {
      final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (returnedImage != null) {
        selectedImage = File(returnedImage.path);
        notifyListeners();
        print('**********************************${selectedImage?.path}');
      }
    } catch (_e) {
      print(_e.toString());
      ToastUtil.showToast(
        context,
        message: _e.toString(),
        type: ToastType.error,
      );
    }
  }
}
