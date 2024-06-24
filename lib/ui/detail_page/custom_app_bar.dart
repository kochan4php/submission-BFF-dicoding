import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/data/providers/bookmark/bookmark_provider.dart';

class CustomAppBar extends StatelessWidget {
  final BookmarkProvider provider;
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
              future: provider.isBookmarked(restaurant.id),
              builder: (context, snapshot) {
                bool isBookmark = snapshot.data ?? false;
                String sentences =
                    !isBookmark ? 'ditambahkan ke' : 'dihapus dari';

                return CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      provider.setBookmark(restaurant);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Berhasil $sentences bookmark'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: Icon(
                      isBookmark ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.black,
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
