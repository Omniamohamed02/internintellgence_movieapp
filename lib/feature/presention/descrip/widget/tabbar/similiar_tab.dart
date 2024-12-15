import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/model/movie_model.dart';
import '../../view_model/movie_view_model.dart';
import '../similiar.dart';

class SimilarTab extends StatelessWidget {
  final Movie movie;

  SimilarTab({required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieViewModel>(context);
    final similarMoviesList = movieViewModel.getSimilarMovies(movie);

    if (similarMoviesList == null || similarMoviesList.isEmpty) {
      return const Center(
        child: Text(
          'No similar movies found.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Similiar(movie: movie,);
  }
}
