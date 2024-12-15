import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/feature/presention/auth/login_screen.dart';
import 'package:untitled1/feature/presention/descrip/descripation_screen.dart';
import '../../../../core/model/movie_model.dart';
class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          movie.posterPath != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0.r),
            child: Image.network(
              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
              height: 200.h,
              fit: BoxFit.cover,
            ),
          )
              : Container(
            width: 100.w,
            height: 150.h,
            color: Colors.grey,
            child: Icon(Icons.movie),
          ),
          SizedBox(height: 3.h),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
