import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant/schedule_restaurant_provider.dart';
import 'package:restaurant_app/data/providers/shared_prefs/shared_prefs_provider.dart';
import 'package:restaurant_app/themes/colors.dart';

class SettingsPageBody extends StatelessWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: const Text(
              'Mode Gelap',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Switch(
              value: false,
              activeColor: AppColors.primaryColor,
              onChanged: (bool value) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pemberitahuan'),
                      content: const Text(
                        'Fitur mode gelap sedang dalam tahap pengembangan!',
                      ),
                      backgroundColor: Colors.white,
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Notifikasi Rekomendasi',
              style: TextStyle(fontSize: 17),
            ),
            subtitle: const Text(
              'Dapatkan rekomendasi restoran setiap harinya',
            ),
            isThreeLine: true,
            trailing:
                Consumer2<SharedPrefsProvider, ScheduleRestaurantProvider>(
              builder: (
                BuildContext context,
                SharedPrefsProvider sharedPrefsProvider,
                ScheduleRestaurantProvider scheduleRestaurantProvider,
                Widget? child,
              ) {
                return Switch(
                  value:
                      sharedPrefsProvider.isDailyRecommendationRestaurantActive,
                  activeColor: AppColors.primaryColor,
                  onChanged: (bool value) async {
                    await sharedPrefsProvider
                        .setDailyRecommendationRestaurant(value);

                    await scheduleRestaurantProvider
                        .scheduledRecommendation(value);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
