import 'package:flutter/material.dart';

class FavoritePageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FavoritePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget appBarTitle = const Text('Resto yang kamu simpan');
    return AppBar(title: appBarTitle);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
