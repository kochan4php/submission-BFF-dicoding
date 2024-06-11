import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/model/restaurant.dart';

class DetailPage extends StatefulWidget {
  final Restaurant restaurant;

  const DetailPage({super.key, required this.restaurant});

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildRestaurantHeroImage(context),
          gap(y: 20.0),
          _buildRestaurantBody(context),
        ],
      ),
    );
  }

  Widget _buildRestaurantHeroImage(BuildContext context) {
    return Hero(
      tag: widget.restaurant.pictureId,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ),
            child: Image.network(
              widget.restaurant.pictureId,
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
      ),
    );
  }

  Widget _buildRestaurantBody(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(widget.restaurant.name, style: textTheme.headlineMedium),
          gap(y: 12.0),
          Row(
            children: <Widget>[
              const Icon(
                Icons.location_on,
                size: 20,
                color: Colors.red,
              ),
              gap(x: 5.0),
              Text(widget.restaurant.city, style: textTheme.titleLarge),
            ],
          ),
          gap(y: 12.0),
          Row(
            children: <Widget>[
              const Icon(
                Icons.star,
                size: 20,
                color: Colors.amber,
              ),
              gap(x: 5.0),
              Text(
                widget.restaurant.rating.toString(),
                style: textTheme.titleMedium,
              ),
            ],
          ),
          gap(y: 20.0),
          Text(widget.restaurant.description, style: textTheme.bodyLarge),
          gap(y: 25.0),
          Text('Menu Makanan :', style: textTheme.titleMedium),
          gap(y: 10),
          _buildListFoodMenu(),
          gap(y: 20.0),
          Text('Menu Minuman :', style: textTheme.titleMedium),
          gap(y: 10.0),
          _buildListDrinkMenu(),
          gap(y: 18.0),
        ],
      ),
    );
  }

  Widget _buildListFoodMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < widget.restaurant.menus.foods.length; i++) ...[
            _buildCardMenu(
              'assets/images/food.png',
              widget.restaurant.menus.foods[i].name,
            ),

            // Only add spacing if it's not the last item
            if (i != widget.restaurant.menus.foods.length - 1) gap(x: 10),
          ]
        ],
      ),
    );
  }

  Widget _buildListDrinkMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < widget.restaurant.menus.drinks.length; i++) ...[
            _buildCardMenu(
              'assets/images/drink.png',
              widget.restaurant.menus.drinks[i].name,
            ),

            // Only add spacing if it's not the last item
            if (i != widget.restaurant.menus.drinks.length - 1) gap(x: 10),
          ]
        ],
      ),
    );
  }

  Widget _buildCardMenu(String menuImage, String menuName) {
    return Card.outlined(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 150,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image.asset(
                  menuImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
              gap(y: 12),
              Text(menuName),
            ],
          ),
        ),
      ),
    );
  }
}
