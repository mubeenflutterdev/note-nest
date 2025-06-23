import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  updateProfileImagw(){
  String iamgePicker = FirebaseAuth.instance.currentUser!.uid;
  
    
  }
}
