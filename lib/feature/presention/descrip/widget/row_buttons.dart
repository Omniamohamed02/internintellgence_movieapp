import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/model/movie_model.dart';
import '../../../../core/providers/downloaded_provider.dart';

class RowButtons extends StatelessWidget {
   RowButtons({super.key, required this.movie,});
   final Movie movie;


  @override
  Widget build(BuildContext context) {
    final dp=Provider.of<DownloadedProvider>(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.play_arrow,color: Colors.white,),
            label: Text('Play',style: TextStyle(color: Colors.white),) ,

            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE01616)),
          ),
          SizedBox(width: 20.w,),
          ElevatedButton.icon(
                  onPressed: (){
                     dp.add(movie);
                  ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                      content: Text('Movie downloaded !'),
                  ),
                  );
                  },
            icon:   Icon(Icons.play_for_work,color: Colors.white,),
             label:  Text('Download',style: TextStyle(color: Colors.white)),
           style:  ElevatedButton.styleFrom(backgroundColor:  Color(0xff222831),),)


        ],
      ),
    );
  }
}
