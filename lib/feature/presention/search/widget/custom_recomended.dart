import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/feature/presention/descrip/descripation_screen.dart';
import '../../../../core/model/movie_model.dart';
import '../../../../core/providers/downloaded_provider.dart';
import '../../../../core/providers/movie_provider.dart';
import '../../home/see_more_page.dart';


class CustomRecommended extends StatelessWidget {
  final String title;

  CustomRecommended({required this.title});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final downloadedProvider = Provider.of<DownloadedProvider>(context);

    return FutureBuilder<List<Movie>>(
      future: downloadedProvider.getRecommendedMovies(movieProvider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text(''));
        }

        final recommendedMovies = snapshot.data!;
        return buildCategory(title, recommendedMovies, context);
      },
    );
  }

  Widget buildCategory(String title, List<Movie> movies, BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeMorePage(
                          Catmovies: movies,
                        ),
                      ),
                    );
                  },
                  child:  Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 10.h),
          Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.0.w),
                    child: Column(
                      children: [
                        movie.posterPath != null
                            ? GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0.r),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DescripationScreen(movie: movie)
                              ),
                            );
                          },
                        )
                            : Container(
                          width: 100.w,
                          height: 150.h,
                          color: Colors.grey,
                          child: const Icon(Icons.movie),
                        ),
                        Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}