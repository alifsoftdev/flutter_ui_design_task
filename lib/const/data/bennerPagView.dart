import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget benner(title,title2,title3, image, image2, color) {
  return Padding(
    padding:  EdgeInsets.only(right: 5.w,left: 5.w),
    child: Container(
      height: 120.h,
      width: 280.w,
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Positioned(
            right: -50.w,
            bottom: 10.h,
            child: Image.asset(image2,height: 117,
                width: 207,)),
          Padding(
            padding: EdgeInsets.only(top: 12.h, left: 20.w,bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
              Image.asset(
                image,
                height: 26,

              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                title2,
                style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.w500,color: Colors.white),
              ),
              Text(
                title3,
                style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}
