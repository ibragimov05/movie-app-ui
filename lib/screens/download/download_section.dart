import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extension/sized_box.dart';

class Download extends StatelessWidget {
  const Download({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05001E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF05001E),
        title: Text(
          'Download',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 167.w,
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFF464150),
                          width: 2.w,
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'List Movie',
                        style: TextStyle(
                          color: Color(0xFF4A475B),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 167.w,
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFF3A32A6),
                          width: 2.w,
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Downloading',
                        style: TextStyle(
                          color: Color(0xFF3A32A6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              25.height(),
              downloadingContainerMaker(
                  photoPath: 'assets/images/movies/1.jpg',
                  movieName: 'The Shawshank Redemption',
                  movieCompanyName: 'Columbia Pictures',
                  downloadKs: '720K/s',
                  downloadLeftMB: '250MB/1.5GB'),
              15.height(),
              downloadingContainerMaker(
                  photoPath: 'assets/images/movies/12.jpg',
                  movieName: 'Spider-Man: Across the Spider-Verse',
                  movieCompanyName: 'Marvel studios',
                  downloadKs: '923K/s',
                  downloadLeftMB: '435MB/1.2GB'),
            ],
          ),
        ),
      ),
    );
  }

  Widget downloadingContainerMaker({
    required String photoPath,
    required String movieName,
    required String movieCompanyName,
    required String downloadKs,
    required String downloadLeftMB,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: const Color(0xFF231E37),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(photoPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.width(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.w,
                child: Text(
                  movieName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                movieCompanyName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                ),
              ),
              20.height(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70.w,
                        height: 2.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFF594AED),
                        ),
                      ),
                      2.height(),
                      Text(
                        downloadKs,
                        style: TextStyle(
                          color: const Color(0xFF594AED),
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 80.w,
                        height: 2.h,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      2.height(),
                      Text(
                        downloadLeftMB,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                  5.width(),
                  Row(
                    children: [
                      Icon(
                        Icons.pause_circle_outline,
                        color: const Color(0xFF727281),
                        size: 14.sp,
                      ),
                      PopupMenuButton(
                        iconSize: 14.sp,
                        color: const Color(0xFF464150),
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            child: Text('Re-download'),
                          ),
                          const PopupMenuItem(
                            child: Text('Details'),
                          ),
                          const PopupMenuItem(
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
