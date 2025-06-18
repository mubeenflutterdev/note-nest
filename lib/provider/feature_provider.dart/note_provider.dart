import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/models/note_model.dart';
import 'package:note_nest/utils/toast_utils.dart';

class NoteProvider with ChangeNotifier {
  bool _isLoading = false;
  final _firestore = FirebaseFirestore.instance;

  final List noteList = [];
  final _userId = FirebaseAuth.instance.currentUser?.uid;
  Future getNote(BuildContext context) async {
    _isLoading = true;
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('notes')
          .where('userId', isEqualTo: _userId)
          .get();

      List<NoteModel> fetchNotes = snapshot.docs.map((doc) {
        return NoteModel.fromFirestore(doc);
      }).toList();

      noteList.addAll([fetchNotes]);
      print(noteList.toString());
    } catch (_e) {
      ToastUtil.showToast(
        context,
        message: _e.toString(),
        type: ToastType.error,
      );
    }
  }

  //
  Future addNote(BuildContext context, String title, String description , 
  string) async {
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
        "docId ": docRef.id.toString(),
      });
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }
}
