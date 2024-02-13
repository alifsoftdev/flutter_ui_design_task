import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:flutter_ui_design_task/views/auth/widget/custom_alert.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';
import '../../const/appStyle.dart';
import 'controller/AuthController.dart';
import '../../widgets/customTextFormField.dart';
import '../../widgets/custom_btn.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              Obx(
                ()=> CustomTextField(
                  titleText: "Full Name",
                  titleColor: (controller.nameControllerUp.value.text.isEmpty)
                      ? AppColor.fontColor: AppColor.grey,
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
              ),
              addH(10.h),
              Obx(
                () => CustomTextField(
                  titleText: "Email address / User Name",
                  titleColor: (controller.usernameControllerUp.value.text.isEmpty)
                      ? AppColor.fontColor: AppColor.grey,
                  controller: controller.usernameControllerUp.value,
                  hintText: 'Enter the email or username',
                  borderRadius: 10.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email or username';
                    }
                    return null;
                  },
                ),
              ),
              addH(10.h),
              Obx(
                () => CustomTextField(
                  titleText: "Password",
                  titleColor: (controller.passwordControllerUp.value.text.isEmpty)
                      ? AppColor.fontColor: AppColor.grey,
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
              ),
              addH(20.h),
              Obx(
                () => CustomBtn(
                    onPressedFn: () async {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, perform your action here
                        print('Form is valid');
                      }
                      String newName = controller.nameControllerUp.value.text;
                      String newUsername = controller.usernameControllerUp.value.text;
                      String newPassword = controller.passwordControllerUp.value.text;

                      if (newName.isEmpty || newUsername.isEmpty || newPassword.isEmpty) {
                        print('Name, username, and password cannot be empty');
                      } else {
                        bool signUpSuccess = controller.signUp(newName, newUsername, newPassword);

                        if (signUpSuccess) {
                          print('Sign up successful!');
                          showSignUpSuccess(context);
                          controller.formKey.currentState!.reset();
                          // Perform actions for successful sign-up (e.g., navigate to another screen)
                        } else {
                          print('Username already exists. Please choose a different username.');
                        }

                      }
                    },
                    btnTxt: "Registration",
                    txtColor: (controller.nameControllerUp.value.text.isEmpty ||
                        controller
                            .usernameControllerUp.value.text.isEmpty ||
                        controller.passwordControllerUp.value.text.isEmpty)
                        ? AppColor.grey
                        : AppColor.white,
                    btnColor: (controller.nameControllerUp.value.text.isEmpty ||
                        controller
                            .usernameControllerUp.value.text.isEmpty ||
                        controller.passwordControllerUp.value.text.isEmpty)
                        ? AppColor.greyLite
                        : AppColor.green),
              ),
              Divider(
                indent: 70,
                endIndent: 70,
              ),
              CustomBtn(
                  onPressedFn: () {
                    String newName = "Google Name";
                    String newUsername = "Google username" ;
                    String newPassword ="Google password";

                    if (newName.isEmpty || newUsername.isEmpty || newPassword.isEmpty) {
                      print('Name, username, and password cannot be empty');
                    } else {
                      bool signUpSuccess = controller.signUp(newName, newUsername, newPassword);

                      if (signUpSuccess) {
                        print('Sign up successful!');
                        // Perform actions for successful sign-up (e.g., navigate to another screen)
                      } else {
                        print('Username already exists. Please choose a different username.');
                      }
                      showSignUpSuccess(context);
                    }
                  },
                  btnIcon: "assets/icons/ic_google.svg",
                  btnTxt: "Login with Google",
                  txtColor: AppColor.grey,
                  btnColor: AppColor.greyLite),
            ],
          ),
        ),
      ),
    );
  }
}
