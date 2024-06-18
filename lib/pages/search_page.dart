import 'package:flutter/material.dart';

import 'package:restaurant_app/mixin/spacing.dart';

class SearchPage extends StatelessWidget with Spacing {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian'),
      ),
    );
  }
}
