import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/screens/download/download_section.dart';
import 'package:movie_app/screens/search_section/search_section.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedPage = 0;
  Color iconColor = Colors.grey.withOpacity(0.9);

  List isSelected = <bool>[
    true,
    false,
  ];
  final List<Widget> pages = [
    Search(),
    const Download(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: pages[_selectedPage]),
        ],
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
                  onPressed: () {
                    setState(() {
                      _selectedPage = 0;
                      isSelected[0] = true;
                      isSelected[1] = false;
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.search,
                    color: isSelected[0] == true
                        ? const Color(0xFF362E99)
                        : Colors.grey.withOpacity(0.9),
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
                  onPressed: () {
                    setState(() {
                      _selectedPage = 1;
                      isSelected[1] = true;
                      isSelected[0] = false;
                    });
                  },
                  icon: SvgPicture.asset(
                    isSelected[1] == true
                        ? 'assets/icons/download_selected.svg'
                        : 'assets/icons/download.svg',
                  ),
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
