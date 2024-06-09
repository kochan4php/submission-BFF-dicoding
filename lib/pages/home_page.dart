import 'package:flutter/material.dart';
import 'package:restaurant_app/themes/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Center(
        child: Text(
          'Selamat Datang di Resto Rasa',
          style: TextStyle(
            color: AppColors.textPrimaryColor,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Resto Rasa',
        style: TextStyle(
          color: AppColors.textOnPrimaryColor,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 27,
            color: AppColors.textOnPrimaryColor,
          ),
        ),
      ],
    );
  }
}
