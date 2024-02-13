import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:flutter_ui_design_task/const/data/onbording_datalist.dart';
import 'package:flutter_ui_design_task/views/auth/controller/AuthController.dart';
import 'package:get/get.dart';

import '../../const/appColor.dart';
import '../../route/route.dart';

class OnbordingScreen extends StatelessWidget {
  RxInt currentIndex = 0.obs;
  OnbordingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //size of the window
    AuthController controller=AuthController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(27.r),
        child: Column(
          children: [
            Obx(
            ()=> Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.5.r, right: 10.5.r),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(onbordingList[currentIndex.toInt()].image)),
                  )),
            ),
            addH(70.h),
            Obx(
                  ()=> Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      onbordingList[currentIndex.toInt()].title,
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontColor),
                    ),
                    addH(16.h),
                    Text(onbordingList[currentIndex.toInt()].description,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color:AppColor.fontGrey)
                      ,textAlign:TextAlign.center,),

                  ]),
            ),
            addH(104.h),
            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                ()=> InkWell(
                              onTap: ()=>Get.toNamed(welcome),
                              child:currentIndex==2?SizedBox(width: 40): Text("Skip",style: TextStyle(
                                    fontSize: 16.sp,
                                    color:AppColor.fontGrey))
                            ),
                          ),
                          Obx(
                            () => DotsIndicator(
                              dotsCount: onbordingList.length,
                              position: currentIndex.toInt(),
                              decorator: DotsDecorator(
                                color: Colors.grey,
                                activeColor: AppColor.green,
                                size: Size.square(9.0.r),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (currentIndex == 2) {
                                Get.toNamed(welcome);
                              } else {
                                currentIndex + 1;
                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              color: AppColor.green,
                            ),
                          )
                        ],
                      )
          ],
        ),
      ),
    );
  }
}
