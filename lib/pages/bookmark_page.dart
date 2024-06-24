import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/bookmark_page/bookmark_page_app_bar.dart';
import 'package:restaurant_app/ui/bookmark_page/bookmark_page_body.dart';

class BookmarkPage extends StatelessWidget with Spacing {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BookmarkPageAppBar(),
      body: BookmarkPageBody(),
    );
  }
}
