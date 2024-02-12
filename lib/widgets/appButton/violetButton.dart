import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';

class VioletButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final Function onAction;
  VioletButton({required this.title,required this.onAction,required this.color, required this.textColor});
  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Container(
          height: 49.h,
          decoration: BoxDecoration(
              color:color,
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          child: _value == false
              ? Center(
                  child: Text(
                    title,
                    style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: textColor),
                  ),
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Center(
                        child: Transform.scale(
                            scale: 0.5.r,
                            child: CircularProgressIndicator(
                              color: AppColor.white,
                            ))),
                  ],
                ),
        ),
      ),
    );
  }
}