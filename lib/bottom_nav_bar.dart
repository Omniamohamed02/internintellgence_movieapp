import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:new_movie_app/feature/presention/download/download_screen.dart';
import 'package:new_movie_app/feature/presention/home/home_screen.dart';
import 'package:new_movie_app/feature/presention/profile/profile_screen.dart';
import 'package:new_movie_app/feature/presention/saved/saved_screen.dart';
import 'package:new_movie_app/feature/presention/search/search_screen.dart';


class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _CurrentIndex = 0;
  PageController _pageController = PageController();
  bool IsIconBold = false;

  void _onItemTapped(int index) {
    setState(() {
      _CurrentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          SearchScreen(),
          SavedScreen(),
          DownloadScreen(),
          ProfileScreen()
        ],
        onPageChanged: (index) {
          setState(() {
            _CurrentIndex = index;
          });
        },
      ),
      bottomNavigationBar:  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  Color(0xff222831),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          currentIndex: _CurrentIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(

                IconlyLight.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_for_work),
                label: 'Download'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Profile'),

          ]),

    );
  }
}