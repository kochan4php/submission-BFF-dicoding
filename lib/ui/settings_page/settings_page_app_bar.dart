import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(title: const Text('Pengaturan'));

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
