import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/db/tables/bookmark_table.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/utils/logger.dart';

class BookmarkProvider with ChangeNotifier {
  BookmarkProvider() {
    _getAllBookmarks();
  }

  late ResultState _state;
  late List<Restaurant> _restaurants;
  late final BookmarkTable _table = BookmarkTable();

  ResultState get state => _state;
  List<Restaurant> get restaurants => _restaurants;

  void _getAllBookmarks() async {
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

  Future<Map> getBookmarkById(String id) async {
    return await _table.getById(id);
  }

  void insertBookmark(Restaurant restaurant) async {
    await _table.insert(restaurant);
    _getAllBookmarks();
  }

  void updateBookmark(Restaurant restaurant) async {
    await _table.update(restaurant.id, restaurant);
    _getAllBookmarks();
  }

  void deleteBookmark(String id) async {
    await _table.delete(id);
    _getAllBookmarks();
  }

  Future<bool> isBookmarked(String id) async {
    final result = await _table.getById(id);
    return result.isNotEmpty;
  }

  void setBookmark(Restaurant restaurant) async {
    bool isBookmark = await isBookmarked(restaurant.id);

    if (!isBookmark) {
      insertBookmark(restaurant);
    } else {
      deleteBookmark(restaurant.id);
    }
  }
}
