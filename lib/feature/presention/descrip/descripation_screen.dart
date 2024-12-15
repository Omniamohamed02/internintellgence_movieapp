import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/feature/presention/descrip/widget/custom_image.dart';
import 'package:untitled1/feature/presention/descrip/widget/tabbar/custom_tabs.dart';
import 'package:untitled1/feature/presention/descrip/widget/movie_descripation.dart';
import 'package:untitled1/feature/presention/descrip/widget/movie_name.dart';
import 'package:untitled1/feature/presention/descrip/widget/row_buttons.dart';

import '../../../core/model/movie_model.dart';
import '../../../core/providers/downloaded_provider.dart';
import '../../../core/providers/movie_provider.dart';
import '../../../core/providers/saved_provider.dart';

class DescripationScreen extends StatefulWidget {
  DescripationScreen({super.key, required this.movie});
  final Movie movie;
  @override
  State<DescripationScreen> createState() => _DescripationScreenState();
}

class _DescripationScreenState extends State<DescripationScreen> {
  @override
  void initState() {
    super.initState();
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.fetchSimilarMovies(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final dp = Provider.of<DownloadedProvider>(context);
    final sd = Provider.of<SavedProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF070F2B),
      body: ListView(
        children: [
          CustomImage( posterPath: widget.movie.posterPath,
            onSaveMovie: ()  {
            sd.add(widget.movie);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Movie Saved!')),
            );
          },
          ),
          MovieName( title: widget.movie.title, releaseDate: widget.movie.releaseDate,),
          RowButtons(movie: widget.movie ),
          MovieDescription(description: widget.movie.description, ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: CustomTabs(movie: widget.movie),
          ),
        ],
      ),
    );
  }
}