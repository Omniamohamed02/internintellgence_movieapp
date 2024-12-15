import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String Title;
  final  Icon Leading ;
  final Icon Trailing;
  const CustomListTile({super.key, required this.Title, required this.Leading, required this.Trailing});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        iconColor: Colors.white,
        tileColor: const Color(0xFF070F2B),
        selectedTileColor:  Color(0xff222831),
        title: Text(Title,style: TextStyle(color: Colors.white),),
        leading: Leading ,
        trailing: Trailing
      ),
    );
  }
}
