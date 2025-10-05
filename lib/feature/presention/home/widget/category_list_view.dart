import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:new_movie_app/feature/presention/descrip/descripation_screen.dart';
import 'package:new_movie_app/feature/presention/home/widget/category_card.dart';

import '../../../../core/model/movie_model.dart';
import '../see_more_page.dart';
import 'category_header.dart';
class CategoryList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
 

  const CategoryList({
    Key? key,
    required this.title,
    required this.movies, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryHeader(
            title: title,
            onSeeMoreTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeMorePage(Catmovies: movies),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.0.w),
                    child: MovieCard(
                      movie: movie,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescripationScreen(movie: movie,),
                          ),
                        );
                      },
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
}
