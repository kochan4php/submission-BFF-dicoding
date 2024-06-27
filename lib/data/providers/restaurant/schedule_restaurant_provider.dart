import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_app/services/background_service.dart';
import 'package:restaurant_app/services/date_time_service.dart';
import 'package:restaurant_app/utils/logger.dart';

class ScheduleRestaurantProvider with ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future scheduledRecommendation(bool value) async {
    _isScheduled = value;
    notifyListeners();

    if (_isScheduled) {
      logger.d('Scheduled to get recommendation restaurant activated');

      await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeService.format(),
        wakeup: true,
        exact: true,
      );

      return;
    } else {
      logger.d('Scheduled to get recommendation restaurant canceled');

      await AndroidAlarmManager.cancel(1);

      return;
    }
  }
}
