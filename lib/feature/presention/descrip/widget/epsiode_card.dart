import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/model/movie_model.dart';
import '../../../../core/providers/movie_provider.dart';

class EpsiodeCard extends StatelessWidget {
  const EpsiodeCard({super.key, required this.movie, this.url});
  final Movie movie;
  final url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070F2B),
      body: Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        elevation: 4.0,
        child: Stack(
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: const Color(0xff222831),
                borderRadius: BorderRadius.circular(20.r),
              ),
              width: double.infinity,
            ),
            Positioned(
              left: 10.w,
              top: 10.h,
              bottom: 10.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 100.w,
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 120.w,
              right: 50.w,
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),

            Positioned(
                bottom: 20.h,
                left: 120.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE01616)) ,
                    onPressed: (){
                      launchUrl(url);
                      print('Play ${movie.title}');
                    },
                    child: Text('Watch Now',
                      style: TextStyle(color: Colors.white),))),
          ],
        ),
      ),
    );
  }
}
