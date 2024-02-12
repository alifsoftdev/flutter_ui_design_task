import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';

import '../../../const/appColor.dart';
import '../model/bookrestau_model.dart';

class DetailsRastoScreen extends StatelessWidget {
  const DetailsRastoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEFF1),
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.r),
            )),
        backgroundColor: AppColor.green,
        title: Text(
          "Details Restaurant",
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600,color: AppColor.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 90.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r))),
          child: Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 232.w,
                height: 33.h,
                decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: Text(
                    "Booking",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding: EdgeInsets.all(18.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Tava Restaurant",
                        style: TextStyle(
                            color: AppColor.fontColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColor.green,
                            size: 14.r,
                          ),
                          addW(5.w),
                          Text(
                            "kazi Deiry, Taiger Pass,Chittagong",
                            style: TextStyle(
                                color: AppColor.grey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      addH(15.h),
                      Image.asset("assets/shop2b.png", fit: BoxFit.cover),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: AppColor.green,
                                    size: 14.r,
                                  ),
                                  addW(5),
                                  Text(
                                    "Open today",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              addH(5.h),
                              Text(
                                "10:00 AM - 12:00 PM",
                                style: TextStyle(
                                    color: AppColor.fontColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.directions,
                                color: Colors.blue,
                                size: 16.sp,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Visit the Restaurant",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
          addH(15.h),
          Expanded(flex: 1, child: Container(
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r))),
            child: Padding(
              padding: EdgeInsets.only(top:18.h,left: 18.w,right: 18.w),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "List other restaurant\n",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.fontColor),
                          children: [
                            TextSpan(
                              text: 'check the menu at this restaurant',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColor.grey,),
                            ),
                          ]),
                      textAlign: TextAlign.start,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "See All ",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.green,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_forward_ios,size: 14,color: AppColor.green,),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.builder(
                      itemCount: BookRestauDataList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.only(left:2, top: 2.h,bottom: 5.h,right: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFECECEC),
                                  spreadRadius: 2,
                                  offset: Offset(2, 2),
                                  blurRadius: 3
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColor.white,
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10.r),
                              leading: Image.asset(
                                BookRestauDataList[index].image,height: 64.h,width: 64.w,fit: BoxFit.fill,
                              ),
                              title: Text(BookRestauDataList[index].restauName,style: TextStyle(
                                  fontSize: 16.sp,
                                  height: 1.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.fontColor
                              ),),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColor.green,
                                        size: 16.r,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text(
                                            BookRestauDataList[index].location,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: AppColor.grey,
                                            )),
                                      ),
                                    ]),
                                  ),

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap:(){},
                                      child: Container(
                                        height: 28.h,
                                        width: 88.w,
                                        decoration: BoxDecoration(
                                            color: AppColor.green,
                                            borderRadius: BorderRadius.circular(8.r)),
                                        child: Center(
                                          child: Text(  "Check",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: AppColor.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],),
            ),
          )),
        ],
      ),
    );
  }
}
