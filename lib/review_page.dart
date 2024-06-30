import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:review_page/screen1.dart';

class ReviewPage extends StatefulWidget {
  ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController reviewController = TextEditingController();
  String review = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 237, 237),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.amber,
          ),
          title: Text('Write a Review'),
          backgroundColor: Color.fromARGB(255, 248, 247, 247),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: AssetImage('assets/shezi.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  text: 'How was your experince\n',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  children: [
                    TextSpan(
                      text: 'with ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    TextSpan(
                      text: ' Flutter? ',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
              AnimatedRatingStars(
                initialRating: 3.5,
                minRating: 0.0,
                maxRating: 5.0,
                filledColor: Colors.amber,
                emptyColor: Colors.grey,
                filledIcon: Icons.star,
                halfFilledIcon: Icons.star_half,
                emptyIcon: Icons.star_border,
                onChanged: (double rating) {
                  // Handle the rating change here
                  print('Rating: $rating');
                },
                displayRatingValue: true,
                interactiveTooltips: true,
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
                starSize: 30.0,
                animationDuration: Duration(milliseconds: 300),
                animationCurve: Curves.easeInOut,
                readOnly: false,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Write a Comment'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Max 250 Words'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: reviewController,
                  onChanged: (value) {
                    review = value;
                  },
                  maxLines: 7,
                  autofocus: true,
                  maxLength: 250,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Write your review here',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print('Review Button Pressed $review');
                },
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Submit Review',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
