import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../account/account.dart';
import 'history.dart';
import 'view/home.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  final _pages = [HomeScreen(), History_Screen(), AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Color(0xffEBEFF1),
              elevation: 50,
              onTap: (value) => _currentIndex.value = value,
              currentIndex: _currentIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: _currentIndex == 0
                        ? Image.asset("assets/home1.png",width: 32.r)
                        : Image.asset("assets/home2.png",width: 32.r),
                    label: ""),
                BottomNavigationBarItem(
                    icon: _currentIndex == 1
                        ? Image.asset("assets/list1.png",width: 32.r)
                        : Image.asset("assets/list2.png",width: 32.r),
                    label: ""),
                BottomNavigationBarItem(
                    icon: _currentIndex == 2
                        ? Image.asset("assets/account1.png",width: 32.r,)
                        : Image.asset("assets/account2.png",width: 32.r),
                    label: ""),
              ],
            )),
        body: _pages[_currentIndex.value],
      ),
    );
  }
}
