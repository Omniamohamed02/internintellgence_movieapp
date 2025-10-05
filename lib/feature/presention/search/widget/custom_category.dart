import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
import '../../../../core/model/movie_model.dart';
import '../../descrip/descripation_screen.dart';
import '../../home/see_more_page.dart';

Widget buildCategory(String title, List<Movie> movies, BuildContext context,) {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 10.0.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(color:Colors.white ,fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SeeMorePage(Catmovies: movies,)
                      ));
                },
                child: Text(
                  'See More',
                  style: TextStyle(color:Colors.white ,fontSize: 15.sp, fontWeight: FontWeight.bold),),
              ),
            ],
          ),

        ),
        SizedBox(height: 10.h,),
        Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: SizedBox(
            height: 250.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3.0.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0.r),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                            height: 200.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DescripationScreen(movie: movie)
                              ));

                        } ,
                      ),
                      // SizedBox(height:3 ),
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.sp,color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}