import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 

class MovieName extends StatelessWidget {
  const MovieName({super.key, required this.title, required this.releaseDate, });
  final String title;
  final String releaseDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( title,style:TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.white),),
          SizedBox(height: 5.h,),
          Text(releaseDate,style: TextStyle(fontSize: 14.sp,color: Colors.white),)
        ],
      ),
    );
  }
}
