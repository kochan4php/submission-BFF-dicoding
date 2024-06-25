import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/bookmark/bookmark_provider.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: listProviders,
      child: MaterialApp(
        theme: AppTheme.buildThemeData(),
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
}
