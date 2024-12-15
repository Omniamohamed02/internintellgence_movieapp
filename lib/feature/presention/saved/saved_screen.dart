import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/feature/presention/saved/widget/saved_card.dart';

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
          actions: [
            ElevatedButton(
              onPressed: () {
                sp.savedMovie.clear();
              },
              child: Text(
                "Delete",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: sp.savedMovie.length,
            itemBuilder: (context, index) {
              return SavedCard(movie: sp.savedMovie[index]);
            }));
  }}