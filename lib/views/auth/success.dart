import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:get/get.dart';
import '../../const/appColor.dart';
import '../../route/route.dart';
import '../../widgets/appButton/violetButton.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
                        'Please check your email for create\na new password',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Can't email?",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.grey),
                            children: [
                              TextSpan(
                                text: ' Resubmit',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColor.green,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(changePass);
                                  },
                              ),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 46.w, right: 46.w),
              child: VioletButton(
                  onAction: () => Get.back(),
                  color: AppColor.green,
                  title: "Back Email",
                  textColor: AppColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
