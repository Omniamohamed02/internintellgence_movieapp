import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/home/widget/category_list_view.dart';
 
import 'package:new_movie_app/feature/presention/search/widget/custom_recomended.dart';

import '../../../core/providers/movie_provider.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();


  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 30.h),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: searchController,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    movieProvider.searchMovies(query); // Trigger search
                  } else {
                    movieProvider.searchResults = []; // Clear results on empty query
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF25233D),
                  contentPadding:  EdgeInsets.symmetric(vertical: 15.0.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0.r),
                    borderSide:  BorderSide(width: 0.8.w, color: Color(0xFF17212C)),
                  ),
                  hintText: 'Search by title, genre, actor',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon:  Icon(Icons.search, size: 30.sp, color: Colors.white),
                ),
              ),
            ),
             SizedBox(height: 20.h),
            if (movieProvider.isSearching)
              const Center(child: CircularProgressIndicator())
            else if (movieProvider.searchResults.isNotEmpty)
              CategoryList(   title: 'Search Results', movies: movieProvider.searchResults,),
            if (movieProvider.searchResults.isEmpty && !movieProvider.isSearching)
              Column(
                children: [
                  CategoryList(title: 'Popular', movies: movieProvider.popularMovies, ),
                  CustomRecommended(title: "Recommended"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}