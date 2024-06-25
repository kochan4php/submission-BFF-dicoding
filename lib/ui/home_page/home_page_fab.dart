import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/themes/colors.dart';

class HomePageFAB extends StatelessWidget {
  const HomePageFAB({super.key});

  Future _refreshRestaurants(BuildContext context) async {
    await Provider.of<ListRestaurantProvider>(context, listen: false)
        .getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      onPressed: () => _refreshRestaurants(context),
      child: const Icon(Icons.refresh),
    );
  }
}
