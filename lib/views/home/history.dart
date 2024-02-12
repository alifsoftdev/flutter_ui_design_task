import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_design_task/const/appStyle.dart';
import 'package:flutter_ui_design_task/widgets/custom_btn.dart';
import 'package:get/get.dart';
import '../../const/appColor.dart';
import 'model/bookrestau_model.dart';

class History_Screen extends StatelessWidget {
  const History_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.r),
        )),
        backgroundColor: AppColor.green,
        title: Text(
          "Booking History",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,color: AppColor.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: BookRestauDataList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(top: 3.h,bottom: 5.h),
                      child: Container(
                        decoration: BoxDecoration(
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
            ),
            addH(10.h),
            CustomBtn(
              txtSize: 16.sp,
              txtColor: AppColor.grey,
              btnSize: Size(182.w, 43.h),
                btnColor: AppColor.white,
                btnIcon: "assets/icons/add.svg",
                onPressedFn: (){}, btnTxt: "Booking more ")
          ],
        ),
      )
    );
  }
}
