import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/firebase_options.dart';
import 'package:note_nest/presentation/home_screen.dart' show HomeScreen;
import 'package:note_nest/presentation/splash_screen.dart';
import 'package:note_nest/provider/feature_provider.dart/signup_provider.dart';
import 'package:provider/provider.dart';

void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
      MultiProvider(
        providers: [
ChangeNotifierProvider(create: (_)=>SignupProvider()),
ChangeNotifierProvider(create: (_)=>SignupProvider()),
      ],
      /// for using screenUtils package 
      child:ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MyApp();
        },
      ) ,
      )


    
    );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
