import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({super.key});

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  double _rating = 5;
  final List<double> oneStars = [];
  final List<double> twoStars = [];
  final List<double> threeStars = [];
  final List<double> fourStars = [];
  final List<double> fiveStars = [];

  int numOfOneStars() {
    return oneStars.length;
  }

  int numOfTwoStars() {
    return twoStars.length;
  }

  int numOfThreeStars() {
    return threeStars.length;
  }

  int numOfFourStars() {
    return fourStars.length;
  }

  int numOfFiveStars() {
    return fiveStars.length;
  }

  int totalNumOfRatings() {
    return numOfOneStars() +
        numOfTwoStars() +
        numOfThreeStars() +
        numOfFourStars() +
        numOfFiveStars();
  }

  int totalRatings() {
    return numOfOneStars() * 1 +
        numOfTwoStars() * 2 +
        numOfThreeStars() * 3 +
        numOfFourStars() * 4 +
        numOfFiveStars() * 5;
  }

  double averageRating() {
    return totalNumOfRatings() == 0 ? _rating : totalRatings() / totalNumOfRatings();
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      itemCount: 5,
      itemSize: 20.0,
      unratedColor: kAmber.withAlpha(50),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: kAmber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
          switch (rating) {
            case 1:
              oneStars.add(rating);
              break;
            case 2:
              twoStars.add(rating);
              break;
            case 3:
              threeStars.add(rating);
              break;
            case 4:
              fourStars.add(rating);
              break;
            case 5:
              fiveStars.add(rating);
              break;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('averageRating${averageRating()}');
      print('totalNumOfRatings${totalNumOfRatings()}');
      print('totalRatings${totalRatings()}');
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rating: $_rating',
          ),
          _ratingBar(),
          RatingBarIndicator(
            rating: averageRating(),
            itemSize: 20.0,
            unratedColor: kAmber.withAlpha(50),
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star,
                color: kAmber,
              );
            },
          )
        ],
      ),
    );
  }
}
