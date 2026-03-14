import 'package:flutter/material.dart';
import '../../../../core/theme/theme_manager.dart';

class ThemeOption extends StatelessWidget {
  const ThemeOption({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mode sombre / clair"),
      ),

      body: ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (context, ThemeMode mode, child) {

          bool isDark = mode == ThemeMode.dark;

          return SwitchListTile(
            title: const Text("Mode sombre"),
            value: isDark,

            onChanged: (value) {
              themeNotifier.value =
                  value ? ThemeMode.dark : ThemeMode.light;
            },
          );
        },
      ),
    );
  }
}