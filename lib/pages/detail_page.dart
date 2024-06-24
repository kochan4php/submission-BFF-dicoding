import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/detail_page/detail_page_body.dart';

class DetailPage extends StatelessWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DetailPageBody());
  }
}
