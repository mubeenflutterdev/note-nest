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

  oninIt(BuildContext context) {
    getNotes(context);
  }

  /// get notes
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

      NoteModel noteModel = NoteModel(
        docId: docRef.id,
        userId: userId,
        title: title,
        description: description,
        dateTime: DateTime.now().toString(),
      );
      await docRef.set(noteModel.toFirestore()).then((_) {
        Navigator.pop(context);
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

  // delete notes
  Future<void> deleteNote(BuildContext context, docId) async {
    try {
      await _firestore.collection('notes').doc(docId).delete();
      notifyListeners();
      getNotes(context);
    } catch (_e) {
      ToastUtil.showToast(
        context,
        message: _e.toString(),
        type: ToastType.error,
      );
    }
  }

  // delete notes
  Future<void> editeNote(
    BuildContext context,
    String docId,
    String title,
    String description,
  ) async {
    try {
      await _firestore.collection('notes').doc(docId).update({
        'title': title,
        'description': description,
      });
      notifyListeners();
      getNotes(context);
    } catch (_e) {
      ToastUtil.showToast(
        context,
        message: _e.toString(),
        type: ToastType.error,
      );
    }
  }
}
