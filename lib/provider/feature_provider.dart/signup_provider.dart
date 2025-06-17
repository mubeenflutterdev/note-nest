// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  Future signInUser(String email, String password, String name) async {
    /// for showing progress indicater if state is loading
    bool isLoading = false;

    try {
      isLoading = true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      /// creating current user virable to store in firestore
      String userId = FirebaseAuth.instance.currentUser!.uid;
      // Creating Document Refrence that stores current user_uid to modify current user profile etc
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId.toString());

      docRef.set({
        'userId': userId.toString(),
        'name': name.toString(),
        'email': email.toString(),
        'img': '',
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    // this will run after try or catch both
    finally {
      isLoading = false;
    }
  }
}
