import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';
import '../../const/appStyle.dart';
import '../../widgets/customTextFormField.dart';
import '../../widgets/custom_btn.dart';
import 'controller/AuthController.dart';

class ChangePassword extends StatelessWidget {
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addH(100.h),
            Text(
              "Change New Password",
              style: font20(),
            ),
            addH(5.h),
            Text(
              "Enter your registered email below",
              style: fontMid(16.sp),
            ),
            addH(50.h),
            CustomTextField(
              titleText: "New Password",
              controller: controller.emailForForgetPass.value,
              hintText: '**** **** ****',
              borderRadius: 10.0,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                }
                return null;
              },
            ),
            addH(15.h),
            CustomTextField(
              titleText: "Confarm Password",
              controller: controller.emailForForgetPass.value,
              hintText: '**** **** ****',
              borderRadius: 10.0,
              validator: (value) {

                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomSheet:Padding(
          padding: EdgeInsets.all(20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBtn(
                  onPressedFn: () {
                    Get.toNamed(changePassComplete);
                    if (controller.formKey.currentState!.validate()) {
                      // Form is valid, perform your action here
                      print('Form is valid');
                    }
                  },
                  btnTxt: "Reset Password",
                  txtColor:AppColor.white,
                  btnColor:AppColor.green),

            ],)
      ),
    );
  }
}
