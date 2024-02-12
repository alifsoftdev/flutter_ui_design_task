import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appColor.dart';

SizedBox addH(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox addW(double width) {
  return SizedBox(
    width: width,
  );
}

TextStyle font20() {
  return TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColor.fontColor);
}

TextStyle fontMid(double fonSize) {
  return TextStyle(
      fontSize: fonSize, fontWeight: FontWeight.w500, color: AppColor.grey);
}
