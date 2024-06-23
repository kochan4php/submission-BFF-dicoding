import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/ui/card_restaurant.dart';

class RestaurantSearchResult extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantSearchResult({
    super.key,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 18.0,
        ),
        child: ListView(
          children: restaurants.map((item) {
            return CardRestaurant(restaurant: item, textTheme: textTheme);
          }).toList(),
        ),
      ),
    );
  }
}
