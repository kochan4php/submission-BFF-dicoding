import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/themes/colors.dart';

class HomePage extends StatelessWidget {
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
      style: TextStyle(
        color: AppColors.textOnPrimaryColor,
      ),
    );

    return AppBar(
      title: titleAppBar,
      backgroundColor: AppColors.primaryColor,
      actions: appBarAction,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Rekomendasi restoran untuk mu!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            _gap(y: 18.0),
            _buildRestaurantList(context),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> _buildRestaurantList(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(
        'assets/data/restaurant.json',
      ),
      builder: (context, snapshot) {
        List<Restaurant> data = parsedRestaurants(snapshot.data);

        return Column(
          children: data.map((item) {
            return _buildRestaurantItem(context, item);
          }).toList(),
        );
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    final Widget restaurantImage = ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        restaurant.pictureId,
        fit: BoxFit.fill,
      ),
    );

    final Widget restaurantBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          restaurant.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        _gap(y: 5),
        Row(
          children: <Widget>[
            const Icon(Icons.location_on, size: 16),
            _gap(x: 5),
            Text(
              restaurant.city,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        _gap(y: 8),
        Row(
          children: <Widget>[
            const Icon(Icons.star, size: 16),
            _gap(x: 5),
            Text(
              restaurant.rating.toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: restaurantImage,
            ),
            _gap(x: 13),
            Expanded(
              flex: 2,
              child: restaurantBody,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _gap({double x = 0.0, double y = 0.0}) {
    return SizedBox(
      width: x,
      height: y,
    );
  }
}
