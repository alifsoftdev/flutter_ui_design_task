import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_design_task/views/home/model/arivable_model.dart';
import 'package:flutter_ui_design_task/views/home/model/bookrestau_model.dart';
import 'package:get/get.dart';
import '../../../const/appColor.dart';
import '../../../const/appStyle.dart';
import '../../../const/data/homedata.dart';
import '../../../route/route.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xFFF6F6F6),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Column(
          children: [
            AppBar(
              titleSpacing:50.w,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color(0xFFF6F6F6),
              leading: Padding(
                padding: EdgeInsets.all(18.r),
                child: InkWell(
                  onTap: (){},
                  child: SvgPicture.asset("assets/icons/more_ic.svg"),
                ),
              ),
              title: InkWell(
                onTap: (){
                  Get.toNamed(location);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColor.green,
                      size: 16.r,
                    ),
                    Text(
                      "Agrabad 435, Chittagong",
                      style: TextStyle(
                        color: AppColor.fontColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: InkWell(
                    onTap: () {

                    },
                    child: CircleAvatar(
                      radius: 16.r,
                        backgroundColor: AppColor.white,
                      child: Image.asset("assets/profile.png",fit: BoxFit.fill,)
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 37.5, right: 37.5),
              child: Container(
                height: 36.h,
                decoration: BoxDecoration(
                  color: Color(0xFFE2E3E4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(11.r),
                  ),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20.w,top: 3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 5.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                  items: pages
                      .map((item) => Padding(
                    padding:  EdgeInsets.only(right: 5.w,left: 5.w),
                    child: Container(
                      height: 120.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [pages[currentPage].colorOne, pages[currentPage].colorTwo],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Stack(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        children: [
                          Positioned(
                              right: -50.w,
                              bottom: 10.h,
                              child: Image.asset(pages[currentPage].foodImage,height: 117,
                                width: 207,)),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h, left: 20.w,bottom: 12.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    pages[currentPage].logo,
                                    height: 26,

                                  ),
                                  Text(
                                      pages[currentPage].offer,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    pages[currentPage].sortDescribe,
                                    style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.w500,color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Order",
                                        style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.bold, color: Colors.white),
                                      ),addW(3.w
                                      ), Icon(Icons.arrow_forward_ios,color: AppColor.white,size: 7,),
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  )
                      .toList(),
                  options: CarouselOptions(
                      height: 120,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 700),
                      viewportFraction: 1,
                      onPageChanged: (val, carouselPageChangedReason) {
                        setState(() {
                          currentPage = val;
                        });
                      })),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DotsIndicator(
                  dotsCount: pages.length == 0 ? 1 : pages.length,
                  position: currentPage,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: AppColor.green,
                    size: Size.square(9.0.r),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                          text: "Today New Arivable\n",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.fontColor),
                          children: [
                            TextSpan(
                              text: 'Best of the today  food list update',
                              style: TextStyle(
                                height: 1.5,
                                  fontSize: 12.sp,
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ]),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "See All ",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_forward_ios,size: 14,color: AppColor.grey,),
                      ],
                    ),
                  )
                ],
              ),
              addH(10.h),
              SizedBox(
                height: 196.h,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: ArivableDataList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 196.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 20.h),
                      child: Column(
                        children: [
                          Expanded(flex: 2, child: Image.asset(ArivableDataList[index].image)),
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    ArivableDataList[index].foodName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: AppColor.black),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColor.green,
                                        size: 12.r,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text(ArivableDataList[index].location,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: AppColor.grey,
                                                fontWeight: FontWeight.w500
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                },),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h,bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Booking Restaurant\n",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.fontColor),
                          children: [
                            TextSpan(
                              text: 'Check your city Near by Restaurant',
                              style: TextStyle(
                                height: 1.5,
                                  fontSize: 12.sp,
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                      textAlign: TextAlign.start,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(detailsRasto);
                      },
                      child: Row(
                        children: [
                          Text(
                            "See All ",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_forward_ios,size: 14,color: AppColor.grey,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
                                  onTap:(){Get.toNamed(detailsRasto);},
                                  child: Container(
                                    height: 28.h,
                                    width: 88.w,
                                    decoration: BoxDecoration(
                                        color: AppColor.green,
                                        borderRadius: BorderRadius.circular(8.r)),
                                    child: Center(
                                      child: Text(  "Book",
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
            ],
          ),
        ),
      ),
    );
  }
}
