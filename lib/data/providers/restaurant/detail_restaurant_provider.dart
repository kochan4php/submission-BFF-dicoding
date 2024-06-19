import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/controllers/restaurant_controller.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/utils/logger.dart';

class DetailRestaurantProvider with ChangeNotifier {
  final String idRestaurant;

  String _message = '';
  late ResultState _state;
  late Restaurant _restaurant;
  final RestaurantController _restaurantController = RestaurantController();

  DetailRestaurantProvider({required this.idRestaurant}) {
    _getDetailRestaurant();
  }

  String get message => _message;
  ResultState get state => _state;
  Restaurant get restaurant => _restaurant;

  Future _getDetailRestaurant() async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      if (idRestaurant == '') {
        _state = ResultState.error;
        notifyListeners();

        _message = 'ID Restaurant not allowed to empty';
        logger.e(_message);
        return _message;
      }

      final Restaurant data = await _restaurantController.getDetail(
        id: idRestaurant,
      );

      if (data.toJson().entries.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();

        _message = 'Empty data';
        return _message;
      }

      _state = ResultState.hasData;
      notifyListeners();

      _restaurant = data;
      return _restaurant;
    } catch (error) {
      logger.e(error);

      _state = ResultState.error;
      notifyListeners();

      _message = 'Failed to get data. Please check your internet connection!';
      return _message;
    }
  }
}
