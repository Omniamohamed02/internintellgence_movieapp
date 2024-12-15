import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/feature/presention/auth/signup_screen.dart';
import 'package:untitled1/feature/presention/auth/widget/call_to_action.dart';
import 'package:untitled1/feature/presention/auth/widget/custom_button.dart';
import 'package:untitled1/feature/presention/auth/widget/custom_row_buttons.dart';
import 'package:untitled1/feature/presention/auth/widget/divider.dart';
import 'package:untitled1/feature/presention/auth/widget/text_field.dart';

import '../../../core/model/movie_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,});

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
    child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
    fontSize: 24.sp,)),
    ),
      TextFields(),
      CustomButton(ButtonName: 'Login',),
      Dividers(),
      CustomRowButtons(),
      CallToAction(Sentence: 'Do you already have an account?', ButtonName: 'Signup Now', Navigate:SignupScreen())])

    )
    );
  }
}
