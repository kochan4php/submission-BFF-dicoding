import 'package:flutter/material.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/themes/text.dart';

class AppTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: buildTextTheme(),
      appBarTheme: buildAppBarTheme(),
      navigationBarTheme: buildNavigationBarThemeData(),
    );
  }

  static AppBarTheme buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.white,
    );
  }

  static NavigationBarThemeData buildNavigationBarThemeData() {
    return NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.veryDarkPrimaryColor,
            );
          } else {
            return const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            );
          }
        },
      ),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: AppColors.darkPrimaryColor,
              size: 27,
            );
          } else {
            return const IconThemeData(
              color: Colors.black,
              size: 27,
            );
          }
        },
      ),
    );
  }

  static TextTheme buildTextTheme() {
    return AppTextTheme.buildTextTheme();
  }
}
