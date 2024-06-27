import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/bookmark_page.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/pages/settings_page.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/services/notification_service.dart';
import 'package:restaurant_app/ui/main_page/bottom_navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final NotificationService _notificationService = NotificationService();

  void _onTappedNavigationBar(int value) {
    setState(() => currentIndex = value);
  }

  @override
  void initState() {
    _notificationService.configureSelectNotification(
      context,
      Routes.detailPageRoute,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listBody = <Widget>[
      const HomePage(),
      const SearchPage(),
      const BookmarkPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      body: listBody[currentIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: _onTappedNavigationBar,
      ),
    );
  }

  @override
  void dispose() {
    selectNotification.close();
    super.dispose();
  }
}
