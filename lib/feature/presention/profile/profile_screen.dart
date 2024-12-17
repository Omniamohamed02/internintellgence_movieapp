import 'package:flutter/material.dart';
import 'package:untitled1/feature/presention/auth/login_screen.dart';
import 'package:untitled1/feature/presention/profile/widget/custom_list_tile.dart';
import 'package:untitled1/feature/presention/profile/widget/profile_info.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070F2B),
      appBar: AppBar(
      backgroundColor: const Color(0xFF070F2B),
        title: Center(
          child: Text('My Profile',style: TextStyle(color: Colors.white,fontSize: 22,
            fontWeight: FontWeight.bold,),),
        ),
      ),
      body: ListView(
        children: [
          ProfileInfo(),
          CustomListTile(Title: 'My Profile', Leading: Icon(Icons.person_outline), Trailing: Icon(Icons.arrow_forward_ios)),
          CustomListTile(Title: "Notification", Leading: Icon(Icons.notifications_none_outlined), Trailing: Icon(Icons.arrow_forward_ios)),
          CustomListTile(Title: 'History', Leading: Icon(Icons.history), Trailing: Icon(Icons.arrow_forward_ios)),
          CustomListTile(Title: "My Subscription", Leading:  Icon(Icons.date_range), Trailing: Icon(Icons.arrow_forward_ios)),
          CustomListTile(Title: "Setting", Leading:  Icon(Icons.settings), Trailing: Icon(Icons.arrow_forward_ios)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: CustomListTile(
              Title: 'Logout',
              Leading: Icon(Icons.logout),
              Trailing: Icon(Icons.arrow_forward_ios),
            ),
          ), ],
      ),
    );
  }
}
