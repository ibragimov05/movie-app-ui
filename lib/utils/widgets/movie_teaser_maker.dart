import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MovieTeaserMaker extends StatelessWidget {
  final String photoPath;

  const MovieTeaserMaker({
    super.key,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {},
      child: Container(
        width: 95.w,
        height: 140.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.yellow,
          image: DecorationImage(
            image: AssetImage(photoPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
