import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  Future signInUser(String email, String password, String name) async {
    bool isLoading = false;

    try {
      isLoading = true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      String userId = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId.toString());

      docRef.set({
        
        'userId':userId.toString(),
        'name': name.toString(),
        'email': email.toString(),
        'img': '',
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
