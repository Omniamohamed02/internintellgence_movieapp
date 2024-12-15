import 'package:flutter/material.dart';
import '../../../../core/model/movie_model.dart';
import '../../../../core/providers/movie_provider.dart';

import 'package:provider/provider.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieProvider movieProvider;

  MovieViewModel(this.movieProvider);

  String? getTrailerUrl(Movie movie) {
    return movieProvider.movieTrailers[movie.id];
  }

  List<Movie>? getSimilarMovies(Movie movie) {
    return movieProvider.similarMovies[movie.id];
  }

  String getDescription(Movie movie) {
    return movie.description?.isNotEmpty == true ? movie.description! : 'No description available.';
  }
}
