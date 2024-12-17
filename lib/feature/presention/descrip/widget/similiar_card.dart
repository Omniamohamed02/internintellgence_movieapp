import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/model/movie_model.dart';
import 'package:untitled1/feature/presention/descrip/descripation_screen.dart';

class  SimiliarCard extends StatelessWidget {
  final Movie movie;

  const SimiliarCard ({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescripationScreen(movie: movie),
          ),
        );
      },
      child: movie.posterPath != null
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0.r),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              height: 150.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
              : Container(
            height: 200.h,
            color: Colors.grey,
            child: const Icon(Icons.movie, size: 50),
          ),


    );
  }
}
