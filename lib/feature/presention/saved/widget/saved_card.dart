import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/model/movie_model.dart';


class SavedCard extends StatelessWidget {
  const SavedCard({super.key, required this.movie});
 final Movie movie;
  @override
  Widget build(BuildContext context,) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 4.0,
      child: Stack(children: [
        Container(
          height: 150.h,
          // margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Color(0xff222831),
              borderRadius: BorderRadius.circular(20.r)),
          width: double.infinity,
        ),
        Positioned(
            left: 10.w,
            top: 10.h,
            bottom: 10.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                fit: BoxFit.fill,
                height: 100.h,
                width: 100.w,
              ),
            )),
        Positioned(
            top: 10.h,
            left: 120.w,
            right: 50.w,
            child: Text(
              '${movie.title}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.white),
            )),

        Positioned(
            bottom: 20.h,
            left: 120.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE01616)) ,
                onPressed: (){}, child: Text('Watch Now',style: TextStyle(color: Colors.white),))),
        Positioned(
            top: 5.h,
            right: 5.w,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)))
      ]),
    );
  }
}
