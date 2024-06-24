import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/bookmark/bookmark_provider.dart';
import 'package:restaurant_app/enums/fetch_error_type.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/card_restaurant.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/loader.dart';

class BookmarkPage extends StatelessWidget with Spacing {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<BookmarkProvider>(
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
              return _buildRestaurant(context, textTheme, restaurants);
            case ResultState.noData:
            default:
              return const DataFetchErrorWidget(
                fetchErrorType: FetchErrorType.noData,
                message: 'Kamu belum memiliki bookmark',
              );
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    Widget appBarTitle = const Text('Resto yang kamu simpan');
    return AppBar(title: appBarTitle);
  }

  Widget _buildRestaurant(
    BuildContext context,
    TextTheme textTheme,
    List<Restaurant> restaurants,
  ) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
