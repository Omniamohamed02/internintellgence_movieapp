import 'package:flutter/material.dart';

class Dividers extends StatelessWidget {
  const Dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              color: Colors.white60,
            ),
          ),
          Text('Or',style: TextStyle(color: Colors.white),),
          Expanded(
            child: Divider(
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
