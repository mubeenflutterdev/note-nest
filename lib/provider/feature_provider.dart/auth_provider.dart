import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/View/user_view/home_screen.dart';
import 'package:note_nest/utils/toast_utils.dart';

class AuthenticationProvider with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  bool isLoading = false;

  // function for signInuser
  Future signInUser(BuildContext context, email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
     await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          );
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //function for Creating user
  Future signUpUser(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
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

      docRef
          .set({
            'userId': userId.toString(),
            'name': name.toString(),
            'email': email.toString(),
            'img': '',
          })
          .then(
            (_) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          );
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
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
