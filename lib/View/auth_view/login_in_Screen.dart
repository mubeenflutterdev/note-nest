// ignore_for_file: file_names, use_build_context_synchronously, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/constant/app_images.dart';
import 'package:note_nest/View/auth_view/forget_password_screen.dart';
import 'package:note_nest/View/user_view/home_screen.dart';
import 'package:note_nest/View/auth_view/signup_screen.dart';
import 'package:note_nest/View/auth_view/splash_screen.dart';
import 'package:note_nest/provider/feature_provider.dart/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    TextEditingController _emailControler = TextEditingController();
    TextEditingController _passwordControler = TextEditingController();
    AuthenticationProvider authProvider = context
        .read<AuthenticationProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// first sized box
              SizedBox(height: height * .1),
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

              /// second sized box
              SizedBox(height: height * .016),

              Text(
                'Let’s help you meet your tasks',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: height * .02),

              ////// image of login
              Image.asset(AppImages.loginImage),

              /// sized box
              SizedBox(height: height * 0.02),
              TextInputFieldComponent(
                text: 'Enter your email ',
                height: height,
                width: width,
                controler: _emailControler,
              ),

              /// sized box
              SizedBox(height: height * 0.05),
              TextInputFieldComponent(
                text: 'Enter your password',
                height: height,
                width: width,
                controler: _passwordControler,
              ),
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPasswordScreen(),
                  ),
                ),
                child: Text(
                  'Forget Password!',
                  style: TextStyle(
                    color: AppColors.buttonBackGround,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // sized box
              SizedBox(height: height * 0.04),

              Consumer<AuthenticationProvider>(
                builder: (context, provider, child) => ButtonComponent(
                  text: "Login",
                  height: height,
                  isLoading: provider.isLoading,
                  width: width,
                  ontap: () {
                    provider.signInUser(
                      context,
                      _emailControler.text.trim(),
                      _passwordControler.text,
                    );
                  },
                ),
              ),

              SizedBox(height: height * 0.029),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account ?'),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      authProvider.signInUser(
                        context,
                        _emailControler.text.trim().toString(),
                        _passwordControler.text.toString(),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.buttonBackGround,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
