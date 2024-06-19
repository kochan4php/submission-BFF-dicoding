import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/controllers/restaurant_controller.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/utils/logger.dart';

class ListRestaurantProvider with ChangeNotifier {
  String _message = '';
  late ResultState _state;
  late List<Restaurant> _listRestaurant;
  final RestaurantController _restaurantController = RestaurantController();

  ListRestaurantProvider() {
    getRestaurants();
  }

  String get message => _message;
  ResultState get state => _state;
  List<Restaurant> get restaurants => _listRestaurant;

  Future getRestaurants() async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final List<Restaurant> data = await _restaurantController.getAll();

      if (data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();

        _message = 'Data tidak ditemukan.';
        return;
      }

      _state = ResultState.hasData;
      notifyListeners();

      _listRestaurant = data;
      return;
    } catch (error) {
      logger.e(error);

      _state = ResultState.error;
      notifyListeners();

      _message =
          'Gagal mendapatkan data. Silakan periksa koneksi internet Anda!';
      return;
    }
  }
}
