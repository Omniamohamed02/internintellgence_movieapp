import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie_app/feature/presention/auth/widget/call_to_action.dart';
import 'package:new_movie_app/feature/presention/auth/widget/custom_button.dart';
import 'package:new_movie_app/feature/presention/auth/widget/custom_row_buttons.dart' show CustomRowButtons;
import 'package:new_movie_app/feature/presention/auth/widget/divider.dart' show Dividers;
import 'package:new_movie_app/feature/presention/auth/widget/name_text_field.dart';
import 'package:new_movie_app/feature/presention/auth/widget/text_field.dart';

import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070F2B),

      body: SingleChildScrollView(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text('Signup',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                  fontSize: 24.sp,)),
            ),
            NameTextField(),
            TextFields(),
            CustomButton(ButtonName: 'Signup',),
            Dividers(),
            CustomRowButtons(),
            CallToAction(Sentence: 'Do you already have an account?', ButtonName: 'Login Now', Navigate: LoginScreen(),)
          ],
        ),
      ),
    );
  }
}
