import 'package:flutter/material.dart';
import 'package:restaurant_app/app/my_app.dart';
import 'package:restaurant_app/services/notification_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationService notificationService = NotificationService();

  await notificationService.initNotification();

  runApp(const MyApp());
}
