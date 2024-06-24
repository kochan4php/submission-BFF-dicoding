import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/search_page/empty_data_screen.dart';
import 'package:restaurant_app/ui/search_page/input_search.dart';
import 'package:restaurant_app/ui/search_page/loader_search_screen.dart';
import 'package:restaurant_app/ui/search_page/restaurant_search_result.dart';

class SearchPageBody extends StatelessWidget {
  final TextEditingController searchController;

  const SearchPageBody({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRestaurantProvider>(
      builder: (
        BuildContext context,
        SearchRestaurantProvider value,
        Widget? child,
      ) {
        ResultState state = value.state;

        List<Restaurant> restaurants =
            state == ResultState.hasData ? value.restaurants : [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InputSearch(searchController: searchController, provider: value),
            if (state == ResultState.loading)
              LoaderSearchScreen(provider: value)
            else if (state == ResultState.hasData)
              RestaurantSearchResult(restaurants: restaurants)
            else if (state == ResultState.noData)
              EmptyDataScreen(provider: value)
            else if (state == ResultState.error)
              Expanded(child: DataFetchErrorWidget(message: value.message)),
          ],
        );
      },
    );
  }
}
