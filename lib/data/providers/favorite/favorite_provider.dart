import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/db/tables/favorite_table.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/enums/result_state.dart';

class FavoriteProvider with ChangeNotifier {
  FavoriteProvider() {
    _getAllFavorites();
  }

  late ResultState _state;
  late List<Restaurant> _restaurants;
  late final FavoriteTable _table = FavoriteTable();

  ResultState get state => _state;
  List<Restaurant> get restaurants => _restaurants;

  void _getAllFavorites() async {
    _state = ResultState.loading;
    notifyListeners();

    _restaurants = await _table.getAll();

    if (_restaurants.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
    }

    notifyListeners();
  }

  Future<Map> getFavoriteById(String id) async {
    return await _table.getById(id);
  }

  void insertFavorite(Restaurant restaurant) async {
    await _table.insert(restaurant);
    _getAllFavorites();
  }

  void updateFavorite(Restaurant restaurant) async {
    await _table.update(restaurant.id, restaurant);
    _getAllFavorites();
  }

  void deleteFavorite(String id) async {
    await _table.delete(id);
    _getAllFavorites();
  }

  Future<bool> isFavoriteed(String id) async {
    final result = await _table.getById(id);
    return result.isNotEmpty;
  }

  void setFavorite(Restaurant restaurant) async {
    bool isFavorite = await isFavoriteed(restaurant.id);

    if (!isFavorite) {
      insertFavorite(restaurant);
    } else {
      deleteFavorite(restaurant.id);
    }
  }
}
