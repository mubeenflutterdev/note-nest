import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_nest/firebase_options.dart';
import 'package:note_nest/presentation/splash_screen.dart';

void main() async {
  
  runApp(const MyApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
