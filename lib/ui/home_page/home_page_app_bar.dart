import 'package:flutter/material.dart';
import 'package:restaurant_app/routes/routes.dart';
import 'package:restaurant_app/themes/colors.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget titleAppBar = Text('Resto Rasa');
    final List<Widget> appBarAction = [
      IconButton(
        onPressed: () => Navigator.pushNamed(context, Routes.bookmarkPageRoute),
        icon: const Icon(
          Icons.bookmark_border,
          size: 27,
          color: AppColors.textOnPrimaryColor,
        ),
      ),
      IconButton(
        onPressed: () => Navigator.pushNamed(context, Routes.searchPageRoute),
        icon: const Icon(
          Icons.search,
          size: 27,
          color: AppColors.textOnPrimaryColor,
        ),
      ),
    ];

    return AppBar(title: titleAppBar, actions: appBarAction);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
