import 'package:restaurant_app/data/models/menu.dart';

class Restaurant {
  static const String pictureUrl =
      'https://restaurant-api.dicoding.dev/images/large';

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu? menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    this.menu,
  });

  String get picture => '$pictureUrl/$pictureId';

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    if (json['menus'] != null) {
      return Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json["pictureId"],
        city: json['city'],
        rating: json['rating'].toDouble(),
        menu: Menu.fromJson(json['menus']),
      );
    } else {
      return Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json["pictureId"],
        city: json['city'],
        rating: json['rating'].toDouble(),
      );
    }
  }

  Map<String, dynamic> toJson() {
    if (menu != null) {
      return {
        'id': id,
        'name': name,
        'description': description,
        'pictureId': pictureId,
        'city': city,
        'rating': rating.toDouble(),
        'menu': menu,
      };
    } else {
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

  Map<String, dynamic> toJsonWithoutMenu() {
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
