import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<Map<String, dynamic>> reviews = [];
  TextEditingController reviewController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  double rating = 0.0;

  void addReview() {
    if (reviewController.text.isNotEmpty && nameController.text.isNotEmpty) {
      setState(() {
        reviews.add({
          'name': nameController.text,
          'review': reviewController.text,
          'rating': rating,
        });
        reviewController.clear();
        nameController.clear();
        rating = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070F2B),
      body: SafeArea(
        child: SingleChildScrollView( 
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputSection(),
              SizedBox(height: 20.h),
              _buildReviewsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Card(
      color: const Color(0xFF0B163A),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Write a Review",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: const Color(0xffE01616),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Your Name",
                labelStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.person, color: Colors.white54),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Color(0xffE01616)),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            SizedBox(height: 12.h),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: reviewController,
              decoration: InputDecoration(
                labelText: "Your Review",
                labelStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.edit, color: Colors.white54),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Color(0xffE01616)),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 14.h),
            Center(
              child: ElevatedButton(
                onPressed: addReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE01616),
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsList() {
    if (reviews.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            "No reviews yet. Be the first to review!",
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      );
    }
    return Column(
      children: reviews.map((review) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Card(
            color: const Color(0xFF0B163A),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                      RatingBarIndicator(
                        rating: review['rating'],
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    review['review'],
                    style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
