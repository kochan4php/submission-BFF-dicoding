import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';

class RestaurantLocation extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const RestaurantLocation({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        const Icon(
          Icons.location_on,
          size: 20,
          color: Colors.red,
        ),
        gap(x: 5.0),
        Text(restaurant.city, style: textTheme.titleLarge),
      ],
    );
  }
}
