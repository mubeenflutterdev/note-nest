import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Under Working Comming Soon,,,,',
              style: TextStyle(fontSize: 30, color: AppColors.buttonBackGround),
            ),
          ),
        ],
      ),
    );
  }
}
