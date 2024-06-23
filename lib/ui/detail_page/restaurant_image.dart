import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';

class RestaurantImage extends StatelessWidget with Spacing {
  final Restaurant restaurant;
  final VoidCallback onPressed;
  final bool isFavorite;

  const RestaurantImage({
    super.key,
    required this.restaurant,
    required this.onPressed,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          child: Image.network(
            restaurant.pictureId,
            height: 325,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
