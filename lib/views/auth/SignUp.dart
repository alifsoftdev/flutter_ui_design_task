import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';
import '../../const/appStyle.dart';
import 'controller/AuthController.dart';
import '../../widgets/customTextFormField.dart';
import '../../widgets/custom_btn.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              CustomTextField(
                titleText: "Full Name",
                controller: controller.nameController.value,
                hintText: 'Enter your full name',
                borderRadius: 10.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Enter your full name';
                  }
                  return null;
                },
              ),
              addH(10.h),
              CustomTextField(
                titleText: "Email address",
                controller: controller.nameController.value,
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
              addH(20.h),
              CustomBtn(
                  onPressedFn: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, perform your action here
                      print('Form is valid');
                    }
                  },
                  btnTxt: "Registration",
                  txtColor:_formKey.runtimeType.isNull ? AppColor.white : AppColor.grey ,
                  btnColor:
                  _formKey.runtimeType.isNull ? AppColor.green : AppColor.greyLite),
              Divider(
                indent: 70,
                endIndent: 70,
              ),
              CustomBtn(
                  onPressedFn: () {
                    Get.toNamed(navController);
                  },
                  btnIcon: "assets/icons/ic_google.svg",
                  btnTxt: "Login with Google",
                  txtColor:AppColor.grey ,
                  btnColor:AppColor.greyLite),
            ],
          ),
        ),
      ),
    );
  }
}
