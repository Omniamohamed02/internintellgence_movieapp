import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class LastWatchedCard extends StatelessWidget {
  const LastWatchedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(

        elevation: 4.0,
        color:  Color(0xff222831),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/image/doctor strange.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
                height:80.h,
              ),
            ),
            Positioned(
              bottom: 40,
              left: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Color(0xff222831),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor Strange in the Multiverse of Madness',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:  TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          '1:50:35',
                          style: TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                        Text(
                          '2021',
                          style: TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(IconlyLight.arrow_down,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
