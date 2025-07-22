import 'package:flutter/material.dart';

class FunProvider with ChangeNotifier {
  bool isLoading = false;
  void onTap() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
