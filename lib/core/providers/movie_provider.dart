import 'package:flutter/material.dart';
import 'package:new_movie_app/core/model/movie_model.dart';

import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> trendingMovies = [];
  Map<int, String> genres = {}; 
  Map<int, List<Movie>> genreMovies = {}; 

  
  Map<int, String?> movieTrailers = {}; 
  Map<int, List<Movie>> similarMovies = {}; 

  bool isLoading = true;
  String? errorMessage;

  MovieProvider() {
    fetchInitialData();
  }

  
  Future<void> fetchInitialData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      popularMovies = await _movieService.fetchPopularMovies();
      topRatedMovies = await _movieService.fetchTopRatedMovies();
      trendingMovies = await _movieService.fetchTrendingMovies();
      genres = await _movieService.fetchGenres();
     
      for (var movie in popularMovies) {
        await fetchTrailerForMovie(movie.id);
      }
    } catch (e) {
      errorMessage = 'Failed to load movies or genres. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  
  Future<void> fetchMoviesForGenre(int genreId) async {
    if (genreMovies.containsKey(genreId)) return; 

    try {
      final movies = await _movieService.fetchMoviesByGenre(genreId: genreId);
      genreMovies[genreId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching movies for genre $genreId: $e');
    }
  }

  
  Future<void> refreshMoviesForGenre(int genreId) async {
    try {
      final movies = await _movieService.fetchMoviesByGenre(genreId: genreId);
      genreMovies[genreId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error refreshing movies for genre $genreId: $e');
    }
  }

  
  Future<void> fetchTrailerForMovie(int movieId) async {
    try {
      final trailerUrl = await _movieService.fetchMovieTrailer(movieId);
      movieTrailers[movieId] = trailerUrl;
      notifyListeners();
    } catch (e) {
      print('Error fetching trailer for movie $movieId: $e');
    }
  }

  
  Future<void> fetchSimilarMovies(int movieId) async {
    if (similarMovies.containsKey(movieId)) return; 

    try {
      final movies = await _movieService.fetchSimilarMovies(movieId);
      similarMovies[movieId] = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching similar movies for movie $movieId: $e');
    }
  }

  List<Movie> searchResults = [];
  bool isSearching = false;
  String? searchError;

  
  Future<void> searchMovies(String query) async {
    isSearching = true;
    searchError = null;
    notifyListeners();

    try {
      searchResults = await _movieService.searchMovies(query);
    } catch (e) {
      searchError = 'Failed to search for movies. Please try again.';
    } finally {
      isSearching = false;
      notifyListeners();
    }
  }
  Movie? _currentMovie;

Movie? get currentMovie => _currentMovie;

void setCurrentMovie(Movie movie) {
  _currentMovie = movie;
  notifyListeners();
}

void clearCurrentMovie() {
  _currentMovie = null;
  notifyListeners();
}
}