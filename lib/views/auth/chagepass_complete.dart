import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';
import '../../const/appStyle.dart';
import '../../widgets/appButton/violetButton.dart';

class ChangePassComplete extends StatelessWidget {
  const ChangePassComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(27.r),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.check_circle,
                    color: AppColor.green,
                    size: 82.sp,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Success',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.fontColor),
                      ),
                      addH(15.h),
                      Text(
                        'Congratulations your password has\nbeen changed,',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF828282)),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 46.w, right: 46.w),
              child: VioletButton(
                  onAction: () => Get.toNamed(welcome),
                  color: AppColor.green,
                  title: "Sign in",
                  textColor: AppColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
