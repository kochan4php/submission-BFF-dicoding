import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/favorite/favorite_provider.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/detail_page/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantImage extends StatelessWidget with Spacing {
  final Restaurant restaurant;

  const RestaurantImage({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (
        BuildContext context,
        FavoriteProvider value,
        Widget? child,
      ) {
        return Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              child: CachedNetworkImage(
                imageUrl: restaurant.picture,
                fit: BoxFit.cover,
                height: 325,
                placeholder: (BuildContext context, String url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: 325,
                      color: Colors.white,
                    ),
                  );
                },
                errorWidget: (
                  BuildContext context,
                  String url,
                  Object? error,
                ) {
                  return Container(
                    width: double.infinity,
                    height: 325,
                    color: Colors.grey[200]!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.error, size: 100, color: Colors.red),
                        gap(y: 15),
                        const Text(
                          'Network Error',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CustomAppBar(provider: value, restaurant: restaurant),
          ],
        );
      },
    );
  }
}
