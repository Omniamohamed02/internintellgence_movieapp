import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconsButton extends StatelessWidget {
  const CustomIconsButton({super.key, required this.Images, required this.Name});
final String Images;
final String Name;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 160.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff222831),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Images, width: 24.w, height: 24.h, fit: BoxFit.contain),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                Name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

