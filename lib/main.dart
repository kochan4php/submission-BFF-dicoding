import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
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
      providers: listProviders,
      child: MaterialApp(
        theme: buildThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.mainPageRoute,
        routes: Routes.init(),
      ),
    );
  }

  List<SingleChildWidget> get listProviders {
    return [
      ChangeNotifierProvider(create: (context) => ListRestaurantProvider()),
      ChangeNotifierProvider(create: (context) => SearchRestaurantProvider()),
      ChangeNotifierProvider(create: (context) => BookmarkProvider()),
    ];
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: buildTextTheme(),
      appBarTheme: buildAppBarTheme(),
      navigationBarTheme: buildNavigationBarThemeData(),
    );
  }

  AppBarTheme buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.white,
    );
  }

  NavigationBarThemeData buildNavigationBarThemeData() {
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

  TextTheme buildTextTheme() {
    return AppTextTheme.buildTextTheme();
  }
}
