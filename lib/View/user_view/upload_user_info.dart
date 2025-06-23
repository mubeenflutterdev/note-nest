import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_nest/utils/toast_utils.dart';

class ProfileImageScreen extends StatefulWidget {
  const ProfileImageScreen({super.key});

  @override
  State<ProfileImageScreen> createState() => _ProfileImageScreenState();
}

class _ProfileImageScreenState extends State<ProfileImageScreen> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              _imagePickerFromGallery();
            },
            child: Text('Upload from gallery'),
          ),
          // ignore: unnecessary_null_comparison
          SizedBox(
            child: _selectedImage != null
                ? Image.file(_selectedImage!)
                : Text('Upload Image'),
          ),
        ],
      ),
    );
  }

  Future _imagePickerFromGallery() async {
    try {
      final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        if (returnedImage != null) {
          _selectedImage = File(returnedImage.path);
        }
      });
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
