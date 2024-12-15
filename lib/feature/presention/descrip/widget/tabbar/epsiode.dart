import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/feature/presention/descrip/widget/epsiode_card.dart';

import '../../../../../core/model/movie_model.dart';
import '../../view_model/movie_view_model.dart';


class EpisodeTab extends StatelessWidget {
  final Movie movie;

  EpisodeTab({required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieViewModel>(context);
    final trailerUrl = movieViewModel.getTrailerUrl(movie);

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
