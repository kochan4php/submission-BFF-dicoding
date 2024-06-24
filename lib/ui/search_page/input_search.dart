import 'package:flutter/material.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/themes/colors.dart';

class InputSearch extends StatelessWidget {
  final SearchRestaurantProvider provider;
  final TextEditingController searchController;

  const InputSearch({
    super.key,
    required this.provider,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: TextField(
        controller: searchController,
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
              searchController.clear();
              provider.searchRestaurant();
            },
            splashColor: Colors.transparent,
          ),
        ),
        onSubmitted: (String text) {
          provider.searchRestaurant(query: text);
        },
      ),
    );
  }
}