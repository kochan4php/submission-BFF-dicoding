import 'package:restaurant_app/data/models/category.dart';
import 'package:restaurant_app/data/models/customer_review.dart';
import 'package:restaurant_app/data/models/menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu? menu;
  final List<Category>? categories;
  final List<CustomerReview>? customerReviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    this.menu,
    this.categories,
    this.customerReviews,
  });

  String get picture {
    String pictureUrl = 'https://restaurant-api.dicoding.dev/images/large';
    return '$pictureUrl/$pictureId';
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    if (json['menus'] != null &&
        json['categories'] != null &&
        json['customerReviews'] != null) {
      return Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json["pictureId"],
        city: json['city'],
        rating: json['rating'].toDouble(),
        menu: Menu.fromJson(json['menus']),
        categories: List.from(
          json['categories'].map(
            (category) {
              return Category.fromJson(category);
            },
          ),
        ),
        customerReviews: List.from(
          json['customerReviews'].map(
            (review) {
              return CustomerReview.fromJson(review);
            },
          ),
        ),
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

  Map<String, dynamic> toJsonForBookmark() {
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
