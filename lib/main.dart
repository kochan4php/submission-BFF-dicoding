import 'package:flutter/material.dart';

import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/themes/text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePageRoute,
      routes: Routes.init(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      textTheme: buildTextTheme(),
    );
  }

  TextTheme buildTextTheme() {
    return AppTextTheme.buildTextTheme();
  }
}
