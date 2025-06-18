import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String title;
  String description;
  String dateTime;
  String userId;
  String docId;
  NoteModel({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.userId,
    required this.docId,
  });
  // Convert Firestore Document to NoteModel
  factory NoteModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return NoteModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      dateTime: data['dateTime'] ?? '',
      userId: data['userId'] ?? '',
      docId: data['docId'] ?? '',
    );
  }
  // Convert NoteModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {'title': title,
    'description':description,
    'dateTime':dateTime,
    'userId':userId,
    'docId':docId,
    
    
    
    };
  }
}
