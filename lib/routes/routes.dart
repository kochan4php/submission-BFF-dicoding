import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/data/providers/restaurant/detail_restaurant_provider.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/search_page.dart';

class Routes {
  static const String homePageRoute = '/homePageRoute';
  static const String detailPageRoute = '/detailPageRoute';
  static const String searchPageRoute = '/searchPageRoute';

  static Map<String, WidgetBuilder> init() {
    return {
      homePageRoute: (BuildContext context) {
        return ChangeNotifierProvider<ListRestaurantProvider>(
          create: (context) => ListRestaurantProvider(),
          child: const HomePage(),
        );
      },
      detailPageRoute: (BuildContext context) {
        String id = ModalRoute.of(context)?.settings.arguments as String;
        return ChangeNotifierProvider<DetailRestaurantProvider>(
          create: (context) => DetailRestaurantProvider(idRestaurant: id),
          child: DetailPage(id: id),
        );
      },
      searchPageRoute: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => SearchRestaurantProvider(),
          child: const SearchPage(),
        );
      },
    };
  }
}
