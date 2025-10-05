import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie_app/feature/presention/descrip/descripation_screen.dart';
import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/saved/widget/saved_card.dart';

import '../../../core/providers/saved_provider.dart';


class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final sp = Provider.of<SavedProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xFF070420),
        appBar: AppBar(backgroundColor: Color(0xFF070420),
          title: Text('Saved', style: TextStyle(color: Colors.white),),
          centerTitle: true,
         
        ),
        body: ListView.builder(
            itemCount: sp.savedMovie.length,
            itemBuilder: (context, index) {
              return SavedCard(movie: sp.savedMovie[index]);
            }));
  }}