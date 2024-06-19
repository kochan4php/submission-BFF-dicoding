import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/controllers/restaurant_controller.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/utils/logger.dart';

class ListRestaurantProvider with ChangeNotifier {
  String _message = '';
  late ResultState _state;
  late List<Restaurant> _listRestaurant;
  final RestaurantController restaurantController = RestaurantController();

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
      final List<Restaurant> data = await restaurantController.getAll();

      if (data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();

        _message = 'Empty Data';
        return message;
      } else {
        _state = ResultState.hasData;
        notifyListeners();

        _listRestaurant = data;
        return restaurants;
      }
    } catch (error) {
      logger.e(error);

      _state = ResultState.error;
      notifyListeners();

      _message = 'Failed to get data. Please check your internet connection!';
      return message;
    }
  }
}
