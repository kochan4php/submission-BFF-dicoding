import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/themes/colors.dart';

class CardRestaurantMenu extends StatelessWidget with Spacing {
  final String menuImage;
  final String menuName;

  const CardRestaurantMenu({
    super.key,
    required this.menuImage,
    required this.menuName,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: AppColors.veryLightPrimaryColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 150,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image.asset(
                  menuImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
              gap(y: 12),
              Text(menuName),
            ],
          ),
        ),
      ),
    );
  }
}
