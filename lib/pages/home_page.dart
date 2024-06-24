import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/home_page/home_page_app_bar.dart';
import 'package:restaurant_app/ui/home_page/home_page_body.dart';
import 'package:restaurant_app/ui/home_page/home_page_fab.dart';

class HomePage extends StatelessWidget with Spacing {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomePageAppBar(),
      body: HomePageBody(),
      floatingActionButton: HomePageFAB(),
    );
  }
}
