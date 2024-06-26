import 'package:flutter/material.dart';
import 'package:restaurant_app/themes/colors.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.4, color: Colors.black),
        ),
      ),
      child: NavigationBar(
        onDestinationSelected: onTap,
        elevation: 0,
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lightPrimaryColor,
        selectedIndex: currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_rounded),
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.content_paste_search_rounded),
            icon: Icon(Icons.content_paste_search_outlined),
            label: 'Pencarian',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.collections_bookmark_rounded),
            icon: Icon(Icons.collections_bookmark_outlined),
            label: 'Disimpan',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_rounded),
            icon: Icon(Icons.settings_outlined),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
