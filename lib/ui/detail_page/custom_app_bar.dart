import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/favorite/favorite_provider.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomAppBar extends StatelessWidget {
  final FavoriteProvider provider;
  final Restaurant restaurant;

  const CustomAppBar({
    super.key,
    required this.provider,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            FutureBuilder(
              future: provider.isFavoriteed(restaurant.id),
              builder: (context, snapshot) {
                bool isBookmark = snapshot.data ?? false;
                String sentences =
                    !isBookmark ? 'ditambahkan ke' : 'dihapus dari';

                return CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      provider.setFavorite(restaurant);

                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: 'Berhasil $sentences daftar favorite',
                          backgroundColor: AppColors.primaryColor,
                        ),
                        displayDuration: const Duration(seconds: 1),
                      );
                    },
                    icon: Icon(
                      isBookmark ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
