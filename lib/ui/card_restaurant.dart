import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

class CardRestaurant extends StatelessWidget with Spacing {
  final Restaurant restaurant;
  final TextTheme textTheme;

  const CardRestaurant({
    super.key,
    required this.restaurant,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final Widget restaurantImage = ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: restaurant.picture,
        height: 85,
        fit: BoxFit.cover,
        placeholder: (BuildContext context, String url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child: Container(height: 85, color: Colors.white),
          );
        },
        errorWidget: (BuildContext context, String url, Object? error) {
          return Container(
            height: 85,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.error, color: Colors.red, size: 40),
                Text(
                  'Error Network',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );

    final Widget restaurantBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(restaurant.name, style: textTheme.titleLarge),
        gap(y: 5),
        Row(
          children: <Widget>[
            const Icon(Icons.location_on, size: 16, color: Colors.red),
            gap(x: 5),
            Text(restaurant.city, style: textTheme.bodyLarge),
          ],
        ),
        gap(y: 5),
        Row(
          children: <Widget>[
            const Icon(Icons.star, size: 16, color: Colors.amber),
            gap(x: 5),
            Text(restaurant.rating.toString(), style: textTheme.labelLarge),
          ],
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detailPageRoute,
            arguments: restaurant.id,
          );
        },
        splashColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: restaurantImage),
            gap(x: 13),
            Expanded(flex: 2, child: restaurantBody),
          ],
        ),
      ),
    );
  }
}
