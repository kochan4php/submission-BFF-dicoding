import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';

class RestaurantRating extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const RestaurantRating({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.amber,
        ),
        gap(x: 5.0),
        Text(
          restaurant.rating.toString(),
          style: textTheme.titleLarge,
        ),
      ],
    );
  }
}
