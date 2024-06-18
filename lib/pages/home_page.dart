import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/restaurant/list_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/ui/card_restaurant.dart';

class HomePage extends StatelessWidget with Spacing {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody(context));
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

    return AppBar(
      title: titleAppBar,
      actions: appBarAction,
    );
  }

  Widget _buildBody(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<ListRestaurantProvider>(
      builder: (
        BuildContext context,
        ListRestaurantProvider provider,
        Widget? child,
      ) {
        ResultState state = provider.state;
        List<Restaurant> restaurants =
            state == ResultState.hasData ? provider.restaurants : [];

        switch (state) {
          case ResultState.loading:
            return _buildLoader();
          case ResultState.hasData:
            return _buildRestaurantList(context, textTheme, restaurants);
          case ResultState.noData:
          case ResultState.error:
          default:
            return _buildFailedGetDataRestaurant(provider, context);
        }
      },
    );
  }

  Widget _buildFailedGetDataRestaurant(
    ListRestaurantProvider provider,
    BuildContext context,
  ) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            size: 100,
          ),
          gap(y: 10),
          Text(
            provider.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildRestaurantList(
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
