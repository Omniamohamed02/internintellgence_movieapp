import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/custom_image.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/tabbar/custom_tabs.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/movie_descripation.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/movie_name.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/row_buttons.dart';
import '../../../core/model/movie_model.dart';
import '../../../core/providers/movie_provider.dart';
import '../../../core/providers/saved_provider.dart';

class DescripationScreen extends StatefulWidget {
  const DescripationScreen({super.key, required this.movie});
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
    final savedProvider = Provider.of<SavedProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF070F2B),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomImage(
              posterPath: widget.movie.posterPath,
              onSaveMovie: () {
                savedProvider.add(widget.movie);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Movie Saved!')),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: MovieName(
              title: widget.movie.title,
              releaseDate: widget.movie.releaseDate,
            ),
          ),
          SliverToBoxAdapter(
            child: RowButtons(movie: widget.movie),
          ),
          SliverToBoxAdapter(
            child: MovieDescription(
              description: widget.movie.description,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: CustomTabs(movie: widget.movie),
          ),
        ],
      ),
    );
  }
}
