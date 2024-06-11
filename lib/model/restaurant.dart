import 'dart:convert';

import 'package:restaurant_app/model/menus.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      menu: Menu.fromJson(json['menus']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating.toDouble(),
    };
  }
}

List<Restaurant> parsedRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((item) => Restaurant.fromJson(item)).toList();
}
