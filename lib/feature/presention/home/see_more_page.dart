import 'package:flutter/material.dart';
import 'package:untitled1/feature/presention/saved/widget/saved_card.dart';

import '../../../core/model/movie_model.dart';


class SeeMorePage extends StatelessWidget {
  SeeMorePage({super.key, required this.Catmovies});
  final  List<Movie> Catmovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      appBar: AppBar(backgroundColor:Color(0xFF070420) ,
        iconTheme: IconThemeData(
          color: Colors.white,),),
      body: ListView.builder(
          itemCount: Catmovies.length,
          itemBuilder: (context,index){
            return SavedCard(movie: Catmovies[index]);

          }),

    );
  }
}