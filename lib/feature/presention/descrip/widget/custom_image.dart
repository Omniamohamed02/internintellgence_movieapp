import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// provider import removed (not used in this widget)


class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.posterPath, required this.onSaveMovie});
  final String posterPath;
  final VoidCallback onSaveMovie;
  @override
  Widget build(BuildContext context) {
  // saved provider usage removed here; callback handles saving
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color:   Color(0xFF070F2B),
              blurRadius: 20,
              spreadRadius: -5,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(20.r),
        ),

        width: double.infinity,
        height: 400.h,
        child: Stack(
           children: [
             Positioned.fill(
               child: Image.network('https://image.tmdb.org/t/p/w500$posterPath',
               width: double.infinity,
               fit: BoxFit.cover),
             ),
             Positioned.fill(
               child: Container(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(colors:[
                       Color(0xFF070F2B).withOpacity(0.1),
                       Color(0xFF070F2B)
                     ],
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     ),

                 ),
               ),
             ),
             Positioned(
               top: 30.h,
                 left: 20.w,
                 child: IconButton(onPressed: (){
                   Navigator.pop(context);
                 },
                     icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)
                 )
             ),
             Positioned(
               top: 30.h,
                 right: 20.w,
                 child: Row(
                   children: [
                     IconButton(onPressed: (){
                       onSaveMovie();
                     }, icon: Icon(Icons.bookmark,color: Colors.white,)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,))
                   ],
                 ))


           ] ),
      ),
    );
  }
}
