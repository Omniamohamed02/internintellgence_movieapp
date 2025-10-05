import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/similiar_card.dart';

import '../../../../../core/model/movie_model.dart';
import '../../../../../core/providers/movie_provider.dart';
 

class SimilarTab extends StatelessWidget {
  final Movie movie;

  SimilarTab({required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final similarMoviesList = movieProvider.similarMovies[movie.id];
    // final movieViewModel = Provider.of<MovieViewModel>(context);
    // final similarMoviesList = movieViewModel.getSimilarMovies(movie);

    if (similarMoviesList == null || similarMoviesList.isEmpty) {
      return const Center(
        child: Text(
          'No similar movies found.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: similarMoviesList.length,
      itemBuilder: (context, index) {
        final movie = similarMoviesList[index];
        return SimiliarCard(movie: movie);
      },
    );
  }
  }

