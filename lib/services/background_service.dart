import 'dart:isolate';
import 'dart:ui';

import 'package:restaurant_app/services/notification_service.dart';
import 'package:restaurant_app/utils/logger.dart';

class BackgroundService {
  static BackgroundService? _instance;
  static final ReceivePort _port = ReceivePort();
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initIsolate() {
    IsolateNameServer.registerPortWithName(_port.sendPort, _isolateName);
  }

  @pragma('vm:entry-point')
  static Future callback() async {
    logger.d('Background Service Callback Running');

    NotificationService notificationService = NotificationService();
    await notificationService.showNotification();

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
