import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/favorite/favorite_provider.dart';
import 'package:restaurant_app/enums/fetch_error_type.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/favorite_page/list_restaurant.dart';
import 'package:restaurant_app/ui/loader.dart';

class FavoritePageBody extends StatelessWidget {
  const FavoritePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (
        BuildContext context,
        FavoriteProvider value,
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
          default:
            return const DataFetchErrorWidget(
              fetchErrorType: FetchErrorType.noData,
              message: 'Kamu belum memiliki restorant favorite',
            );
        }
      },
    );
  }
}
