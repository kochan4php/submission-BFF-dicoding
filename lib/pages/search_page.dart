import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/ui/card_restaurant.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with Spacing {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: const Text('Cari Restoran'));
  }

  Widget _buildBody() {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
            _buildInputSearch(value),
            if (state == ResultState.loading)
              _buildLoaderSearch(value)
            else if (state == ResultState.hasData)
              _buildRestaurantResultSearch(restaurants, textTheme)
            else if (state == ResultState.noData)
              _buildEmptyDataWidget(value)
            else if (state == ResultState.error)
              Expanded(child: DataFetchErrorWidget(message: value.message)),
          ],
        );
      },
    );
  }

  Widget _buildRestaurantResultSearch(
    List<Restaurant> restaurants,
    TextTheme textTheme,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 18.0,
        ),
        child: ListView(
          children: restaurants.map((item) {
            return CardRestaurant(restaurant: item, textTheme: textTheme);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEmptyDataWidget(SearchRestaurantProvider value) {
    return _buildStatusMessageWidget(
      value: value,
      icon: Icons.do_not_disturb_alt_rounded,
    );
  }

  Widget _buildLoaderSearch(SearchRestaurantProvider value) {
    return _buildStatusMessageWidget(
      value: value,
      icon: Icons.content_paste_search,
    );
  }

  Widget _buildStatusMessageWidget({
    required SearchRestaurantProvider value,
    required IconData icon,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(icon, size: 150),
              gap(y: 15),
              Text(
                value.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSearch(SearchRestaurantProvider value) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          hintText: 'Ketikkan nama restoran disini',
          focusColor: AppColors.primaryColor,
          isDense: true,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              value.searchRestaurant();
            },
            splashColor: Colors.transparent,
          ),
        ),
        onSubmitted: (String text) {
          value.searchRestaurant(query: text);
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
