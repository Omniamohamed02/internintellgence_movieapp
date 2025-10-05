import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/epsiode_card.dart';

import '../../../../../core/model/movie_model.dart';
import '../../../../../core/providers/movie_provider.dart';
 


class EpisodeTab extends StatelessWidget {
  final Movie movie;

  EpisodeTab({required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final trailerUrl = movieProvider.movieTrailers[movie.id];
    // final movieViewModel = Provider.of<MovieViewModel>(context);
    // final trailerUrl = movieViewModel.getTrailerUrl(movie);

    if (trailerUrl == null || trailerUrl.isEmpty) {
      return const Center(
        child: Text(
          'Trailer not available.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    final parsedTrailerUrl = Uri.tryParse(trailerUrl);
    if (parsedTrailerUrl == null) {
      return const Center(
        child: Text(
          'Invalid trailer URL.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return EpsiodeCard(movie: movie,url: parsedTrailerUrl,);
  }
}
