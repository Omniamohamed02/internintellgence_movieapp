
import 'package:flutter/material.dart';
import 'package:new_movie_app/feature/presention/auth/widget/custom_icons_button.dart';


class CustomRowButtons extends StatelessWidget {
  const CustomRowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       CustomIconsButton(Images: 'assets/image/google.png', Name: 'Google', ),
        CustomIconsButton(Images: 'assets/image/facebook.png', Name: 'Facebook',),
      ],
    );
  }
}

