import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/detail_page/list_drink_menu_restaurant.dart';
import 'package:restaurant_app/ui/detail_page/list_food_menu_restaurant.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_categories.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_overview.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_reviews.dart';

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
          RestaurantOverview(restaurant: restaurant),
          gap(y: 15.0),
          RestaurantCategories(categories: restaurant.categories!),
          gap(y: 15.0),
          Text(restaurant.description, style: textTheme.bodyLarge),
          gap(y: 25.0),
          Text('Menu Makanan :', style: textTheme.titleMedium),
          gap(y: 12),
          ListFoodMenuRestaurant(restaurant: restaurant),
          gap(y: 25.0),
          Text('Menu Minuman :', style: textTheme.titleMedium),
          gap(y: 12.0),
          ListDrinkMenuRestaurant(restaurant: restaurant),
          gap(y: 25.0),
          Text('Ulasan', style: textTheme.titleMedium),
          gap(y: 12),
          RestaurantReviews(customerReviews: restaurant.customerReviews!),
          gap(y: 25.0),
        ],
      ),
    );
  }
}
