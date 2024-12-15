import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20,left: 20,right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: ' Enter your neme',
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white60),
        errorStyle: TextStyle(color: Color(0xffE01616)),
        ),
        style: TextStyle(color: Colors.white70),
        validator: (value){
          if(value==null || value.isEmpty){
            return 'Please enter your name';
          }
          return null;
        },
      ),
    );
  }
}
