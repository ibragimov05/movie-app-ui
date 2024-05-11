import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/search_section/comedy/comedy_section.dart';
import 'package:movie_app/utils/extension/sized_box.dart';
import 'package:movie_app/utils/font/text_font.dart';
import 'package:movie_app/utils/widgets/custom_app_bar.dart';
import 'package:movie_app/utils/widgets/movie_teaser_maker.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Search extends StatelessWidget {
  Search({super.key});

  List<Map<String, dynamic>> recentSearches_ls = [
    {
      'text': 'Marvel',
      'isTrue': false,
    },
    {
      'text': 'Comedy',
      'isTrue': true,
    },
    {
      'text': 'Captain America',
      'isTrue': false,
    },
    {
      'text': 'Thor',
      'isTrue': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05001E),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          appBarText: 'Search by title, genre, actor',
          isSelected: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Searches',
                style: AppTextFont.mainText(),
              ),
              15.height(),
              Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    buttonMakerForRecentSearches(
                      searchText: recentSearches_ls[i]['text'],
                      isTrue: recentSearches_ls[i]['isTrue'],
                      context: context,
                    ),
                ],
              ),
              Row(
                children: [
                  for (int i = 2; i < 4; i++)
                    buttonMakerForRecentSearches(
                      searchText: recentSearches_ls[i]['text'],
                      isTrue: recentSearches_ls[i]['isTrue'],
                      context: context,
                    ),
                ],
              ),
              Text(
                'Popular',
                style: AppTextFont.mainText(),
              ),
              20.height(),
              singleChildViewMovies(start: 0, end: 6),
              20.height(),
              Text(
                'Recommendations for you',
                style: AppTextFont.mainText(),
              ),
              20.height(),
              singleChildViewMovies(start: 6, end: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonMakerForRecentSearches({
    required String searchText,
    required bool isTrue,
    required BuildContext context,
  }) {
    return ZoomTapAnimation(
      onTap: isTrue == true
          ? () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const ComedySection(),
                ),
              );
            }
          : () {},
      child: Container(
        margin: EdgeInsets.only(right: 15.w, bottom: 15.h),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 20.w,
          top: 5.h,
          bottom: 5.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0F0A32),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              color: const Color(
                0xFF302788,
              ),
              size: 15.sp,
            ),
            10.width(),
            Text(
              searchText,
              style: const TextStyle(
                color: Color(0xFF302788),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleChildViewMovies({
    required int start,
    required int end,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = start; i < end; i++)
            MovieTeaserMaker(photoPath: 'assets/images/movies/${i + 1}.jpg')
        ],
      ),
    );
  }
}
