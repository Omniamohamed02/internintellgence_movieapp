import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
 
import 'package:new_movie_app/feature/presention/home/widget/category_row.dart';
import 'package:new_movie_app/feature/presention/home/widget/mycarousel.dart';
import 'package:new_movie_app/feature/presention/home/widget/category_list_view.dart';

import '../../../core/providers/movie_provider.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    if (movieProvider.isLoading) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF070420),
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (movieProvider.errorMessage != null) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF070420),

          body: Center(child: Text(movieProvider.errorMessage!)),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF070F2B),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: const Color(0xFF070F2B),
            height: 200.h,
            child:  MyCarousel(movieProvider.trendingMovies),
          ),
          SizedBox(height: 10.h),
         CategoryRow(),
          CategoryList(title: 'Popular Movies', movies: movieProvider.popularMovies, ),
          CategoryList(title: 'Top Rated Movies', movies: movieProvider.topRatedMovies ),
          CategoryList(title: 'Trending Movies', movies: movieProvider.trendingMovies )


        ],
      ),
    ));
  }
}
