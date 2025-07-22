import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:note_nest/utils/toast_utils.dart';

class ProfileProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String profileImage = '';

  final _firestore = FirebaseFirestore.instance;
  Future getUserProfile(BuildContext context) async {
    String userId = await FirebaseAuth.instance.currentUser!.uid.toString();
    _isLoading = true;
    notifyListeners();

    try {
      final documentSnapshot = await _firestore
          .collection('users')
          .doc(userId.toString())
          .get();

      profileImage = documentSnapshot['img'];
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future updateProfileImagw(BuildContext context, File? selectedImage) async {
    String userId = await FirebaseAuth.instance.currentUser!.uid.toString();

    Reference storageRef = FirebaseStorage.instance.ref().child(
      "profileImages/$userId.jpg",
    );
    UploadTask uploadTask = storageRef.putFile(selectedImage!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    print('Download url is ${downloadURL.toString()}');

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'img': downloadURL.toString(),
    });
    getUserProfile(context);
    try {
      // UploadTask uploadTask = storageRef.putFile();
    } catch (_e) {
      ToastUtil.showToast(context, message: _e.toString());
    }
  }
}
