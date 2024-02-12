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
                controller: controller.nameControllerUp.value,
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
                titleText: "Email address / User Name",
                controller: controller.usernameControllerUp.value,
                hintText: 'Enter the email or username',
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
                controller: controller.passwordControllerUp.value,
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
                  onPressedFn: ()async {
                    /*if (_formKey.currentState!.validate()) {
                      // Form is valid, perform your action here
                      print('Form is valid');
                    }*/

                    controller.dbHelper.value.insertUser(controller.nameControllerUp.value.text, controller.nameControllerUp.value.text, controller.nameControllerUp.value.text);
                    print('Invalid credentials');
                    showDialog(context: context, builder: (context) =>
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Invalid credentials"),
                            )),);
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
