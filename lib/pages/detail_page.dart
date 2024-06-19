import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/restaurant/detail_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/card_restaurant_menu.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/loader.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with Spacing {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) => Scaffold(body: _buildBody(context));

  void handlePressedFavoriteButton() {
    setState(() => isFavorite = !isFavorite);

    String sentences = isFavorite ? 'ditambahkan ke' : 'dihapus dari';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil $sentences favorit'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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
            return _buildDataDetailRestaurant(context, value);
          case ResultState.noData:
          case ResultState.error:
          default:
            return DataFetchErrorWidget(message: value.message);
        }
      },
    );
  }

  Widget _buildDataDetailRestaurant(
    BuildContext context,
    DetailRestaurantProvider value,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildRestaurantImage(context, value.restaurant),
          gap(y: 20.0),
          _buildRestaurantBody(context, value.restaurant),
        ],
      ),
    );
  }

  Widget _buildRestaurantImage(BuildContext context, Restaurant restaurant) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          child: Image.network(
            restaurant.pictureId,
            height: 325,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: handlePressedFavoriteButton,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantBody(BuildContext context, Restaurant restaurant) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(restaurant.name, style: textTheme.headlineMedium),
          gap(y: 12.0),
          _buildLocation(restaurant, textTheme),
          gap(y: 12.0),
          _buildRating(restaurant, textTheme),
          gap(y: 20.0),
          Text(restaurant.description, style: textTheme.bodyLarge),
          gap(y: 25.0),
          Text('Menu Makanan :', style: textTheme.titleMedium),
          gap(y: 10),
          _buildListFoodMenu(restaurant),
          gap(y: 20.0),
          Text('Menu Minuman :', style: textTheme.titleMedium),
          gap(y: 10.0),
          _buildListDrinkMenu(restaurant),
          gap(y: 18.0),
        ],
      ),
    );
  }

  Widget _buildLocation(Restaurant restaurant, TextTheme textTheme) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.location_on,
          size: 20,
          color: Colors.red,
        ),
        gap(x: 5.0),
        Text(restaurant.city, style: textTheme.titleLarge),
      ],
    );
  }

  Widget _buildRating(Restaurant restaurant, TextTheme textTheme) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.amber,
        ),
        gap(x: 5.0),
        Text(
          restaurant.rating.toString(),
          style: textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget _buildListFoodMenu(Restaurant restaurant) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < restaurant.menu!.foods.length; i++) ...[
            CardRestaurantMenu(
              menuImage: 'assets/images/food.png',
              menuName: restaurant.menu!.foods[i].name,
            ),

            // Only add spacing if it's not the last item
            if (i != restaurant.menu!.foods.length - 1) gap(x: 10),
          ]
        ],
      ),
    );
  }

  Widget _buildListDrinkMenu(Restaurant restaurant) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < restaurant.menu!.drinks.length; i++) ...[
            CardRestaurantMenu(
              menuImage: 'assets/images/drink.png',
              menuName: restaurant.menu!.drinks[i].name,
            ),

            // Only add spacing if it's not the last item
            if (i != restaurant.menu!.drinks.length - 1) gap(x: 10),
          ]
        ],
      ),
    );
  }
}
