import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/card_restaurant_menu.dart';

class ListFoodMenuRestaurant extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const ListFoodMenuRestaurant({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < restaurant.menu!.foods.length; i++) ...[
            CardRestaurantMenu(
              menuImage: 'assets/images/food.png',
              menuName: restaurant.menu!.foods[i].name,
            ),

            // Only add spacing if it's not the last item
            if (i != restaurant.menu!.foods.length - 1) gap(x: 10),
          ]
        ],
      ),
    );
  }
}
