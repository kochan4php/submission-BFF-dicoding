import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget titleAppBar = Text('Resto Rasa');
    return AppBar(title: titleAppBar);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
