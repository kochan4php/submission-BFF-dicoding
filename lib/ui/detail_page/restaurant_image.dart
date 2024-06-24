import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/bookmark/bookmark_provider.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/detail_page/custom_app_bar.dart';

class RestaurantImage extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const RestaurantImage({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkProvider>(
      builder: (
        BuildContext context,
        BookmarkProvider value,
        Widget? child,
      ) {
        return Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              child: Image.network(
                restaurant.picture,
                height: 325,
                fit: BoxFit.cover,
              ),
            ),
            CustomAppBar(provider: value, restaurant: restaurant),
          ],
        );
      },
    );
  }
}
