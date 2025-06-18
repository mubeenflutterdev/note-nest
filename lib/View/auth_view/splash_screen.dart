// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/constant/app_images.dart';
import 'package:note_nest/View/auth_view/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    //// Media query for responsive design
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * .2),
            Image.asset(AppImages.splashImage),

            /// after image
            SizedBox(height: height * .1),

            Text(
              'Get things done with TODo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // after hadding
            SizedBox(height: height * .07),

            Text(
              'We believe that this will become,\n your\'es best\nReminder and Pocket diary',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            // before button
            SizedBox(height: height * .06),

            ButtonComponent(
              text: 'Get Started',
              height: height,
              width: width,
              ontap: () {
                debugPrint("user click on splash screen button");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/////  button Component  ///////
class ButtonComponent extends StatelessWidget {
  String text;
  double height;
  double width;
  bool? isLoading;
  final VoidCallback ontap;
  ButtonComponent({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.ontap,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.buttonBackGround),
          child: Center(
            child: isLoading == true
                ? CircularProgressIndicator(color: AppColors.primaryColor)
                : Text(
                    text,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
