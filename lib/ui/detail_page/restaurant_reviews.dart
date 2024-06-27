import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/customer_review.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/themes/colors.dart';

class RestaurantReviews extends StatelessWidget with Spacing {
  final List<CustomerReview> customerReviews;

  const RestaurantReviews({
    super.key,
    required this.customerReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < customerReviews.length; i++) ...[
          Card.outlined(
            color: AppColors.veryLightPrimaryColor,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('"${customerReviews[i].review}"'),
                    gap(y: 10),
                    Text(
                      'Oleh ${customerReviews[i].name}, ${customerReviews[i].date}',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Only add spacing if it's not the last item
          if (i != customerReviews.length - 1) gap(y: 6),
        ],
      ],
    );

    // return Column(
    //   children: customerReviews.map((customerReview) {
    //     return Card.outlined(
    //       color: AppColors.veryLightPrimaryColor,
    //       child: ConstrainedBox(
    //         constraints: const BoxConstraints(minWidth: double.infinity),
    //         child: Padding(
    //           padding: const EdgeInsets.all(12),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: <Widget>[
    //               Text('"${customerReview.review}"'),
    //               gap(y: 10),
    //               Text('Oleh ${customerReview.name}, ${customerReview.date}'),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // );
  }
}
