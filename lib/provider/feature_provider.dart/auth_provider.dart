import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  static bool isLoading = false;

  // function for signInuser
  Future signInUser(String email, String password) async {
    try {
      isLoading = true;
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }

  //function for Creating user
  Future signUpUser(String email, String password, String name) async {
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

  /// function for signout user
  Future signOutProvider() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
