import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie_app/feature/presention/category_screen/category_screen.dart';

Widget CategoryButton(final onPrssed,lable,BuildContext context,genreId){
  return Padding(
    padding:  EdgeInsets.all(5.0.h),
    child: ElevatedButton(
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
         CategoryScreen( genreId: genreId ,genreTitl:lable , )
            ));
      },
      child: Text(
        '$lable',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE01616)) ,

    ),
  );
}