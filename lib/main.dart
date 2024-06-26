import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/app/my_app.dart';
import 'package:restaurant_app/services/notification_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();

  final NotificationService notificationService = NotificationService();

  await notificationService.initNotification();
  await notificationService.requestAndroidPermission();

  runApp(const MyApp());
}
