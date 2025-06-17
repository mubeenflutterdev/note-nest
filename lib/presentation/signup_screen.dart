// ignore_for_file: non_constant_identifier_names, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';

import 'package:note_nest/presentation/login_in_Screen.dart';
import 'package:note_nest/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

import '../provider/feature_provider.dart/signup_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    TextEditingController emailControler = TextEditingController();
    TextEditingController nameControler = TextEditingController();
    TextEditingController passwordControler = TextEditingController();
    TextEditingController ConfromControler = TextEditingController();
    final signUpProvider = context.read<SignupProvider>;
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Center(
        child: Column(
          children: [
            /// first sized box
            SizedBox(height: height * .15),
            Text(
              'Welcome onboard!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            /// second sized box
            SizedBox(height: height * .016),

            Text(
              'Let’s help you meet your tasks',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: height * 0.1),

            TextInputFieldComponent(
              text: 'Enter your full name ',
              height: height,
              width: width,
              controler: nameControler,
            ),

            /// sized box
            SizedBox(height: height * 0.02),
            TextInputFieldComponent(
              text: 'Enter your email ',
              height: height,
              width: width,
              controler: emailControler,
            ),

            /// sized box
            SizedBox(height: height * 0.02),
            TextInputFieldComponent(
              text: 'Enter password ',
              height: height,
              width: width,
              controler: passwordControler,
            ),

            /// sized box
            SizedBox(height: height * 0.02),
            TextInputFieldComponent(
              text: 'Confrom password',
              height: height,
              width: width,
              controler: ConfromControler,
            ),
            // sized box
            SizedBox(height: height * 0.09),
            ButtonComponent(
              text: "Register",
              height: height,
              width: width, 
              ontap: () async {
                String email = emailControler.text.toString();
                var password = passwordControler.text.toString();
                String name = nameControler.text.trim();
                signUpProvider().signInUser(email, password, name);

                // try {
                //   FirebaseAuth.instance
                //       .createUserWithEmailAndPassword(
                //         email: email,
                //         password: password,
                //       )
                //       .then((value) {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => HomeScreen()),
                //         );
                //       });
                // } catch (e) {
                //   debugPrint(e.toString());
                // }
              },
            ),
            SizedBox(height: height * 0.029),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account ?'),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ),
                  child: Text(
                    'Sign In',
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
    );
  }
}

/// Input Component
class TextInputFieldComponent extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  TextEditingController controler = TextEditingController();

  TextInputFieldComponent({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.controler,
  });

  @override
  State<TextInputFieldComponent> createState() =>
      _TextInputFieldComponentState();
}

class _TextInputFieldComponentState extends State<TextInputFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
      child: TextFormField(
        controller: widget.controler,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors().primaryColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.height * .015,
            horizontal: widget.width * .08,
          ),
          hintText: widget.text,
          hintStyle: TextStyle(fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.width * 0.2),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.width * 0.2),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }
}
