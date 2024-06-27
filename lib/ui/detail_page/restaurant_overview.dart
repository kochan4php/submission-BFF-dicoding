import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_location.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_rating.dart';

class RestaurantOverview extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const RestaurantOverview({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 250,
                child: Text(restaurant.name, style: textTheme.headlineMedium),
              ),
              gap(y: 15.0),
              RestaurantLocation(restaurant: restaurant),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 9, right: 9),
            child: RestaurantRating(restaurant: restaurant),
          ),
        ],
      ),
    );
  }
}
