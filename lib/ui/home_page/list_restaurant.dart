import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/card_restaurant.dart';

class ListRestaurant extends StatelessWidget with Spacing {
  final List<Restaurant> restaurants;

  const ListRestaurant({
    super.key,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Rekomendasi untuk mu!',
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gap(y: 18.0),
            Column(
              children: restaurants.map((item) {
                return CardRestaurant(restaurant: item, textTheme: textTheme);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
