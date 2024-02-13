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
import 'widget/custom_alert.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //final AuthController controller = AuthController();
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Obx(
                () => CustomTextField(
                  titleText: "Username",
                  titleColor: (controller.usernameControllerIn.value.text.isEmpty)
                      ? AppColor.fontColor: AppColor.grey,
                  controller: controller.usernameControllerIn.value,
                  hintText: 'Enter username',
                  borderRadius: 10.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
              ),
              addH(10.h),
              Obx(
                () => CustomTextField(
                  titleText: "Password",
                  titleColor: (controller.passwordControllerIn.value.text.isEmpty)
                      ?AppColor.fontColor: AppColor.grey,
                  controller: controller.passwordControllerIn.value,
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
              Obx(
                () => CustomBtn(
                    onPressedFn: () async {
                      if (controller.formKey.currentState!.validate()) {
                        // Form is valid, perform your action here
                        print('Form is valid');
                      }
                      String enteredName= "Kawser";//controller.nameControllerUp.value.text;
                      String enteredUsername = controller.usernameControllerIn.value.text;
                      String enteredPassword = controller.passwordControllerIn.value.text;
                      if (enteredUsername == "user" && enteredPassword == "12345678") {
                        print('Sign in successful!');
                        controller.addUser(enteredName, enteredUsername, enteredPassword);
                        controller.formKey.currentState!.reset();
                        showSignInSuccess(context);
                        // Replace the following line with your desired logic upon successful login
                        print('Performing actions for successful sign-in, like navigating to a new screen.');
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Invalid credentials"),
                            );
                          },
                        );
                        print('Invalid credentials');
                      }
                    },
                    btnTxt: "Login",
                    txtColor: (controller
                                .usernameControllerIn.value.text.isEmpty ||
                            controller.passwordControllerIn.value.text.isEmpty)
                        ? AppColor.grey
                        : AppColor.white,
                    btnColor: (controller
                                .usernameControllerIn.value.text.isEmpty ||
                            controller.passwordControllerIn.value.text.isEmpty)
                        ? AppColor.greyLite
                        : AppColor.green),
              ),
              const Divider(
                indent: 70,
                endIndent: 70,
              ),
              CustomBtn(
                  onPressedFn: () {
                    String newName = "Google Name";
                    String newUsername = "Google username";
                    String newPassword = "Google password";

                    if (newName.isEmpty ||
                        newUsername.isEmpty ||
                        newPassword.isEmpty) {
                      print('Name, username, and password cannot be empty');
                    } else {
                      bool signUpSuccess =
                          controller.signUp(newName, newUsername, newPassword);

                      if (signUpSuccess) {
                        print('Sign up successful!');
                        // Perform actions for successful sign-up (e.g., navigate to another screen)
                      } else {
                        print(
                            'Username already exists. Please choose a different username.');
                      }
                      showSignUpSuccess(context);
                    }
                  },
                  btnIcon: "assets/icons/ic_google.svg",
                  btnTxt: "Login with Google",
                  txtColor: AppColor.black,
                  btnColor: AppColor.greyLite),
            ],
          ),
        ),
      ),
    );
  }
}
