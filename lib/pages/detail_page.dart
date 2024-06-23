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
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildBodyDetailPage(
        isFavorite: isFavorite,
        onPressed: handlePressedFavoriteButton,
      ),
    );
  }

  void handlePressedFavoriteButton() {
    setState(() => isFavorite = !isFavorite);

    String sentences = isFavorite ? 'ditambahkan ke' : 'dihapus dari';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil $sentences favorit'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class BuildBodyDetailPage extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const BuildBodyDetailPage({
    super.key,
    required this.isFavorite,
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
            return DataDetailRestaurant(
              provider: value,
              isFavorite: isFavorite,
              onPressed: onPressed,
            );
          case ResultState.noData:
          case ResultState.error:
          default:
            return DataFetchErrorWidget(
              message: value.message,
            );
        }
      },
    );
  }
}
