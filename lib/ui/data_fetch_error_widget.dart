import 'package:flutter/material.dart';
import 'package:restaurant_app/enums/fetch_error_type.dart';
import 'package:restaurant_app/mixin/spacing.dart';

class DataFetchErrorWidget extends StatelessWidget with Spacing {
  final String message;
  final FetchErrorType fetchErrorType;

  const DataFetchErrorWidget({
    super.key,
    required this.message,
    this.fetchErrorType = FetchErrorType.noInet,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Icon(
            fetchErrorType == FetchErrorType.noInet
                ? Icons.signal_wifi_connected_no_internet_4_rounded
                : Icons.do_not_disturb_alt_rounded,
            size: 125,
          ),
          gap(y: 15),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
