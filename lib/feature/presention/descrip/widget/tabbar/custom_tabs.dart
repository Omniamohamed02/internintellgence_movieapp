import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/tabbar/epsiode.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/tabbar/review_tab.dart';
import 'package:new_movie_app/feature/presention/descrip/widget/tabbar/similiar_tab.dart';
import '../../../../../core/model/movie_model.dart';

class CustomTabs extends StatefulWidget {
  const CustomTabs({super.key, required this.movie});
  final Movie movie;

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070F2B),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xffE01616),
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'Trailer'),
              Tab(text: 'Similiar'),
              Tab(text: 'Review'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                EpisodeTab(movie: widget.movie),
                SimilarTab(movie: widget.movie),
                ReviewsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
