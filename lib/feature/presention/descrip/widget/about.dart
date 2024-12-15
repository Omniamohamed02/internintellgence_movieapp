import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/feature/presention/descrip/widget/similiar_card.dart';


class About extends StatelessWidget {
  const About({super.key, required this.genre, required this.language, required this.year, required this.country});
  final String genre;
  final String language;
  final String year;
  final String country;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Genre', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  Text(genre, style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(width: 30.w),
              Column(
                children: [
                  Text('Language', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  Text(language, style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Column(
          //       children: [
          //         Text('Year', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
          //         Text(year, style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
          //       ],
          //     ),
          //     SizedBox(width: 30.w),
          //     Column(
          //       children: [
          //         Text('Country', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
          //         Text(country, style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold)),
          //       ],
          //     ),
          //   ],
          // ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SimiliarCard(imagePath: '');
              },
            ),
          ),
        ],
      ),
    );
  }
}
