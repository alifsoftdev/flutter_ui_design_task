import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appColor.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:flutter_ui_design_task/views/auth/controller/AuthController.dart';
import 'package:flutter_ui_design_task/widgets/customTextFormField.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../widgets/custom_btn.dart';

class ForgetPassword extends StatelessWidget {
  AuthController controller = AuthController();
  RxBool fieldValue = false.obs;
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
              "Forget Password",
              style: font20(),
            ),
            addH(5.h),
            Text(
              "Enter your registered email below",
              style: fontMid(16.sp),
            ),
            addH(50.h),
            Form(
              key:  controller.formKey,
              child: CustomTextField(
                titleText: "Email address",
                controller: controller.emailForForgetPass.value,
                hintText: 'Eg namaemail@emailkamu.com',
                borderRadius: 10.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Password';
                  }
                  return null;
                },
              ),
            ),
            addH(15.h),
            RichText(text: TextSpan(children: [
              TextSpan(text: "Remember the password? ",style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.grey
              )),
              TextSpan(text: "Sign in",style: TextStyle(
              fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.green
              ),recognizer: TapGestureRecognizer()..onTap = () {},)
            ]))
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
                    Get.toNamed(success);
                    if (controller.formKey.currentState!.validate()) {
                      // Form is valid, perform your action here
                      print('Form is valid');
                    }
                  },
                  btnTxt: "Login",
                  txtColor:AppColor.white,
                  btnColor:AppColor.green),

            ],)
      ),
    );
  }
}
