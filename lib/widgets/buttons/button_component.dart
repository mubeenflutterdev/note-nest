import 'package:flutter/material.dart';
import 'package:note_nest/constant/app_colors.dart';

class ButtonComponent extends StatelessWidget {
  String text;
  double height;
  double width;
  final VoidCallback ontap;
  ButtonComponent({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.buttonBackGround),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
