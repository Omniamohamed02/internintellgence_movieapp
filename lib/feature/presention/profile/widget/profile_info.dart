import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Container(
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             border:Border.all(color: Colors.white,width: 2.w)
           ),
           child: CircleAvatar(
            radius: 50,
                   backgroundImage: AssetImage('assets/image/omnia.jpg',),
                   backgroundColor: Colors.transparent,

                 ),
         ),
          Text('Omnia Mohamed',style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold),),
          Text('omnia@gmail',style: TextStyle(color: Colors.white,fontSize: 14.sp,),)
        ],
      ),
    );
  }
}
