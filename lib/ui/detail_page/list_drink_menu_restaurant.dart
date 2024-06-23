import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/card_restaurant_menu.dart';

class ListDrinkMenuRestaurant extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const ListDrinkMenuRestaurant({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < restaurant.menu!.drinks.length; i++) ...[
            CardRestaurantMenu(
              menuImage: 'assets/images/drink.png',
              menuName: restaurant.menu!.drinks[i].name,
            ),

            // Only add spacing if it's not the last item
            if (i != restaurant.menu!.drinks.length - 1) gap(x: 10),
          ]
        ],
      ),
    );
  }
}
