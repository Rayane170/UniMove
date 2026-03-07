import 'package:flutter/material.dart';

class ThemeOption extends StatelessWidget {
  const ThemeOption({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return Scaffold(
      appBar: AppBar(title: const Text("Mode sombre / clair")),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Mode sombre"),
            value: isDark,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}