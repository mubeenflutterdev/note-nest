// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/View/auth_view/signup_screen.dart';
import 'package:note_nest/constant/app_colors.dart';

import 'package:note_nest/provider/feature_provider.dart/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  final String? title;
  final String? description;
  bool? edit;
  String? docId;
  AddNoteScreen({
    super.key,
    this.title,
    this.description,
    this.edit,
    this.docId,
  }
  );

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleControler = TextEditingController();

  TextEditingController descriptionControler = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleControler = TextEditingController(text: widget.title);
    descriptionControler = TextEditingController(text: widget.description);
  }

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
                widget.edit == false
                    ? noteProvider.addNote(
                        context,
                        titleControler.text.toString(),
                        descriptionControler.text.toString(),
                      )
                    : noteProvider.editeNote(
                        context,
                        widget.docId.toString(),
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
