import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconsButton extends StatelessWidget {
  const CustomIconsButton({super.key, required this.Images, required this.Name});
final String Images;
final String Name;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){}, child: Row(
      children: [
        Image.asset(Images,width: 25.w,height: 25.h,),
        SizedBox(width: 10.w,),
        Text('$Name',style: TextStyle(color: Colors.white),)
      ],
    )
        ,style: ElevatedButton.styleFrom(backgroundColor: Color(0xff222831),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),),maximumSize: Size(150.h, 300.w) ),
    );
  }
}

