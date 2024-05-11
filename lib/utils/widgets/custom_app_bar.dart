import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extension/sized_box.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarText;
  final bool isSelected;

  const CustomAppBar({
    super.key,
    required this.appBarText,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF05001E),
      title: Container(
        margin: EdgeInsets.only(left: 5.w, right: 5.w),
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: 20.w,
          right: 20.w,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF37324B),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.search,
                  color: Color(0xFF9A98A3),
                ),
                20.width(),
                Text(
                  appBarText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF9A98A3),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Container(
                padding: EdgeInsets.all(3.sp),
                decoration: const BoxDecoration(
                  color: Color(0xFF4B465A),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 15.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
