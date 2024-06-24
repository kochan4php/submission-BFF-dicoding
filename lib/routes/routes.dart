import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant/detail_restaurant_provider.dart';
import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/main_page.dart';

class Routes {
  static const String mainPageRoute = '/';
  static const String detailPageRoute = '/detailPageRoute';

  static Map<String, WidgetBuilder> init() {
    return {
      mainPageRoute: (BuildContext context) {
        return const MainPage();
      },
      detailPageRoute: (BuildContext context) {
        String id = ModalRoute.of(context)?.settings.arguments as String;
        return ChangeNotifierProvider<DetailRestaurantProvider>(
          create: (context) => DetailRestaurantProvider(idRestaurant: id),
          child: DetailPage(id: id),
        );
      },
    };
  }
}
