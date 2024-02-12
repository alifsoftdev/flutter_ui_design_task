import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_design_task/route/route.dart';
import 'package:flutter_ui_design_task/views/auth/controller/AuthController.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';
import '../../const/appStyle.dart';

class AccountScreen extends StatelessWidget {

  AuthController controller=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w),
          child: Column(
            children: [
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFECECEC),
                          spreadRadius: 2,
                          offset: Offset(2, 2),
                          blurRadius: 3
                      )
                    ],
                    borderRadius: BorderRadius.circular(11.r)),
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColor.white,
                      child: Image.asset(
                          "assets/profile.png"),
                    ),
                    title: Obx(
                          ()=> Text(
                        controller.users[2].username??"Name empty",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.fontColor),
                      ),
                    ),
                    subtitle: Obx(
                          ()=> Text(
                            controller.users[2].username??"username empty",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.grey),
                      ),
                    ),
                    trailing: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          backgroundColor:Color(0xFFF9F9F9),
                          child: SvgPicture.asset("assets/icons/notification.svg"),
                        ),
                        Positioned(
                            top: 3.h,
                            right: -3.w,
                            child: CircleAvatar(
                              radius: 6.r,
                              backgroundColor: Color(0xFFEB4646),
                              child: Text("3",style: TextStyle(color: AppColor.white,fontSize: 8.sp,fontWeight: FontWeight.w500),),
                            ))
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11.r)),
                  child: ListTile(
                    leading: SvgPicture.asset("assets/icons/user.svg"),
                    title: Text(
                      "Account setting",
                      style: TextStyle(fontSize: 18.sp, color: AppColor.fontColor),
                    ),
                    trailing: SvgPicture.asset("assets/icons/edite.svg"),
                  ),
                ),
              ),
              addH( 5.h,),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(11.r)),
                child: Column(
                  children: [
                    options("assets/icons/massage.svg", "Language",
                        Icons.arrow_forward_ios,(){}),
                    options("assets/icons/feedback.svg", "Feedback",
                        Icons.arrow_forward_ios,(){}),
                    options("assets/icons/rate.svg", "Rate us",
                        Icons.arrow_forward_ios,(){}),
                    options("assets/icons/uparrow.svg", "New Version",
                        Icons.arrow_forward_ios,(){}),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: ()async{
                    await controller.deleteUser();
                    Get.toNamed(welcome);
                },
                child: Container(
                  height: 35.h,
                    width: 111.w,
                    decoration: BoxDecoration(
                        color:Color(0xFFEB4646),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(11.r)),
                    child: Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget options(icon, String title, icon2,onclick) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: InkWell(
        onTap: onclick,
        child: ListTile(
          leading: SvgPicture.asset(icon),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, color: AppColor.fontColor),
            ),
          ),
          trailing: Icon(
            icon2,
            size: 18.sp,
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }
}
