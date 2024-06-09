import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.secondaryColor,
        textTheme: buildTextTheme(),
      ),
      initialRoute: Routes.homePageRoute,
      routes: {
        Routes.homePageRoute: (context) => const HomePage(),
      },
    );
  }

  TextTheme buildTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryColor,
      ), // bodyText1 di versi sebelumnya
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryColor,
      ), // bodyText2 di versi sebelumnya
      headlineMedium: TextStyle(
        color: AppColors.headingColor,
      ), // headline5 di versi sebelumnya
    );
  }
}
