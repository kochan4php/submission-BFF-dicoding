import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/search_page/search_page_app_bar.dart';
import 'package:restaurant_app/ui/search_page/search_page_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with Spacing {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchPageAppBar(),
      body: SearchPageBody(searchController: _searchController),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
