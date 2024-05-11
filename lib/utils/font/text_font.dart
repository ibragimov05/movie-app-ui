import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextFont {
  static TextStyle mainText() => TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      );
}
