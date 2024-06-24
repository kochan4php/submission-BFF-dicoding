import 'package:flutter/material.dart';

class SearchPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Cari Restoran'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
