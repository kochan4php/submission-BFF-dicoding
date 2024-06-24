import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant/detail_restaurant_provider.dart';
import 'package:restaurant_app/enums/result_state.dart';
import 'package:restaurant_app/mixin/spacing.dart';
import 'package:restaurant_app/ui/data_fetch_error_widget.dart';
import 'package:restaurant_app/ui/detail_page/data_detail_restaurant.dart';
import 'package:restaurant_app/ui/loader.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with Spacing {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildBodyDetailPage(
        isBookmark: isBookmark,
        onPressed: handlePressedFavoriteButton,
      ),
    );
  }

  void handlePressedFavoriteButton() {
    setState(() => isBookmark = !isBookmark);

    String sentences = isBookmark ? 'ditambahkan ke' : 'dihapus dari';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil $sentences favorit'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class BuildBodyDetailPage extends StatelessWidget {
  final bool isBookmark;
  final VoidCallback onPressed;

  const BuildBodyDetailPage({
    super.key,
    required this.isBookmark,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(
      builder: (
        BuildContext context,
        DetailRestaurantProvider value,
        Widget? child,
      ) {
        ResultState state = value.state;

        switch (state) {
          case ResultState.loading:
            return const Loader();
          case ResultState.hasData:
            return DataDetailRestaurant(provider: value);
          case ResultState.noData:
          case ResultState.error:
          default:
            return DataFetchErrorWidget(message: value.message);
        }
      },
    );
  }
}
