import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/favorite_page/favorite_page_app_bar.dart';
import 'package:restaurant_app/ui/favorite_page/favorite_page_body.dart';

class FavoritePage extends StatelessWidget with Spacing {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FavoritePageAppBar(),
      body: FavoritePageBody(),
    );
  }
}
