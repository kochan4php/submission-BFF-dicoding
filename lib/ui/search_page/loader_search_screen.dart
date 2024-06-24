import 'package:flutter/material.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/themes/colors.dart';

class LoaderSearchScreen extends StatelessWidget {
  final SearchRestaurantProvider provider;

  const LoaderSearchScreen({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}
