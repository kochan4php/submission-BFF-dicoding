import 'package:intl/intl.dart';
import 'package:restaurant_app/utils/logger.dart';

class DateTimeService {
  static DateTime format() {
    // Date and Time format
    final DateTime now = DateTime.now();
    final DateFormat dateFormat = DateFormat('y/M/d');
    const String timeSpecific = '11:00:00';
    final DateFormat completeFormat = DateFormat('y/M/d H:m:s');

    // Today Format
    final String todayDate = dateFormat.format(now);
    final String todayDateAndTime = '$todayDate $timeSpecific';
    final DateTime resultToday = completeFormat.parseStrict(todayDateAndTime);

    // Tomorrow Format
    final DateTime tomorrowFormatted = resultToday.add(const Duration(days: 1));
    final String tomorrowDate = dateFormat.format(tomorrowFormatted);
    final String tomorrowDateAndTime = '$tomorrowDate $timeSpecific';
    final DateTime resultTomorrow =
        completeFormat.parseStrict(tomorrowDateAndTime);

    final DateTime result =
        now.isAfter(resultToday) ? resultTomorrow : resultToday;

    logger.d(result);

    return result;
  }
}
