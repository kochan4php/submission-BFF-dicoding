import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/detail_page/list_drink_menu_restaurant.dart';
import 'package:restaurant_app/ui/detail_page/list_food_menu_restaurant.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_location.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_rating.dart';

class RestaurantBody extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const RestaurantBody({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(restaurant.name, style: textTheme.headlineMedium),
          gap(y: 12.0),
          RestaurantLocation(restaurant: restaurant),
          gap(y: 12.0),
          RestaurantRating(restaurant: restaurant),
          gap(y: 20.0),
          Text(restaurant.description, style: textTheme.bodyLarge),
          gap(y: 25.0),
          Text('Menu Makanan :', style: textTheme.titleMedium),
          gap(y: 10),
          ListFoodMenuRestaurant(restaurant: restaurant),
          gap(y: 20.0),
          Text('Menu Minuman :', style: textTheme.titleMedium),
          gap(y: 10.0),
          ListDrinkMenuRestaurant(restaurant: restaurant),
          gap(y: 18.0),
        ],
      ),
    );
  }
}
