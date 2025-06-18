import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/View/auth_view/signup_screen.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextInputFieldComponent(
            text: 'Title',
            height: 5.h,
            width: 5.w,
            controler: title,
          ),
          TextInputFieldComponent(
            text: 'Dscription',
            height: 5.h,
            width: 5.w,
            controler: description,
          ),
        ],
      ),
    );
  }
}
