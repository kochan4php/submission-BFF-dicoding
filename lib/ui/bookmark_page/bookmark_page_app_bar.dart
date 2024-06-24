import 'package:flutter/material.dart';

class BookmarkPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookmarkPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget appBarTitle = const Text('Resto yang kamu simpan');
    return AppBar(title: appBarTitle);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
