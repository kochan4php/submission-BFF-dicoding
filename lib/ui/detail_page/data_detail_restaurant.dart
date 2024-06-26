import 'package:flutter/material.dart';
import 'package:restaurant_app/data/providers/restaurant/detail_restaurant_provider.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_body.dart';
import 'package:restaurant_app/ui/detail_page/restaurant_image.dart';

class DataDetailRestaurant extends StatelessWidget with Spacing {
  final DetailRestaurantProvider provider;

  const DataDetailRestaurant({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RestaurantImage(restaurant: provider.restaurant),
          gap(y: 20.0),
          RestaurantBody(restaurant: provider.restaurant),
        ],
      ),
    );
  }
}
