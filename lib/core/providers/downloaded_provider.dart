import 'package:flutter/material.dart';
import 'package:new_movie_app/core/model/movie_model.dart';
import 'package:new_movie_app/core/providers/movie_provider.dart';

class DownloadedProvider extends ChangeNotifier {
  List<Movie> downloadedMovie = [];

  void add(Movie movie) {
    if (!downloadedMovie.contains(movie)) {
      downloadedMovie.add(movie);
      notifyListeners();
    }
  }

  void remove(Movie movie) {
    downloadedMovie.remove(movie);
    notifyListeners();
  }

  int get count {
    return downloadedMovie.length;
  }


  Future<List<Movie>> getRecommendedMovies(MovieProvider movieProvider) async {
    Set<Movie> recommendations = {};

    for (Movie movie in downloadedMovie) {
      if (!movieProvider.similarMovies.containsKey(movie.id)) {
        await movieProvider.fetchSimilarMovies(movie.id); 
      }

      final similarMovies = movieProvider.similarMovies[movie.id];
      if (similarMovies != null) {
        recommendations.addAll(similarMovies);
      }
    }

    return recommendations.toList(); 
  }
}