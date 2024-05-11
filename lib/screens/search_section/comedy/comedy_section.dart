import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/utils/extension/sized_box.dart';
import 'package:movie_app/utils/font/text_font.dart';
import 'package:movie_app/utils/widgets/custom_app_bar.dart';
import 'package:movie_app/utils/widgets/movie_teaser_maker.dart';

class ComedySection extends StatelessWidget {
  const ComedySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05001E),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          appBarText: 'Comedy',
          isSelected: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Results for "comedy"',
                style: AppTextFont.mainText(),
              ),
              20.height(),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: [
                  for (int i = 1; i <= 17; i++)
                    MovieTeaserMaker(
                      photoPath: 'assets/images/movies/$i.jpg',
                    ),
                ],
              ),
              60.height(),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: 335.w,
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/home.svg'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.search,
                    color: Color(0xFF362E99),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/download.svg'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
