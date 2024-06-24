import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/bookmark/bookmark_provider.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/themes/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListRestaurantProvider()),
        ChangeNotifierProvider(create: (context) => SearchRestaurantProvider()),
        ChangeNotifierProvider(create: (context) => BookmarkProvider()),
      ],
      child: MaterialApp(
        theme: buildThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.mainPageRoute,
        routes: Routes.init(),
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      textTheme: buildTextTheme(),
      appBarTheme: buildAppBarTheme(),
    );
  }

  AppBarTheme buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.textOnPrimaryColor,
    );
  }

  TextTheme buildTextTheme() {
    return AppTextTheme.buildTextTheme();
  }
}
