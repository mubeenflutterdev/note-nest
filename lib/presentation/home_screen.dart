// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/constant/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final signUpProvider = context.read<SignupProvider>;

    // TextEditingController note_controler = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: double.infinity,
            height: 229.h,
            decoration: BoxDecoration(color: AppColors().profileBackGround),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  // SizedBox(height: 50.h),
                  Text(
                    'Welcome , Oliva Grace',
                    style: TextStyle(
                      color: AppColors().primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good Afternoon',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),

                Text(
                  'Task List',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) => ListTile(
          //       title: Text('titlej akfj ajd al aj a'),
          //       subtitle: Text(
          //         'this is subtitle',
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}




























/////// old code   
///
// TextInputFieldComponent(
            // text: 'Create Note',
            // height: height,
//             width: width,
//             controler: note_controler,
//           ),
//           ButtonComponent(
//             text: 'Create Note',
//             height: height,
//             width: width,
//             ontap: () {
//               final String note = note_controler.text.trim();
//               // final User = FirebaseAuth.instance.currentUser?.uid.toString();
//               try {
//                 FirebaseFirestore.instance.collection("notes").doc().set({
//                   "Note:": note.toString(),
//                   "Created at: ": DateTime.now().toString(),

//                   // "User_uid":User,
//                 });
//               } catch (e) {
//                 debugPrint(e.toString());
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SplashScreen()),
//                 );
//               }
//             },
//           ),
//           Card(
//             color: AppColors().buttonBackGround,
//             child: TextButton(
//               onPressed: () async {
//                 try  {

//                  await FirebaseAuth.instance.signOut().then((value){
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
//                  });
//                 } catch (e) {
//                   debugPrint(e.toString());
//                 }
//               },
//               child: Text('Logout'),
//             ),
//           ),