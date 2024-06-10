import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';

class HomePage extends StatelessWidget with Spacing {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    final List<Widget> appBarAction = [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          size: 27,
          color: AppColors.textOnPrimaryColor,
        ),
      ),
    ];

    const Widget titleAppBar = Text(
      'Resto Rasa',
      style: TextStyle(color: AppColors.textOnPrimaryColor),
    );

    return AppBar(
      title: titleAppBar,
      backgroundColor: AppColors.primaryColor,
      actions: appBarAction,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildBody(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Rekomendasi untuk mu!',
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gap(y: 18.0),
            _buildRestaurantList(context, textTheme),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> _buildRestaurantList(
      BuildContext context, TextTheme textTheme) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(
        'assets/data/local_restaurant.json',
      ),
      builder: (context, snapshot) {
        List<Restaurant> data = parsedRestaurants(snapshot.data);

        return Column(
          children: data
              .map((item) => _buildRestaurantItem(context, item, textTheme))
              .toList(),
        );
      },
    );
  }

  Widget _buildRestaurantItem(
    BuildContext context,
    Restaurant restaurant,
    TextTheme textTheme,
  ) {
    final Widget restaurantImage = Hero(
      tag: restaurant.pictureId,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(restaurant.pictureId, fit: BoxFit.fill),
      ),
    );

    final Widget restaurantBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(restaurant.name, style: textTheme.titleLarge),
        gap(y: 5),
        Row(
          children: <Widget>[
            const Icon(Icons.location_on, size: 16),
            gap(x: 5),
            Text(restaurant.city, style: textTheme.bodyLarge),
          ],
        ),
        gap(y: 8),
        Row(
          children: <Widget>[
            const Icon(Icons.star, size: 16),
            gap(x: 5),
            Text(restaurant.rating.toString(), style: textTheme.labelLarge),
          ],
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detailPageRoute,
            arguments: restaurant,
          );
        },
        splashColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: restaurantImage),
            gap(x: 13),
            Expanded(flex: 2, child: restaurantBody),
          ],
        ),
      ),
    );
  }
}
