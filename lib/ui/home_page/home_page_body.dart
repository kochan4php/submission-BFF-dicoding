import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/home_page/list_restaurant.dart';
import 'package:restaurant_app/ui/loader.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListRestaurantProvider>(
      builder: (
        BuildContext context,
        ListRestaurantProvider value,
        Widget? child,
      ) {
        ResultState state = value.state;
        List<Restaurant> restaurants =
            state == ResultState.hasData ? value.restaurants : [];

        switch (state) {
          case ResultState.loading:
            return const Loader();
          case ResultState.hasData:
            return ListRestaurant(restaurants: restaurants);
          case ResultState.noData:
          case ResultState.error:
          default:
            return DataFetchErrorWidget(message: value.message);
        }
      },
    );
  }
}
