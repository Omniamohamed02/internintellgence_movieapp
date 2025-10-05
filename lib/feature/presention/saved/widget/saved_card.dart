import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:new_movie_app/core/model/movie_model.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/saved_provider.dart';


class SavedCard extends StatelessWidget {
   SavedCard({super.key, required this.movie , });
 final Movie movie;
 
  @override
  Widget build(BuildContext context,) {
    final sp = Provider.of<SavedProvider>(context);
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
          bottom:10,
          right: 10,
          child: IconButton(onPressed: (){
          sp.remove(movie);
        },
         icon: Icon(Icons.delete,color: Colors.red),))  ,      
        Positioned(
            top: 5.h,
            right: 5.w,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)))
      ]),
    );
  }
}
