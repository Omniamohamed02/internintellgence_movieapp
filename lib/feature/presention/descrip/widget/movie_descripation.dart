import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
 

class MovieDescription extends StatelessWidget {


  const MovieDescription({Key? key, required this.description,}) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {


    return ReadMoreText(
      description,
      style:TextStyle(color: Colors.white,fontSize: 12.sp) ,
      trimMode: TrimMode.Line,
      trimLines:1 ,
      colorClickableText: Colors.white,
      trimCollapsedText: 'Read More',
      trimExpandedText: 'Read less',
      moreStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold,color: Colors.white),
      lessStyle:TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold,color: Colors.white) ,
    );
  }
}
