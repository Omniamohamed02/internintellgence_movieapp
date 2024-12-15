import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/feature/presention/home/widget/category_button.dart';

import '../../../../core/util/string.dart';


class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.0 .h),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: [
                CategoryButton(() {}, 'Acton', context, Strings.actionGenreId),

                CategoryButton(() {}, 'Drama', context, Strings.dramaGenreId),

                CategoryButton(() {}, 'Comedy', context, Strings.comedyGenreId),

                CategoryButton(() {}, 'Romance', context,
                    Strings.romanceGenreId),

                CategoryButton(() {}, 'Animation', context,
                     Strings.animationGenreId),

                CategoryButton(() {}, 'Crime', context, Strings.crimeGenreId),

              ]
          ),
        ),
      );
  }
}
