import 'package:flutter/material.dart';
import 'package:restaurant_app/mixin/spacing.dart';

class DataFetchErrorWidget extends StatelessWidget with Spacing {
  final String message;

  const DataFetchErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.signal_wifi_connected_no_internet_4_rounded,
              size: 125,
            ),
            gap(y: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
