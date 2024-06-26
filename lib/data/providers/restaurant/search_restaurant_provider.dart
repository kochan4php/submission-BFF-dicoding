import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/controllers/restaurant_controller.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/utils/logger.dart';

class SearchRestaurantProvider with ChangeNotifier {
  SearchRestaurantProvider() {
    searchRestaurant();
  }

  String _message = '';
  late List<Restaurant> _listRestaurants;
  ResultState _state = ResultState.notYetExecuted;

  final RestaurantController _restaurantController = RestaurantController();

  String get message => _message;
  List<Restaurant> get restaurants => _listRestaurants;
  ResultState get state => _state;

  Future searchRestaurant({String query = ''}) async {
    logger.d(query);

    _state = ResultState.loading;
    notifyListeners();

    _message = 'Mencari...';

    try {
      if (query.isEmpty) {
        final data = await _restaurantController.getRandom();

        _state = ResultState.hasData;
        notifyListeners();

        _listRestaurants = data;
        return;
      }

      final data = await _restaurantController.search(query: query);

      if (data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();

        _message = 'Restoran yang kamu cari tidak ditemukan.';
        return;
      }

      _state = ResultState.hasData;
      notifyListeners();

      _listRestaurants = data;
      return;
    } catch (error) {
      logger.e(error);

      _state = ResultState.error;
      notifyListeners();

      _message = 'Gagal mencari data. Silakan periksa koneksi internet Anda!';
      return;
    }
  }
}
