import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/ui/card_restaurant.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/loader.dart';

class HomePage extends StatelessWidget with Spacing {
  const HomePage({super.key});

  Future _refreshRestaurants(BuildContext context) async {
    await Provider.of<ListRestaurantProvider>(context, listen: false)
        .getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    const Widget titleAppBar = Text('Resto Rasa');
    final List<Widget> appBarAction = [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.searchPageRoute);
        },
        icon: const Icon(
          Icons.search,
          size: 27,
          color: AppColors.textOnPrimaryColor,
        ),
      ),
    ];

    return AppBar(title: titleAppBar, actions: appBarAction);
  }

  Widget _buildBody(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
            return _buildRestaurant(context, textTheme, restaurants);
          case ResultState.noData:
          case ResultState.error:
          default:
            return DataFetchErrorWidget(message: value.message);
        }
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.textOnPrimaryColor,
      onPressed: () => _refreshRestaurants(context),
      child: const Icon(Icons.refresh),
    );
  }

  Widget _buildRestaurant(
    BuildContext context,
    TextTheme textTheme,
    List<Restaurant> restaurants,
  ) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Rekomendasi untuk mu!',
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gap(y: 18.0),
            Column(
              children: restaurants.map((item) {
                return CardRestaurant(restaurant: item, textTheme: textTheme);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
