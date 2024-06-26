import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/utils/logger.dart';

class RestaurantController {
  static RestaurantController? _instance;
  final String _baseUrl = 'https://restaurant-api.dicoding.dev';

  String get baseUrl => _baseUrl;

  RestaurantController._internal() {
    _instance = this;
  }

  factory RestaurantController() {
    return _instance ?? RestaurantController._internal();
  }

  Future<List<Restaurant>> getAll({http.Client? client}) async {
    logger.d('Call API Get All Restaurants');

    try {
      final http.Response response;
      final String url = '$_baseUrl/list';

      if (client == null) {
        response = await http.get(Uri.parse(url));
      } else {
        response = await client.get(Uri.parse(url));
      }

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

  Future<Restaurant> getDetail({
    required String id,
    http.Client? client,
  }) async {
    logger.d('Call API Get Detail Restaurant');

    try {
      final http.Response response;
      final String url = '$_baseUrl/detail/$id';

      if (client == null) {
        response = await http.get(Uri.parse(url));
      } else {
        response = await client.get(Uri.parse(url));
      }

      if (response.statusCode == 200) {
        return parsedDetailRestaurant(response.body);
      } else {
        throw Exception('Failed load data');
      }
    } catch (error) {
      logger.e(error);
      throw Exception(error);
    }
  }

  Future<List<Restaurant>> search({
    String query = '',
    http.Client? client,
  }) async {
    logger.d('Call API Search Restaurants');

    try {
      final http.Response response;
      final String url = '$_baseUrl/search?q=$query';

      if (client == null) {
        response = await http.get(Uri.parse(url));
      } else {
        response = await client.get(Uri.parse(url));
      }

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

  Future<List<Restaurant>> getRandom() async {
    logger.d('Call API Get Random Restaurants');

    try {
      final response = await http.get(Uri.parse('$_baseUrl/list'));

      if (response.statusCode == 200) {
        List<Restaurant> restaurants = List.from(
          parsedListRestaurants(response.body),
        );

        restaurants.shuffle(Random());
        return restaurants.take(5).toList();
      } else {
        throw Exception('Failed load data');
      }
    } catch (error) {
      logger.e(error);
      throw Exception(error);
    }
  }

  Future<Restaurant> getOneRandom() async {
    logger.d('Call API Get One Random Restaurants');

    try {
      final response = await http.get(Uri.parse('$_baseUrl/list'));

      if (response.statusCode == 200) {
        List<Restaurant> restaurants = List.from(
          parsedListRestaurants(response.body),
        );

        restaurants.shuffle(Random());
        return restaurants.take(1).toList().first;
      } else {
        throw Exception('Failed load data');
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

  Restaurant parsedDetailRestaurant(String? json) {
    if (json == null) return {} as Restaurant;

    final parsed = jsonDecode(json)['restaurant'];
    return Restaurant.fromJson(parsed);
  }
}
