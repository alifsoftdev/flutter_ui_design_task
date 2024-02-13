import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appColor.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:flutter_ui_design_task/views/auth/controller/AuthController.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? titleText;
  final String? hintText;
  final double? borderRadius;
  final Color? titleColor;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.borderRadius,
    this.validator,
    this.titleText,
    this.titleColor,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(titleText!,style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: titleColor
          ),),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          validator: validator,
        ),
      ],
    );
  }
}