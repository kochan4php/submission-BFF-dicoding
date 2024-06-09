import 'dart:convert';

import 'package:restaurant_app/model/restaurant.dart';

class ListRestaurant {
  final List<Restaurant> restaurant;

  ListRestaurant({required this.restaurant});

  factory ListRestaurant.fromJson(Map<String, dynamic> json) {
    return ListRestaurant(
      restaurant: List<Restaurant>.from((json['restaurants'] as List)
          .map((item) => Restaurant.fromJson(item))),
    );
  }
}

List<Restaurant> parsedListRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((item) => Restaurant.fromJson(item)).toList();
}
