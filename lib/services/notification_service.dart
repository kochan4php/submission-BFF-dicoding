import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:restaurant_app/data/controllers/restaurant_controller.dart';
import 'package:restaurant_app/data/models/restaurant.dart';

class NotificationService {
  static NotificationService? _instance;
  final restaurantController = RestaurantController();
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  factory NotificationService() => _instance ?? NotificationService._internal();

  NotificationService._internal() {
    _instance = this;
  }

  Future initNotification() async {
    var androidInitializationSettings = const AndroidInitializationSettings(
      'app_icon',
    );

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future requestAndroidPermission() async {
    var resolvePlatformSpecificImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await resolvePlatformSpecificImplementation?.requestExactAlarmsPermission();
    await resolvePlatformSpecificImplementation
        ?.requestNotificationsPermission();
  }

  Future showNotification() async {
    String channelId = '1';
    String channelName = 'rekomendasi_resto';
    String channelDescription = 'Rekomendasi restoran dari Resto Rasa';

    Restaurant randomRestaurant = await restaurantController.getOneRandom();

    String titleNotification = 'Rekomendasi Restoran';
    String bodyNotification =
        '${randomRestaurant.name} | ${randomRestaurant.city}';

    final response = await get(Uri.parse(randomRestaurant.picture));
    var image = ByteArrayAndroidBitmap(response.bodyBytes);
    var bigPictureStyleInformation = BigPictureStyleInformation(image);

    /// Konfigurasi notifikasi untuk android
    var androidNotificationDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      channelShowBadge: true,
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
      ticker: 'ticker',
    );

    var notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      bodyNotification,
      notificationDetails,
    );
  }
}
