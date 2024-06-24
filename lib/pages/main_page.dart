import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/bookmark_page.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/ui/main_page/bottom_navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void _onTappedNavigationBar(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listBody = <Widget>[
      const HomePage(),
      const SearchPage(),
      const BookmarkPage(),
    ];

    return Scaffold(
      body: listBody[currentIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: _onTappedNavigationBar,
      ),
    );
  }
}
