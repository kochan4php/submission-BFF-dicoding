import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/category.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/themes/colors.dart';

class RestaurantCategories extends StatelessWidget with Spacing {
  final List<Category> categories;

  const RestaurantCategories({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              categories[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => gap(x: 8),
      ),
    );
  }
}
