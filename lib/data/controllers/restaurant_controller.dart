import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/utils/logger.dart';

class RestaurantController {
  static RestaurantController? _instance;
  final String baseUrl = 'https://restaurant-api.dicoding.dev';

  RestaurantController._internal() {
    _instance = this;
  }

  factory RestaurantController() {
    return _instance ?? RestaurantController._internal();
  }

  Future<List<Restaurant>> getAll() async {
    logger.d('Call API Get All Restaurants');

    try {
      final response = await http.get(Uri.parse('$baseUrl/list'));

      if (response.statusCode == 200) {
        return parsedListRestaurants(response.body);
      } else {
        throw Exception('Failed load data');
      }
    } catch (error) {
      logger.e(error);
      throw Exception(error);
    }
  }

  Future<List<Restaurant>> search({String query = ''}) async {
    logger.d('Call API Search Restaurants');

    try {
      final response = await http.get(Uri.parse('$baseUrl/search?q=$query'));

      if (response.statusCode == 200) {
        return parsedListRestaurants(response.body);
      } else {
        throw Exception('Failed to search data');
      }
    } catch (error) {
      logger.e(error);
      throw Exception(error);
    }
  }

  List<Restaurant> parsedListRestaurants(String? json) {
    if (json == null) return [];

    final List parsed = jsonDecode(json)['restaurants'];
    return parsed.map((item) => Restaurant.fromJson(item)).toList();
  }
}
