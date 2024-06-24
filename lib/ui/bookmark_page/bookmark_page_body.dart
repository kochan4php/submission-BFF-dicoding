import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/bookmark/bookmark_provider.dart';
import 'package:restaurant_app/enums/fetch_error_type.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/ui/bookmark_page/list_restaurant.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/loader.dart';

class BookmarkPageBody extends StatelessWidget {
  const BookmarkPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkProvider>(
      builder: (
        BuildContext context,
        BookmarkProvider value,
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
              message: 'Kamu belum memiliki bookmark',
            );
        }
      },
    );
  }
}
