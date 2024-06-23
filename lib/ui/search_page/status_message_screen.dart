import 'package:flutter/material.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/mixin/spacing.dart';

class StatusMessageScreen extends StatelessWidget with Spacing {
  final SearchRestaurantProvider provider;
  final IconData icon;

  const StatusMessageScreen({
    super.key,
    required this.provider,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(icon, size: 150),
              gap(y: 15),
              Text(
                provider.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
