// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:note_nest/View/auth_view/signup_screen.dart';
import 'package:note_nest/View/auth_view/splash_screen.dart';
import 'package:note_nest/provider/feature_provider.dart/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController _fEmailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthenticationProvider>;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Enter gmail to continue forgeting: process'),
            TextInputFieldComponent(
              text: 'Email:',
              height: 10.h,
              width: 10.w,
              controler: _fEmailControler,
            ),
            ButtonComponent(
              text: "Send",
              height: 19.h,
              width: 10.w,
              ontap: ()  {
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
