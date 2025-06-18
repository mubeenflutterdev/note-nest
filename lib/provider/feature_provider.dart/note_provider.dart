import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/utils/toast_utils.dart';

class NoteProvider with ChangeNotifier {
  bool _isLoading = false;
  final _firestore = FirebaseFirestore.instance;

  Future addNote(BuildContext context, String title, String description) async {
    try {
      _isLoading = true;

      /// current user
      String userId = FirebaseAuth.instance.currentUser!.uid;

      /// docRefrence
      DocumentReference docRef = await _firestore
          .collection('notes')
          .doc(userId.toString());
      docRef.set({
        "title ": title.toString(),
        "dateTime ": DateTime.now().toString(),
        "description": description.toString(),
        "userId ": userId.toString(),
      });
      //
      // await FirebaseFirestore.instance
      //     .collection('notes')
      //     .doc()
      //     .set({
      //       'title': text.toString(),

      //       // 'docId': text.toString()
      //       // 'title': text.toString()
      //     })
      //     .then((_) {
      //       ToastUtil.showToast(
      //         context,
      //         message: "Note Added Sucessfully",
      //         type: ToastType.success,
      //       );
      //     });
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }
}
