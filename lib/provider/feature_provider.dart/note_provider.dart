import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/models/note_model.dart';
import 'package:note_nest/utils/toast_utils.dart';

class NoteProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _firestore = FirebaseFirestore.instance;
  final List<NoteModel> noteList = [];

  final String? _userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> getNotes(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      noteList.clear();
      final querySnapshot = await _firestore
          .collection('notes')
          .where('userId', isEqualTo: _userId)
          .get();

      for (var doc in querySnapshot.docs) {
        noteList.add(NoteModel.fromFirestore(doc.data(), doc.id));
      }
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

  /// Add a new note
  Future<void> addNote(
    BuildContext context,
    String title,
    String description,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();

      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference docRef = _firestore.collection('notes').doc();

      await docRef.set({
        "title": title,
        "description": description,
        "dateTime": DateTime.now().toIso8601String(),
        "userId": userId,
        "docId": docRef.id,
      });

      // Optionally, refresh the list
      await getNotes(context);
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
}
