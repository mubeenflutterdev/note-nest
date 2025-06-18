import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/View/auth_view/signup_screen.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/provider/feature_provider.dart/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  TextEditingController titleControler = TextEditingController();

  TextEditingController descriptionControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider = context.read<NoteProvider>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Create Note',
              style: TextStyle(
                color: AppColors.buttonBackGround,
                fontSize: 29.sp,
              ),
            ),
            TextInputFieldComponent(
              text: 'Title',
              height: 5.h,
              width: 5.w,
              controler: titleControler,
            ),
            SizedBox(height: 10.h),
            TextInputFieldComponent(
              text: 'Dscription',
              height: 5.h,
              width: 5.w,
              controler: descriptionControler,
            ),
            TextButton(
              onPressed: () {
                noteProvider.addNote(
                  context,
                  titleControler.text.toString(),
                  descriptionControler.text.toString(),
                );
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
