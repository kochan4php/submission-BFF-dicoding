import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/app/my_app.dart';
import 'package:restaurant_app/services/notification_service.dart';
import 'package:restaurant_app/utils/checkAndRequestAlarmPermission.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  await checkAndRequestAlarmPermission();

  await AndroidAlarmManager.initialize();

  final NotificationService notificationService = NotificationService();

  await notificationService.initNotification();
  await notificationService.requestAndroidPermission();

  runApp(const MyApp());
}
