// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    // TextEditingController note_controler = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notes')
                .doc('bwHen79qdSADgtvkmqEc')
                .snapshots(),
            builder: (context, snapshot) {
              try {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CupertinoActivityIndicator();
                }
                if (snapshot.hasError) {
                  Text("Something Went Wrong  Go to console for details");
                }
                if (snapshot.hasData && snapshot.data != null) {
                  return Text(snapshot.data!['note'].toString());
                  // return Expanded(
                  //   child: (
                  //     ListView.builder(
                  //       itemCount: 1,
                  //       itemBuilder: (context, index) {
                  //         return ListTile(title: Text(snapshot.data![index]['Note'].toString()),);

                  //     },)
                  //   ),

                  // );
                }
              } catch (e) {
                debugPrint(e.toString());
              }

              return Container();
            },
          ),
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