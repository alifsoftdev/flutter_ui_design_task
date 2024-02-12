import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final VoidCallback tabOne;
  final VoidCallback tabOTwo;
  final Color? tabColorOne;
  final Color? tabColorTwo;
  const CustomTabBar({super.key, required this.tabOne, required this.tabOTwo, this.tabColorOne, this.tabColorTwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: tabOne,
            child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Text("Create Account",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight:
                          FontWeight.w600,
                          color:tabColorOne!)),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                    thickness: 2.5,
                    color: tabColorOne!
                  )
                ]),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: tabOTwo,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight:
                      FontWeight.w600,
                      color: tabColorTwo!),
                ),
                Divider(
                  indent: 70,
                  endIndent: 70,
                  thickness: 2.5,
                  color: tabColorTwo!
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
