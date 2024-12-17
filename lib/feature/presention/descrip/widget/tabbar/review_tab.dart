import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReviewsPage extends StatefulWidget {
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
      backgroundColor: Color(0xFF070F2B),
      body: Column(
        children: [
          _buildInputSection(),
          SizedBox(height: 20.h),
          Expanded(child: _buildReviewsList()),
        ],
      ),

    );
  }

  Widget _buildInputSection() {
    return Card(
      color: Color(0xFF070F2B),
      elevation: 5.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Write a Review",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Color(0xffE01616),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Your Name",
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: reviewController,
              decoration: InputDecoration(
                labelText: "Your Review",
                fillColor:Colors.white,
                prefixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10.h),
            Center(
              child: ElevatedButton(
                onPressed: addReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE01616),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text("Submit"),
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
        child: Text(
          "No reviews yet. Be the first to review!",
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      );
    }
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.h),
          child: Card(
            color:Color(0xFF070F2B),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                        ),
                      ),
                      RatingBarIndicator(
                        rating: review['rating'],
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    review['review'],
                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}