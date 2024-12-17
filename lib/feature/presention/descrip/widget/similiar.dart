// import 'package:flutter/material.dart';
// import 'package:untitled1/core/model/movie_model.dart';
// import 'package:untitled1/feature/presention/descrip/widget/similiar_card.dart';
//
//
// class Similiar extends StatelessWidget {
//   const Similiar({super.key, required this.movie});
// final Movie movie;
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 8,
//         crossAxisSpacing: 8,
//         childAspectRatio: 0.7,
//       ),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 12,
//       itemBuilder: (context, index) {
//         return SimiliarCard(imagePath:'${movie.posterPath}');
//       },
//     );
//   }
// }
