import 'package:flutter/material.dart';

import 'package:restaurant_app/data/model/restaurant.dart';
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
        return const HomePage();
      },
      detailPageRoute: (BuildContext context) {
        return DetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        );
      },
      searchPageRoute: (BuildContext context) {
        return const SearchPage();
      },
    };
  }
}
