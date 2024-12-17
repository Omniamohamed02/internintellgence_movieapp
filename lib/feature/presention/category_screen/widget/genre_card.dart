import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/feature/presention/descrip/descripation_screen.dart';

import '../../../../core/providers/movie_provider.dart';

Widget GenreCard(BuildContext context, String title, int genreId) {
  final movieProvider = Provider.of<MovieProvider>(context);


  if (!movieProvider.genreMovies.containsKey(genreId)) {
    movieProvider.fetchMoviesForGenre(genreId);
  }

  final movies = movieProvider.genreMovies[genreId];

  if (movies == null || movies.isEmpty) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('No movies found for $title.', style: const TextStyle(color: Colors.red)),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          childAspectRatio: 0.8, // Adjust aspect ratio for thumbnail
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                         DescripationScreen(movie: movie,)
                  ));
            },
            child: Column(
              children: [
                movie.posterPath != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height:150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  height: 100.h,
                  color: Colors.grey,
                  child: const Icon(Icons.movie, size: 50),
                ),


              ],
            ),
          );
        },
      ),
    ],
  );
}