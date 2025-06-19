import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String docId;
  final String userId;
  final String title;
  final String description;
  final String dateTime;

  NoteModel({
    required this.docId,
    required this.userId,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  // Convert Firestore data to Dart object
  factory NoteModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return NoteModel(
      docId: documentId,
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      dateTime: data['dateTime'] ?? '',
    );
  }

  // Convert Dart object to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'dateTime': dateTime,
    };
  }
}
