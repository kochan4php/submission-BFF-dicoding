import 'package:flutter/foundation.dart';
import 'package:restaurant_app/services/shared_prefs_service.dart';

class SharedPrefsProvider with ChangeNotifier {
  SharedPrefsProvider() {
    _getDailyRecommendationRestaurantPreference();
  }

  final SharedPrefsService _sharedPrefsService = SharedPrefsService();

  bool _isDailyRecommendationRestaurantActive = false;

  bool get isDailyRecommendationRestaurantActive =>
      _isDailyRecommendationRestaurantActive;

  Future _getDailyRecommendationRestaurantPreference() async {
    _isDailyRecommendationRestaurantActive =
        await _sharedPrefsService.isDailyRecommendationRestaurantActive;

    notifyListeners();
  }

  Future setDailyRecommendationRestaurant(bool value) async {
    await _sharedPrefsService.setDailyRecommendationRestaurant(value);
    await _getDailyRecommendationRestaurantPreference();
  }
}
