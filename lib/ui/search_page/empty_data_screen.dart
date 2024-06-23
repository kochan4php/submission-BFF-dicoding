import 'package:flutter/material.dart';
import 'package:restaurant_app/data/providers/restaurant/search_restaurant_provider.dart';
import 'package:restaurant_app/ui/search_page/status_message_screen.dart';

class EmptyDataScreen extends StatelessWidget {
  final SearchRestaurantProvider provider;

  const EmptyDataScreen({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return StatusMessageScreen(
      provider: provider,
      icon: Icons.do_not_disturb_alt_rounded,
    );
  }
}
