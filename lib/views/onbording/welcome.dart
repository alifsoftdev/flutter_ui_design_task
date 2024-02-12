import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:flutter_ui_design_task/views/auth/controller/AuthController.dart';
import 'package:flutter_ui_design_task/views/auth/SignUp.dart';
import 'package:flutter_ui_design_task/views/auth/signIn.dart';
import 'package:flutter_ui_design_task/views/auth/widget/tabbar.dart';
import 'package:flutter_ui_design_task/widgets/custom_btn.dart';
import 'package:get/get.dart';
import '../../const/appColor.dart';
import '../../widgets/appButton/violetButton.dart';
import '../auth/bottomDialog.dart';

class WelcomeScreen extends StatelessWidget {
  final AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    RxBool value = false.obs;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(27.sp),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/OrderSuccess.png")),
            ),
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontGrey),
                    ),
                    addH(15.h),
                    Text(
                      'Before Enjoying Foodmedia Services\nPlease register First',
                      style:
                          TextStyle(fontSize: 14.sp, color: AppColor.fontGrey),
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 46.r,
                right: 46.r,
              ),
              child: Column(
                children: [
                  Obx(
                    () => VioletButton(
                      textColor: value == false ?Color(0xffD1FAE5): AppColor.green ,
                        title: "Create Account",
                        color:value == false ? AppColor.green : Color(0xffD1FAE5),
                        onAction: () {
                          value.value = false;
                          controller.authCheck(true);
                          return showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(35.0)),
                            ),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 560.h,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20.r),
                                      height: 6.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        color: Color(0XFFD2D4D8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    addH(10.h),
                                    Obx(
                                          ()=> CustomTabBar(
                                        tabOne: () {
                                          controller.authCheck(true);
                                        },
                                        tabOTwo: () {
                                          controller.authCheck(false);
                                        },
                                        tabColorOne:controller.authValue==true? AppColor.green:AppColor.grey,
                                        tabColorTwo: controller.authValue==false? AppColor.green:AppColor.grey,
                                      ),
                                    ),
                                    addH(30.h),
                                    Obx(()=> SizedBox(
                                      child: controller.authValue==true?SignUpScreen():
                                      SignIn(),),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                  ),
                  Obx(
                    () => VioletButton(
                        title: "Login",
                        textColor: value == true ?Color(0xffD1FAE5): AppColor.green ,
                        color:
                        value == true ? AppColor.green : Color(0xffD1FAE5),
                        onAction: () {
                          value.value = true;
                          controller.authCheck(false);
                          return showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(35.0)),
                            ),
                            context: context,
                            builder: (context) =>SingleChildScrollView(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20.r),
                                        height: 6.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          color: Color(0XFFD2D4D8),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      addH(10.h),
                                      Obx(
                                            ()=> CustomTabBar(
                                          tabOne: () {
                                            controller.authCheck(true);
                                          },
                                          tabOTwo: () {
                                            controller.authCheck(false);
                                          },
                                          tabColorOne:controller.authValue==true? AppColor.green:AppColor.grey,
                                          tabColorTwo: controller.authValue==false? AppColor.green:AppColor.grey,
                                        ),
                                      ),
                                      addH(30.h),
                                      Obx(()=> SizedBox(
                                        child: controller.authValue==true?SignUpScreen():
                                        SignIn(),),
                                      ),
                                      addH(20.h),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: RichText(
                text: TextSpan(
                    text: "By logging in or registering, you have agreed to ",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black),
                    children: [
                      TextSpan(
                        text: 'the Terms and\nConditions ',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColor.green,
                            fontWeight: FontWeight.w400),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: 'And',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColor.black,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColor.green,
                            fontWeight: FontWeight.w400),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
