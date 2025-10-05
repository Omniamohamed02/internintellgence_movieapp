import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/download/widget/download_card.dart';

import '../../../core/providers/downloaded_provider.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<DownloadedProvider>(context);
    return  Scaffold(
        backgroundColor: const Color(0xFF070F2B),
        appBar: AppBar(
          backgroundColor: const Color(0xFF070F2B),
          title:  Text(
              'Download',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          centerTitle: true,
          /*actions: [
            ElevatedButton(
              onPressed: (){

              },
              child: Text(
                "Delete",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.transparent,
                ),
              ),
          ],*/
        ),

        body: ListView.builder(
                itemCount: dp.downloadedMovie.length,
                itemBuilder: (context, index) {
                  return DownloadCard(movie:  dp.downloadedMovie[index],);
                },
              ),
            );

  }
}
