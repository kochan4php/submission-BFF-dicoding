import 'package:restaurant_app/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  static const String dailyRecommendationRestaurantKey =
      'DAILY_RECOMMENDATION_RESTAURANT';

  Future setDailyRecommendationRestaurant(bool value) async {
    logger.d('Set Daily Recommendation Restaurant to $value');

    final prefs = await _sharedPreferences;
    prefs.setBool(dailyRecommendationRestaurantKey, value);
  }

  Future<bool> get isDailyRecommendationRestaurantActive async {
    final prefs = await _sharedPreferences;
    return prefs.getBool(dailyRecommendationRestaurantKey) ?? false;
  }
}
