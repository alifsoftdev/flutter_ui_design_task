import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_design_task/const/appColor.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:flutter_ui_design_task/widgets/appButton/violetButton.dart';
import 'package:flutter_ui_design_task/widgets/custom_btn.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'controller/AuthController.dart';
import '../../widgets/customTextFormField.dart';

class SignIn extends StatelessWidget {
 final AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              CustomTextField(
                titleText: "Email address",
                //controller: controller.nameController.value,

                hintText: 'Eg namaemail@emailkamu.com',
                borderRadius: 10.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Eg namaemail@emailkamu.com';
                  }
                  return null;
                },
              ),
              addH(10.h),
              CustomTextField(
                titleText: "Password",
                controller: controller.nameController.value,
                hintText: '**** **** ****',
                borderRadius: 10.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Password';
                  }
                  return null;
                },
              ),
              addH(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(forgetPass);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: AppColor.green,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              addH(20.h),
              CustomBtn(
                  onPressedFn: () {
                    if (controller.formKey.currentState!.validate()) {
                      // Form is valid, perform your action here
                      print('Form is valid');
                    }
                  },
                  btnTxt: "Login",
                  txtColor:controller.formFill==true? AppColor.white: AppColor.grey,
                  btnColor:controller.formFill==true? AppColor.green :AppColor.greyLite),
              const Divider(
                indent: 70,
                endIndent: 70,
              ),
              CustomBtn(
                  onPressedFn: () {},
                  btnIcon: "assets/icons/ic_google.svg",
                  btnTxt: "Login with Google",
                  txtColor:AppColor.black ,
                  btnColor: AppColor.greyLite),
            ],
          ),
        ),
      ),
    );
  }
}
