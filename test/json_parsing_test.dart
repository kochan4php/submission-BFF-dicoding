import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/controllers/restaurant_controller.dart';
import 'package:restaurant_app/data/models/restaurant.dart';

import 'json_parsing_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Test Restaurant JSON Parsing', () {
    MockClient? client;
    RestaurantController? controller;
    String? baseUrl;

    setUp(() {
      client = MockClient();
      controller = RestaurantController();
      baseUrl = controller!.baseUrl;
    });

    test('Return list of restaurant if http call successfully', () async {
      when(client!.get(
        Uri.parse('$baseUrl/list'),
      )).thenAnswer((_) async {
        Map<String, dynamic> response = {
          "error": false,
          "message": "success",
          "count": 20,
          "restaurants": []
        };

        return http.Response(jsonEncode(response), 200);
      });

      expect(await controller!.getAll(client: client), isA<List<Restaurant>>());
    });

    test('Return detail of restaurant if http call successfully', () async {
      String id = "02hfwn4bh8uzkfw1e867";

      when(client!.get(
        Uri.parse('$baseUrl/detail/$id'),
      )).thenAnswer((_) async {
        Map<String, dynamic> response = {
          "error": false,
          "message": "success",
          "restaurant": {
            "id": id,
            "name": "Manis Asam Kafe",
            "description": "Lorem ipsum dolor sit amet",
            "city": "Malang",
            "address": "Jln. Pustakawan no 9",
            "pictureId": "21",
            "categories": [],
            "menus": {"foods": [], "drinks": []},
            "rating": 4.6,
            "customerReviews": [],
          }
        };

        return http.Response(jsonEncode(response), 200);
      });

      expect(
        await controller!.getDetail(client: client, id: id),
        isA<Restaurant>(),
      );
    });

    test('Return the searched restaurant if http call successfully', () async {
      String query = 'lorem';

      when(client!.get(
        Uri.parse('$baseUrl/search?q=$query'),
      )).thenAnswer((_) async {
        Map<String, dynamic> response = {
          "error": false,
          "founded": 0,
          "restaurants": []
        };

        return http.Response(jsonEncode(response), 200);
      });

      expect(
        await controller!.search(client: client, query: query),
        isA<List<Restaurant>>(),
      );
    });
  });
}
