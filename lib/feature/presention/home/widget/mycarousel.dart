import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/feature/presention/descrip/descripation_screen.dart';

import '../../../../core/model/movie_model.dart';

Widget MyCarousel(List<Movie> trendingMovies) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: 300.h,
      child: CarouselSlider.builder(
        itemCount: trendingMovies.length,
        itemBuilder: (context, index, realIndex) {
          final movie = trendingMovies[index];

          return GestureDetector(

            onTap:(){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DescripationScreen(movie: movie,)
                  ));


            },
            child: Stack(
              children: [
                Container(
                  height:300.h,
                  width: double.infinity,
                  child: movie.posterPath != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0.r),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400.h,
                    ),
                  )
                      : Container(
                    width: double.infinity,
                    height: 200.h,
                    color: Colors.grey,
                    child: Icon(Icons.movie, size: 50),
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 10.w,
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 400.h,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8.w,
        ),
      ),
    ),
  );
}