import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant/detail_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/detail_page/data_detail_restaurant.dart';
import 'package:restaurant_app/ui/loader.dart';

class DetailPageBody extends StatelessWidget {
  const DetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(
      builder: (
        BuildContext context,
        DetailRestaurantProvider value,
        Widget? child,
      ) {
        ResultState state = value.state;

        switch (state) {
          case ResultState.loading:
            return const Loader();
          case ResultState.hasData:
            return DataDetailRestaurant(provider: value);
          case ResultState.noData:
          case ResultState.error:
          default:
            return DataFetchErrorWidget(message: value.message);
        }
      },
    );
  }
}
