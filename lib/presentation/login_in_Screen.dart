// ignore_for_file: file_names, use_build_context_synchronously, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/constant/app_images.dart';
import 'package:note_nest/presentation/forget_password_screen.dart';
import 'package:note_nest/presentation/home_screen.dart';
import 'package:note_nest/presentation/signup_screen.dart';
import 'package:note_nest/presentation/splash_screen.dart';

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
    TextEditingController emailControler = TextEditingController();
    TextEditingController passwordControler = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
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
              Image.asset(AppImages().loginImage),

              /// sized box
              SizedBox(height: height * 0.02),
              TextInputFieldComponent(
                text: 'Enter your email ',
                height: height,
                width: width,
                controler: emailControler,
              ),

              /// sized box
              SizedBox(height: height * 0.05),
              TextInputFieldComponent(
                text: 'Enter your password',
                height: height,
                width: width,
                controler: passwordControler,
              ),
              SizedBox(height: height * 0.02),
             GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                    ),
                    child: Text(
                      'Forget Password!',
                      style: TextStyle(
                        color: AppColors().buttonBackGround,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            
              
              // sized box
              SizedBox(height: height * 0.04),
              ButtonComponent(
                text: "Login",
                height: height,
                width: width,
                ontap: () {
                  var email = emailControler.text.trim();
                  var password = passwordControler.text.trim();
                  User? currentUser = FirebaseAuth.instance.currentUser;
                  try {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        )
                        .then((value) {});
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        )
                        .then((value) {
                          debugPrint("Created");

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        });
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              SizedBox(height: height * 0.029),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account ?'),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors().buttonBackGround,
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
