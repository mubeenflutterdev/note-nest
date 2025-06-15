import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/presentation/login_Screen.dart';
import 'package:note_nest/presentation/signup_screen.dart';
import 'package:note_nest/presentation/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    TextEditingController note_controler = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextInputFieldComponent(
            text: 'Create Note',
            height: height,
            width: width,
            controler: note_controler,
          ),
          ButtonComponent(
            text: 'Create Note',
            height: height,
            width: width,
            ontap: () {
              final String note = note_controler.text.trim();
              // final User = FirebaseAuth.instance.currentUser?.uid.toString();
              try {
                FirebaseFirestore.instance.collection("notes").doc().set({
                  "Note:": note.toString(),
                  "Created at: ": DateTime.now().toString(),

                  // "User_uid":User,
                });
              } catch (e) {
                debugPrint(e.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              }
            },
          ),
          Card(
            color: AppColors().buttonBackGround,
            child: TextButton(
              onPressed: () async {
                try  {

                 await FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                 });
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
