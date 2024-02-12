import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/appColor.dart';

class smallButton extends StatelessWidget {
  String title;
  final Function onAction;
  smallButton(this.title, this.onAction);
  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Container(
          height: 28.h,
          width: 88.w,
          decoration: BoxDecoration(
              color: AppColor.green,
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          child: _value == false
              ? Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Transform.scale(
                            scale: 0.5.r,
                            child: CircularProgressIndicator(
                              color: AppColor.white,
                            ))),
                  ],
                ),
        ),
      ),
    );
  }
}
