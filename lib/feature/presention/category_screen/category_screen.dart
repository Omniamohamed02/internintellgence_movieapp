import 'package:flutter/material.dart';
import 'package:new_movie_app/feature/presention/category_screen/widget/genre_card.dart';
import 'package:provider/provider.dart';


 
import '../../../core/providers/movie_provider.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.genreId, this.genreTitl});

  final int genreId;
  final genreTitl;


  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      appBar: AppBar(
        title: Text('${genreTitl}',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor:const Color(0xFF070420) ,
        iconTheme: IconThemeData(
          color: Colors.white,),
      ),
      body: movieProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GenreCard(
              context,
              "",
              genreId ,
            ),
          ],
        ),
      ),
    );
  }
}